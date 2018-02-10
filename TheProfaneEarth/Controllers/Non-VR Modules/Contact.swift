//
//  Contact.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-09.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//

import UIKit


class Contact: UIViewController {

    

    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          if(Language.lang == .English){
            contactLabel.text = ContactInfo.CONTACT_ENG
          } else{
            contactLabel.text = ContactInfo.CONTACT_FR
        }
        
     
        
        // Do any additional setup after loading the view.
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
