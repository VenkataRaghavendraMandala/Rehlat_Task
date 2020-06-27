//
//  ViewController.swift
//  Rehlat_Task
//
//  Created by Apple on 03/04/1942 Saka.
//  Copyright © 1942 Raghava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var flickrCollectionView: UICollectionView!
    
    //MARK:- Variables
    var flickrModel: FlickrModel?
    var flickrViewModel = FlickrViewModel()
    
    //MARK:- ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadXibNibFile()
        DispatchQueue.global().async {
            self.getFlickrDataFromServer()
        }
    }
    
    //MARK:- Load XibNib Method
    func loadXibNibFile() {
        let detailsCellNib = UINib(nibName: CollectionViewCell.flickrCollectionViewCell, bundle: nil)
        self.flickrCollectionView.register(detailsCellNib, forCellWithReuseIdentifier: CollectionViewCell.flickrCollectionViewCell)
    }
    
    //MARK:- Get Flickr Data From Server Method
    func getFlickrDataFromServer() {
        self.flickrViewModel.getFlickrDataFromServer(completion: { (responseData) in
            self.flickrModel = responseData
            DispatchQueue.main.async {
                self.flickrCollectionView.delegate = self
                self.flickrCollectionView.dataSource = self
                self.flickrCollectionView.reloadData()
            }
        })
    }
}

//MARK:- UICollection Delegate and DataSorce Methods
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.flickrModel?.photos?.photo?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.flickrCollectionView.frame.size.width / 3 - 8, height: self.flickrCollectionView.frame.size.width / 3 - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.5, left: 0.5, bottom: 0.5, right: 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let  detailsCell = self.flickrCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.flickrCollectionViewCell, for: indexPath) as? FlickrCollectionViewCell else {
            return UICollectionViewCell()
        }
        let photoObj = self.flickrModel?.photos?.photo?[indexPath.row]
        detailsCell.titleLabel.text = photoObj?.title ?? ""
        detailsCell.photoObj = photoObj
        return detailsCell
    }
}
