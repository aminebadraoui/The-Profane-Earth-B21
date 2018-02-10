//
//  Session.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import Foundation
import UIKit

class Session{
    
    var title: String
    var id: String
    var room: String
    var time: String
    var backgroundImage: UIImage
    
    var roomAndTime:String{
        get{
            return "\(time) • \(room)"
        }
    }
   
    init(title:String, id:String, room:String, time:String, backgroundImage:UIImage){
        self.title = title
        self.id = id
        self.room = room
        self.time = time
        self.backgroundImage = backgroundImage
    }
    
    convenience init (dictionary:NSDictionary){
        let title = dictionary["Title"] as? String
        let id = dictionary["id"] as? String
        let room = dictionary["Room"] as? String
        let time = dictionary["Time"] as? String
        let backgroundName =  dictionary["Background"] as? String
        let backgroundImage = UIImage.init(named: backgroundName!)
        
        self.init(title: title!, id: id!, room: room!, time: time!, backgroundImage: (backgroundImage?.decompressedImage)!)
    }
    
}
