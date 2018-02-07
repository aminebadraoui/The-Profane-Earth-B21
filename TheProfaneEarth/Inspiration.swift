//
//  Inspiration.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import Foundation
import UIKit

class Inspiration:Session{
    class func allInspirations() -> [Inspiration] {
        var inspirations = [Inspiration]()
        if let URL = Bundle.main.url(forResource: "Inspirations", withExtension: "plist") {
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
