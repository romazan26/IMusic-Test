//
//  SearchViewController.swift
//  IMusic Test
//
//  Created by Роман on 28.02.2024.
//

import UIKit
import Alamofire

struct TrackModel {
    var trackName: String
    var artist: String
}

class SearchViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let tracks = [TrackModel(trackName: "bad gay", artist: "Billi alysh"),
    TrackModel(trackName: "Bury", artist: "Billi alysh")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    private func setupSearchBar(){
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = tracks[indexPath.row]
        
        cell.textLabel?.text = "\(track.trackName)\n\(track.artist)"
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.image = .imageilly
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let url =  URL(string: "https://itunes.apple.com/search?term=\(searchText)")!
        AF.request(url).response { dataRespon in
            if let error = dataRespon.error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = dataRespon.data else {return}
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "")
        }
    }
}
