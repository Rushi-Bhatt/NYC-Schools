//
//  HomeViewController.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModelProtocol
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SchoolOverviewCell.self, forCellReuseIdentifier: SchoolOverviewCell.cellIdentifier)
        tableView.tableFooterView = nil
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.refreshControl = refreshControl
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = true
        return activityIndicator
    }()
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadSchools()
    }
    
    private func loadSchools() {
        updateView(isLoading: true)
        viewModel.reload { [weak self] result in
            DispatchQueue.main.async {
                self?.updateView(isLoading: false)
                self?.tableView.reloadData()
                if case .failure(let error) = result {
                    showToast(controller: self, message: error.localizedDescription)
                }
            }
        }
    }
}

//MARK: Extension
private extension HomeViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = LocalizationHelper.localize(key: "HomeViewController.navigationBar.title")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
    private func updateView(isLoading: Bool) {
        tableView.isUserInteractionEnabled = !isLoading
        activityIndicator.isHidden = !isLoading
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            refreshControl.endRefreshing()
        }
    }
    
    @objc private func refreshData(_ sender: Any) {
        loadSchools()
    }
}

//MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard viewModel.schools.indices.contains(indexPath.row),
              let cell = tableView.dequeueReusableCell(withIdentifier: SchoolOverviewCell.cellIdentifier, for: indexPath) as? SchoolOverviewCell else { return UITableViewCell() }
        
        let cellViewModel = viewModel.schoolOverviewCellViewModels[indexPath.row]
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

//MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.navigateToDetailsViewController(for: indexPath.row)
    }
}
