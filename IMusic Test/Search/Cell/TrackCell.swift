//
//  TrackCell.swift
//  IMusic Test
//
//  Created by Роман on 21.03.2024.
//

import UIKit

protocol TrackCellViewModel {
    var iconUrlString: String? { get }
    var trackName: String { get }
    var artistName: String { get }
    var collectionName: String { get }
}

 class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    
     @IBOutlet weak var trackNameLabel: UILabel!
     @IBOutlet weak var artistNameLabel: UILabel!
     @IBOutlet weak var collectionNameLabel: UILabel!
     @IBOutlet weak var trackImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
     
     func set(viewModel: TrackCellViewModel) {
         trackNameLabel.text = viewModel.trackName
         artistNameLabel.text = viewModel.artistName
         collectionNameLabel.text = viewModel.collectionName
         
     }
}
