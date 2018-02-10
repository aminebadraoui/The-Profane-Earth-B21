//
//  LangVC.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import AVFoundation

class LangVC: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        let url = Bundle.main.url(forResource: "video_bg_loop", withExtension: "mp4")
//        player = AVPlayer.init(url: url!)
//        
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
//        playerLayer.frame = view.layer.frame
//        
//        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
//        
//        player.play()
//        
//        view.layer.insertSublayer(playerLayer, at: 0)
//        
//       
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(resetPlayer),
//                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
//                                                         object: self.player.currentItem) // Add observer
   
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    
    func resetPlayer() {
        self.player.seek(to: kCMTimeZero)
        self.player.play()
    }
    
    @IBAction func pressedFrench(_ sender: Any) {
       Language.lang = .French
        performSegue(withIdentifier: "Start", sender: self)
    }
    
    
    @IBAction func pressedEnglish(_ sender: Any) {
        Language.lang = .English
        performSegue(withIdentifier: "Start", sender: self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
  
}
