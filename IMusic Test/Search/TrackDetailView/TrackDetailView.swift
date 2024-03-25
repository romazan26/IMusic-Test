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
    
    //MARK: - @IBOutlet
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
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let scale: CGFloat = 0.8
        trackImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        trackImageView.layer.cornerRadius = 5
        trackImageView.backgroundColor = .red
    }
  
  //MARK: - Setup
    func set(viewModel: SearchViewModel.Cell){
        trackTitleLabel.text = viewModel.trackName
        authortitleLabel.text = viewModel.artistName
        playTrack(previewUrl: viewModel.previewUrl)
        let string600 = viewModel.iconUrlString?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else {return}
        trackImageView.sd_setImage(with: url)
        monitorStartTime()
        
    }
    
    private func playTrack(previewUrl: String?){
        guard let url = URL(string: previewUrl ?? "") else {return}
        let playerItem = AVPlayerItem(url: url)
        
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    //MARK: - TimeSetup
    private func monitorStartTime(){
        
        let time = CMTimeMake(value: 1, timescale: 3)
        let times = [NSValue(time: time)]
        player.addBoundaryTimeObserver(forTimes: times, queue: .main) { [weak self] in
            self?.enlargeTrackImageView()
        }
    }
    
    //MARK: - Animations
    private func enlargeTrackImageView(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.trackImageView.transform = .identity
        } completion: { _ in}
    }
    
    private func reduceTrackImageView(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut) {
            let scale: CGFloat = 0.8
            self.trackImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        } completion: { _ in}
    }
    
    //MARK: - @IBAction
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
            enlargeTrackImageView()
        } else {
            player.pause()
            playPauseButton.setImage(.play, for: .normal)
            reduceTrackImageView()
        }
        
    }
    
}
