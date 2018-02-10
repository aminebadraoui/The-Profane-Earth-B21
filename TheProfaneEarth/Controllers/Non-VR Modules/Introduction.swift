//
//  Introduction.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import AVFoundation
class Introduction: UIViewController {

    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    @IBOutlet weak var introLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "video_bg_loop", withExtension: "mov")
        player = AVPlayer.init(url: url!)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = self.view.layer.frame
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self,selector: #selector(resetPlayer),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,object: self.player.currentItem) // Add observer
        
        if(Language.lang == Lang.English){
            introLabel.text = Intro.INTRO_ENG
        } else {
            introLabel.text = Intro.INTRO_FR
        }
       // intro.text = Intro.INTRO_ENG
        // Do any additional setup after loading the view.
    }
    
    func resetPlayer() {
        self.player.seek(to: kCMTimeZero)
        self.player.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
