//
//  ViewController.swift
//  virtualapp
//
//  Created by Amine Badraoui on 2017-10-12.
//  Copyright © 2017 Amine Badraoui. All rights reserved.
//

import UIKit
import AVFoundation

class CreditVC: UIViewController {
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var lang = "EN"
    
    var timer = Timer()
    var count = 61
    var textCounter = 0
    let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
    

    var text = [String]()
    
    @IBOutlet weak var credit1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "video_bg_loop", withExtension: "mp4")
        player = AVPlayer.init(url: url!)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = view.layer.frame
        
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        player.play()
        
        view.layer.insertSublayer(playerLayer, at: 0)
        
        self.credit1.alpha = 0
        if(Language.lang == .English){
            text.append(Credit.OLLIVIER_CREDIT_ENG)
        }
        else {
            text.append(Credit.OLLIVIER_CREDIT_FR)
        }
        
     
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaser), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func decreaser() {
        count-=1
        print(count)
        if(count%5==0){
            if (textCounter+1>text.count) {
                timer.invalidate()
                let vc = self.myStoryboard.instantiateViewController(withIdentifier: "GeneralMenuVC") as! GeneralMenuVC
                vc.modalTransitionStyle = .crossDissolve
                self.navigationController?.pushViewController(vc, animated: false)
            }
                
            else {
                print(textCounter)
                display(text: text[textCounter])
                textCounter+=1
                
            }
        }
        
    }
    
    func display(text:String){
        self.credit1.text = text
        self.credit1.fadeIn(completion: {
            (finished:Bool) -> Void in
            self.credit1.fadeOut()
            
            
        })
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    
}


