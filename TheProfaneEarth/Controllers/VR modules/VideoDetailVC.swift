//
//  PlayVC.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import Hero


class PlayVCSecond: UIViewController {

    var selectedVideo : Inspiration!

    @IBOutlet weak var imageBg: UIImageView!
 
    @IBOutlet weak var videoTitle: UILabel!
    
    @IBOutlet weak var line: UIView!
    
  
    @IBOutlet weak var excerpt: UILabel!
    
    @IBOutlet weak var playbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
videoTitle.text = selectedVideo.title
       
        imageBg.image = selectedVideo.backgroundImage
        imageBg.hero.id = selectedVideo.id
        
        imageBg.addBlurEffect()
        
        videoTitle.alpha = 0.0
        excerpt.alpha = 0.0
        line.alpha = 0.0
        playbtn.alpha = 0.0
        
        if(Language.lang == Lang.English){
           excerpt.text = VideoDesc.EXCERPT_ENG
        } else {
            excerpt.text = VideoDesc.EXCERPT_FR
        }
   
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        videoTitle.fadeIn()
        excerpt.fadeIn()
        line.fadeIn()
        playbtn.fadeIn()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destination = segue.destination as! ChoiceVC
        
        destination.selectedVideo = selectedVideo
       
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
         videoTitle.fadeOut()
    }
}


class Colors {
    let colorTop = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0)
    let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0)
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
 
}


