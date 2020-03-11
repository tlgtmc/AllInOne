//
//  PhotosCollectionViewController.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit
import Toast_Swift
import ObjectMapper
import Kingfisher

class PhotosCollectionViewController: UICollectionViewController {
    
    
    var albumId: Int = -1
    var photoList: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        
        if NetworkHelper.isConnectedToInternet() {
            fetchPhotos()
        } else {
            self.collectionView.setEmptyTableView(false)
        }
    }
    
    func fetchPhotos() {
        self.showProgress()
        ApiHelper.Instance.call(url: Commons.URL_PHOTOS) { response in
            
            switch (response.result) {
            case .success:
                let _photos  = Mapper<Photo>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                self.photoList = _photos.filter{$0.albumId == self.albumId}
                if self.photoList.count == 0 {
                    self.collectionView.setEmptyTableView(true, "Photo list is empty", "You can try again later")
                }
                self.hideActiveProgress()
                self.collectionView.reloadData()
                print(self.photoList.count)
            case .failure( let error):
                self.hideActiveProgress()
                self.showError("Could not get the Album data. Please try again... Error: \(error)")
            }
        }
    }
    
    func setAlbumId(id: Int) {
        albumId = id
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let pic = photoList[indexPath.row]
        let imgUrl = URL(string: (pic.thumbnailUrl)!)
        cell.imageViewPhoto.kf.indicatorType = .activity
        cell.imageViewPhoto.kf.setImage(with: imgUrl)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing

        return CGSize(width:widthPerItem, height:150)
    }
}
