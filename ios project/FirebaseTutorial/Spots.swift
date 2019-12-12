//
//  Spots.swift
//  FirebaseTutorial
//
//  Created by kuet on 27/10/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SpotAra : Codable {
    let spotara : [Spots]
    init(spotara : [Spots]){
        self.spotara = spotara
    }
}

class Spots: Codable {
    let id : integer_t
    let name : String
    let description : String
    let imgurl : String
    let longitude : String
    let latitude : String
    let tourist : [String]
    
    init(id : integer_t,name : String,description : String, imgurl : String, latitude : String, longitude : String,tourist : [String]) {
        self.name = name
        self.id = id
        self.description = description
        self.imgurl = imgurl
        self.latitude = latitude
        self.longitude = longitude
        self.tourist = tourist
    }
}

