//
//  Movie.swift
//  AdvancedWorkshop
//
//  Created by Siraj Zaneer on 3/24/17.
//  Copyright © 2017 sirajzaneer.com. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var name: String!
    var imageURL: URL!
    var summary: String!
    var price: String!
    var url: URL!
    
    init(info: NSDictionary) {
        let nameInfo = info["im:name"] as! NSDictionary
        name = nameInfo["label"] as! String
        let images = info["im:image"] as! NSArray
        let image = images[2] as! NSDictionary
        imageURL = URL(string: image["label"] as! String)
        let summaryInfo = info["summary"] as! NSDictionary
        summary = summaryInfo["label"] as! String
        let priceInfo = info["im:price"] as! NSDictionary
        price = priceInfo["label"] as! String
    }
}
