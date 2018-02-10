//
//  Inspiration.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import Foundation
import UIKit
import Hero

class Inspiration:Session{
    

    class func allInspirations() -> [Inspiration] {
        var inspirations = [Inspiration]()
        var inspirationName = "inspirations"
        if (Language.lang == .English){
            inspirationName = "InspirationsEng"
        }else {
            inspirationName = "InspirationsFR"
        }
        if let URL = Bundle.main.url(forResource: inspirationName, withExtension: "plist") {
            if let tutorialsFromPlist = NSArray(contentsOf: URL) {
                for dictionary in tutorialsFromPlist {
                    let inspiration = Inspiration(dictionary: dictionary as! NSDictionary)
                    inspirations.append(inspiration)
                }
            }
        }
        return inspirations
    }

}
