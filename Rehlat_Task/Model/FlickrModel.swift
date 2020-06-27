//
//  FlickrModel.swift
//  Rehlat_Task
//
//  Created by Apple on .
//  Copyright © 1942 Raghava. All rights reserved.
//

import Foundation
import UIKit

struct FlickrModel: Decodable {
    var stat: String?
    var photos: photos?
}

struct photos: Decodable {
    var photo:[photo]?
}

struct photo: Decodable {
    var id:String?
    var owner:String?
    var secret:String?
    var server:String?
    var farm:Int?
    var title:String?
    var ispublic:Int?
    var isfriend:Int?
    var isfamily:Int?
}




