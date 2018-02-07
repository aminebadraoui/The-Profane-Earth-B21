//
//  PoemEngVC.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//



import UIKit

class PoemVC: UIViewController {
    
    @IBOutlet weak var poemLine: UILabel!
    var timer = Timer()
    var count = 61
    var textCounter = 0
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }

    

    let poemEng:[String] = [Poem.LINE1_ENG,Poem.LINE2_ENG,Poem.LINE3_ENG,Poem.LINE4_ENG]
    let poemFR:[String] = [Poem.LINE1_FR,Poem.LINE2_FR,Poem.LINE3_FR,Poem.LINE4_FR]
    
    
    
    override func viewDidLoad() {
        self.poemLine.alpha = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaser), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    @objc func decreaser() {
        count-=1
        print(count)
        if(Language.lang == .French){
            if(count%3==0){
                if (textCounter+1>poemFR.count) {
                    timer.invalidate()
                    navigationController?.popViewController(animated: false)
                }
                    
                else {
                    print(textCounter)
                    display(text: poemFR[textCounter])
                    
                    textCounter+=1
                }
            }
        }
        
        if(Language.lang == .English){
            if(count%3==0){
                if (textCounter+1>poemEng.count) {
                    timer.invalidate()
                    navigationController?.popViewController(animated: false)
                }
                    
                else {
                    print(textCounter)
                    display(text: poemEng[textCounter])
                    
                    textCounter+=1
                }
            }
            
        }
    
    }
    
    func display(text:String){
        self.poemLine.text = text
        self.poemLine.fadeIn(completion: {
            (finished:Bool) -> Void in
            self.poemLine.fadeOut()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
}

