//
//  SplashScreenVC.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//

import UIKit

class SplashScreenVC: UIViewController {

    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        perform(#selector(showNavController), with: nil, afterDelay: 3)
       // UIApplication.shared.beginIgnoringInteractionEvents()

        // Do any additional setup after loading the view.
    }

    func showNavController() {
        performSegue(withIdentifier: "showApp", sender: self)
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

}
