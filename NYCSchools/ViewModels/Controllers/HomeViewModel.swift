//
//  HomeViewModel.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var schools: [School] { get }
    var satDetails: [SchoolSATDetail] { get }
    var schoolOverviewCellViewModels: [SchoolOverviewCellViewModel] { get set }
    func reload(_ completion: @escaping (Result<Void, Error>) -> ())
    func navigateToDetailsViewController(for: Int)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let service: SchoolServiceProtocol
    private let router: RouterProtocol
    var schools: [School] = []
    var satDetails: [SchoolSATDetail] = []
    var schoolOverviewCellViewModels: [SchoolOverviewCellViewModel] = []
    
    init(service: SchoolServiceProtocol, router: RouterProtocol) {
        self.service = service
        self.router = router
    }
    
    //TODO: Ideally these orchestration of multiple calls should happen at the repository level
    //TODO: add ability to allow multiple error types, one for each service
    
    func reload(_ completion: @escaping (Result<Void, Error>) -> ()) {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        var serviceError: ServiceError?
        
        service.getSchools { [weak self] (result: Result<[School], ServiceError>) in
            switch result {
            case .success(let schools):
                self?.schools = schools
                self?.makeCellViewModels()
                dispatchGroup.leave()
            case .failure(let error):
                serviceError = error
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        service.getSchoolSATDetails { [weak self] (result: Result<[SchoolSATDetail], ServiceError>) in
            switch result {
            case .success(let satDetails):
                self?.satDetails = satDetails
                dispatchGroup.leave()
            case .failure(let error):
                serviceError = error
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.global()) {
            if let serviceError = serviceError { completion(.failure(serviceError)) }
            completion(.success(()))
        }
    }
    
    func navigateToDetailsViewController(for index: Int) {
        let school = schools[index]
        let satDetail: SchoolSATDetail? = satDetails.filter { $0.dbn == school.dbn }.first
        router.navigateToDetailsViewController(school: school,
                                               satDetail: satDetail)
    }
}

//MARK: Extension
extension HomeViewModel {
    private func makeCellViewModels() {
        schools.forEach { [weak self] in
            guard let self = self else { return }
            let schoolOverviewCellViewModel = SchoolOverviewCellViewModel(service: self.service, router: self.router)
            schoolOverviewCellViewModel.configure(with: $0)
            schoolOverviewCellViewModels.append(schoolOverviewCellViewModel)
        }
    }
}
