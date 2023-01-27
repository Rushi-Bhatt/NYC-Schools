//
//  SchoolDetailsViewController.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/24/23.
//

import UIKit

final class SchoolDetailsViewController: UIViewController {
    
    private let viewModel: SchoolDetailsViewModel
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var parentStackView: VStackView = {
        let parentStackView = VStackView()
        parentStackView.distribution = .fill
        parentStackView.spacing = 20
        parentStackView.alignment = .leading
        parentStackView.isUserInteractionEnabled = true
        parentStackView.isLayoutMarginsRelativeArrangement = true
        return parentStackView
    }()
    
    //MARK: SAT Section
    private var satScoreSectionTitle: SectionTitleLabel = {
        let titleLabel = SectionTitleLabel()
        return titleLabel
    }()
    
    private var satScoreReading: BodyLabel = {
        let satScoreReading = BodyLabel()
        return satScoreReading
    }()
    
    private var satScoreMath: BodyLabel = {
        let satScoreMath = BodyLabel()
        return satScoreMath
    }()
    
    private var satScoreWriting: BodyLabel = {
        let satScoreWriting = BodyLabel()
        return satScoreWriting
    }()
    
    private var satScoreSection: VStackView = {
        let contactStackView = VStackView()
        return contactStackView
        
    }()
    
    //MARK: Overview Section
    private var overviewSectionTitle: SectionTitleLabel = {
        let titleLabel = SectionTitleLabel()
        return titleLabel
    }()
    
    private var overviewSectionBody: UITextView = {
        let overviewSectionBody = UITextView()
        overviewSectionBody.isEditable = false
        overviewSectionBody.isSelectable = false
        overviewSectionBody.translatesAutoresizingMaskIntoConstraints = false
        return overviewSectionBody
    }()
    
    private var overviewSection: VStackView = {
        let contactStackView = VStackView()
        return contactStackView
        
    }()
    
    //MARK: Contact Us Section
    private var contactSectionTitle: SectionTitleLabel = {
        let titleLabel = SectionTitleLabel()
        return titleLabel
    }()
    
    private var addressLabel: BodyLabel = {
        let addressLabel = BodyLabel()
        return addressLabel
    }()
    
    private var phoneLabel: BodyLabel = {
        let phoneLabel = BodyLabel()
        return phoneLabel
    }()
    
    private var websiteLabel: BodyLabel = {
        let websiteLabel = BodyLabel()
        return websiteLabel
    }()
    
    private var contactSection: VStackView = {
        let contactStackView = VStackView()
        return contactStackView
        
    }()
    
    init(viewModel: SchoolDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureData()
    }
}

//MARK: Extension
private extension SchoolDetailsViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = LocalizationHelper.localize(key: "SchoolDetailsViewController.navigationBar.title")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        [satScoreSectionTitle, satScoreMath, satScoreReading, satScoreWriting].forEach { satScoreSection.addArrangedSubview($0) }
        
        [overviewSectionTitle, overviewSectionBody].forEach { overviewSection.addArrangedSubview($0) }
        
        [contactSectionTitle, addressLabel, phoneLabel, websiteLabel].forEach { contactSection.addArrangedSubview($0) }
        
        [satScoreSection, overviewSection, contactSection].forEach { parentStackView.addArrangedSubview($0) }
        
        satScoreSection.setCustomSpacing(15, after: satScoreSectionTitle)
        overviewSection.setCustomSpacing(15, after: overviewSectionTitle)
        contactSection.setCustomSpacing(15, after: contactSectionTitle)
        scrollView.addSubview(parentStackView)
        view.addSubview(scrollView)
        
        [satScoreSection, overviewSection, contactSection].forEach {
            NSLayoutConstraint.activate([
                parentStackView.widthAnchor.constraint(equalTo: $0.widthAnchor),
            ])
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            parentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            parentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            parentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            parentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            parentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
        ])
    }
    
    private func configureData() {
        satScoreSectionTitle.text = viewModel.satSectionTitle
        satScoreMath.text = viewModel.satMathLabel
        satScoreReading.text = viewModel.satReadingLabel
        satScoreWriting.text = viewModel.satWritingLabel
        
        overviewSectionTitle.text = viewModel.overviewSectionTitle
        print("Overview", viewModel.overView!)
        overviewSectionBody.text = viewModel.overView!
        
        contactSectionTitle.text = viewModel.contactSectionTitle
        addressLabel.text = viewModel.addressLabel
        phoneLabel.text = viewModel.phoneLabel
        websiteLabel.text = viewModel.websiteLabel
    }
}
