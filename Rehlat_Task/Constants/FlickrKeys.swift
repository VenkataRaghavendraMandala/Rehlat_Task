//
//  FlickrKeys.swift
//  Rehlat_Task
//
//  Created by Apple on .
//  Copyright © 1942 Raghava. All rights reserved.
//

import Foundation
import UIKit

struct FlickrAPI {
    static var flickrUrl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=06d56a220ad13f7104237d57ace4ec86&format=json&nojsoncallback=1&safe_search=1&text=kittens"
}

struct StoryBoards {
    static var mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
}

struct CollectionViewCell {
    static var flickrCollectionViewCell = "FlickrCollectionViewCell"
}
