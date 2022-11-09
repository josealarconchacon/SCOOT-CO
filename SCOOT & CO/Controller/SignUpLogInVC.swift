//
//  SignUpLogInVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/24/22.
//

import UIKit
import AVKit

class SignUpLogInVC: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        setVideoInBackground()
    }
    
    func setVideoInBackground() {
        // get path to the video resource in the bundle
        let path = Bundle.main.path(forResource: "production ID_4605500", ofType: "mp4")
        guard path != nil else {return}
        // create url from bundle path
        let urlPath = URL(fileURLWithPath: path!)
        // create a video player item
        let videoPlayerItem = AVPlayerItem(url: urlPath)
        // create video
        videoPlayer = AVPlayer(playerItem: videoPlayerItem)
        // create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        // set fram size
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5,
                                         y: 0,
                                         width: self.view.frame.size.width*4,
                                         height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        // play video
        videoPlayer?.playImmediately(atRate: 1.5)
    }
}
