//
//  Flickr CollectionViewCell.swift
//  Rehlat_Task
//
//  Created by Apple on 03/04/1942 Saka.
//  Copyright © 1942 Raghava. All rights reserved.
//

import UIKit

class FlickrCollectionViewCell: UICollectionViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Variables
    var photoObj: photo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.loadImagesMethod(farm: "\(self.photoObj?.farm ?? 0)", server: self.photoObj?.server ?? "", id: self.photoObj?.id ?? "", secret: self.photoObj?.secret ?? "")
        }
    }
    
    func loadImagesMethod(farm:String,server:String,id:String,secret:String)  {
        let flickrImageUrl = "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
        self.bannerImageView.downloadImage(from: flickrImageUrl)
    }

}
