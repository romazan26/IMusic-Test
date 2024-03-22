//
//  TrackDetailView.swift
//  IMusic Test
//
//  Created by Роман on 22.03.2024.
//

import UIKit

final class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authortitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackImageView.backgroundColor = .red
    }
    
    
    
    @IBAction func dragDownButtonTapped(_ sender: Any) {
        self.removeFromSuperview()
        
    }
    
    @IBAction func handleCurrentTimeSlider(_ sender: Any) {
    }
    
    @IBAction func handleVolumeSlider(_ sender: Any) {
    }
    
    @IBAction func previousTrack(_ sender: Any) {
    }
    
    @IBAction func nextTrack(_ sender: Any) {
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
    }
    
}
