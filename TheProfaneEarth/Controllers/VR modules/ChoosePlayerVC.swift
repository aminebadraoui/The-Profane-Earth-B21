//
//  ChoiceVC.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//

import UIKit

import AVFoundation


class ChoiceVC: UIViewController {

    var selectedVideo : Inspiration!
    let videoURL = "https://s3.amazonaws.com/360degreemea/website video highlights 25.mp4"
    @IBOutlet weak var imageBg: UIImageView!
  
//    @IBOutlet weak var videoTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        videoTitle.text = selectedVideo.title
        imageBg.image = selectedVideo.backgroundImage
        imageBg.addBlurEffect()
        // Do any additional setup after loading the view.
    }
    @IBAction func triggerThreeSixty(_ sender: Any) {
        

        
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
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
