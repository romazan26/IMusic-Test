//
//  TrackDetailView.swift
//  IMusic Test
//
//  Created by Роман on 22.03.2024.
//

import UIKit
import SDWebImage
import AVKit

final class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authortitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trackImageView.backgroundColor = .red
    }
  
  //MARK: - Set
    func set(viewModel: SearchViewModel.Cell){
        trackTitleLabel.text = viewModel.trackName
        authortitleLabel.text = viewModel.artistName
        playTrack(previewUrl: viewModel.previewUrl)
        let string600 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else {return}
        trackImageView.sd_setImage(with: url)
        
    }
    
    //MARK: - playTrack
    private func playTrack(previewUrl: String?){
        guard let url = URL(string: previewUrl ?? "") else {return}
        let playerItem = AVPlayerItem(url: url)
        
        player.replaceCurrentItem(with: playerItem)
        player.play()
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
    
    //MARK: - playPauseAction
    @IBAction func playPauseAction(_ sender: Any) {
        if player.timeControlStatus == .paused{
            player.play()
            playPauseButton.setImage(.pause, for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(.play, for: .normal)
        }
        
    }
    
}
