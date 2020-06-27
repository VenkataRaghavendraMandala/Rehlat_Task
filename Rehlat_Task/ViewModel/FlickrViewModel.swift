//
//  FlickrViewModel.swift
//  Rehlat_Task
//
//  Created by Apple on .
//  Copyright © 1942 Raghava. All rights reserved.
//

import Foundation
import UIKit

class FlickrViewModel {
    func getFlickrDataFromServer(completion: @escaping(_ data: FlickrModel) -> Void) {
        NetworkManager.shared.getFlickrDataFromServerMethod(url: FlickrAPI.flickrUrl, parameters: [:], completion: { (responseData) in
            print(responseData)
            print(responseData.photos)
            print(responseData.photos?.photo)
            completion(responseData)
        }) { (error) in
            print(error)
        }
    }
}
