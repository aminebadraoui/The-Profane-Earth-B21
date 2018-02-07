//
//  File.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import AVFoundation

class GeneralMenuVC: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    @IBOutlet weak var menuStack: UIStackView!
    @IBOutlet weak var titleStack: UIStackView!
    
    @IBOutlet weak var introBtn: UIButton!
    
    @IBOutlet weak var poemBtn: UIButton!
    
    
    
    @IBOutlet weak var creditsBtn: UIButton!
    
  
    @IBOutlet weak var vrBtn: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuStack.alpha = 0
        titleStack.alpha = 0
        
        let url = Bundle.main.url(forResource: "video_bg_loop", withExtension: "mp4")
        player = AVPlayer.init(url: url!)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = self.view.layer.frame
        
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        player.play()
        
        view.layer.insertSublayer(playerLayer, at: 0)
        
        
        
        if(Language.lang == .English){
            introBtn.setTitle(Menu.INTRO_ENG, for: .normal)
            poemBtn.setTitle(Menu.POEM_ENG, for: .normal)
            vrBtn.setTitle(Menu.VR_ENG, for: .normal)
            creditsBtn.setTitle(Menu.CREDIT_ENG, for: .normal)
            
        }
        else {
            introBtn.setTitle(Menu.INTRO_FR, for: .normal)
            poemBtn.setTitle(Menu.POEM_FR, for: .normal)
            vrBtn.setTitle(Menu.VR_FR, for: .normal)
            creditsBtn.setTitle(Menu.CREDIT_FR, for: .normal)
        }
   
        titleStack.fadeIn(completion: {
            (finished:Bool) -> Void in
            self.titleStack.fadeOut(completion: {
                (finished:Bool)-> Void in
                
                self.menuStack.fadeIn()
            })
            
            
            
            
            
            
        })
      
        
        
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
     
        
       
        
       
        
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
}

