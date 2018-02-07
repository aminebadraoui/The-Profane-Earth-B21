//
//  OmniCardboard.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import OmniVirtSDK

class OmniCardboard: UIViewController, VRPlayerDelegate {
    func playerLoaded(_ player: VRPlayer, withMaximumQuality maximum: Int, andCurrentQuality current: Quality, andCardboardMode mode: Mode) {
        player.cardboard = .On
         player.play()
       
      
        
    }
    
    func playerStarted(_ player: VRPlayer) {
        player.cardboard = .On
    }
    
    func playerPaused(_ player: VRPlayer) {
        
    }
    
    func playerEnded(_ player: VRPlayer) {
        
    }
    
    func playerSkipped(_ player: VRPlayer) {
        
    }
    
    func playerDurationChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerProgressChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerBufferChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerSeekChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerCardboardChanged(_ player: VRPlayer, withMode value: Mode) {
        
    }
    
    func playerVolumeChanged(_ player: VRPlayer, withLevel value: Double) {
        
    }
    
    func playerQualityChanged(_ player: VRPlayer, withQuality value: Quality) {
    
    }
    
    func playerExpanded(_ player: VRPlayer) {
        
    }
    
    func playerCollapsed(_ player: VRPlayer) {
        
    }
    
    func playerLatitudeChanged(_ player: VRPlayer, withLatitude value: Double) {
        
    }
    
    func playerLongitudeChanged(_ player: VRPlayer, withLongitude value: Double) {
        
    }
    
    func playerSwitched(_ player: VRPlayer, withScene name: String, withHistory history: [String]) {
        
    }
    
   
    
    
    @IBOutlet weak var player: VRPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register a callback
    
        // Load a content
       
        // Register a callback
        player.delegate = self
        // Load a content
        player.load(withContentID: 13216) // Replace with your Content ID
        // Set player parameter
        player.cardboard = .On
        
        // Replace with your Content ID
        // Set player parameter
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeLeft)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }

}
