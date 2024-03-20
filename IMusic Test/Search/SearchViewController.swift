//
//  SearchViewController.swift
//  IMusic Test
//
//  Created by Роман on 18.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: class {
    func displayData(viewModel: Search.Model.ViewModel.ViewModelData)
}

class SearchViewController: UIViewController, SearchDisplayLogic {
    
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic)?
    
    @IBOutlet weak var table: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    private var searchViewModel = SearchViewModel.init(cells: [])
    private var timer: Timer?
    
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = SearchInteractor()
        let presenter             = SearchPresenter()
        let router                = SearchRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupTableView() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func displayData(viewModel: Search.Model.ViewModel.ViewModelData) {
        switch viewModel{
            
        case .some:
            print("viewcontroller .some")
        case .displayTracks(let searchViewModel):
            self.searchViewModel = searchViewModel
            table.reloadData()
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let cellViewModel = searchViewModel.cells[indexPath.row]
        
        cell.textLabel?.text = "\(cellViewModel.trackName)\n\(cellViewModel.artistName)"
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.image = .imageilly
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.interactor?.makeRequest(request: Search.Model.Request.RequestType.getTracks(searchTerm: searchText))
        })
        
    }
}
