//
//  NetworkManager.swift
//  Rehlat_Task
//
//  Created by Apple on 03/04/1942 Saka.
//  Copyright © 1942 Raghava. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getFlickrDataFromServerMethod(url:String,parameters: [String:Any],completion: @escaping(_ data: FlickrModel) -> Void,failure:@escaping(String)->())  {
           
           let url : URL = URL(string: url)!
           let request: URLRequest = URLRequest(url:url)
           let config = URLSessionConfiguration.default
           let session = URLSession(configuration: config)
           
           let task = session.dataTask(with: request) { (data, response, error) in
               
               if(error != nil){
                   print(error?.localizedDescription ?? "")
               }
               else{
                  do {
                    let json = try JSONDecoder().decode(FlickrModel.self, from: data! )
                    print(json)
                    completion(json)
                  } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                    failure(error.localizedDescription)
                }
               }
           };
           task.resume()
       }
}

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(from imgURL: String) -> URLSessionDataTask? {
        guard let url = URL(string: imgURL) else { return nil }
        // set initial image to nil so it doesn't use the image from a reused cell
        image = nil
        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
            self.image = imageToCache
            return nil
        }
        // download the image asynchronously
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err)
                return
            }
            DispatchQueue.main.async {
                // create UIImage
                let imageToCache = UIImage(data: data!)
                // add image to cache
                imageCache.setObject(imageToCache!, forKey: imgURL as NSString)
                self.image = imageToCache
            }
        }
        task.resume()
        return task
    }
}

