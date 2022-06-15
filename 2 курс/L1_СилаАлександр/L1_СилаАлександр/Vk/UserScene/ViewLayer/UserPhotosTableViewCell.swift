//
//  UserPhotosTableViewCell.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 10.06.2022.
//

import UIKit

class UserPhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let localLoader = LocalLoaderUserScene()
    
    @IBOutlet var userPhotosCount: UILabel!
    @IBOutlet var userPhotosCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userPhotosCollection.delegate = self
        userPhotosCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotosViewCell", for: indexPath) as! UserPhotosViewCell
        
        let namePhotos = localLoader.userData.userPhotos
        var userPhotos = [UIImage]()
        for namePhoto in namePhotos {
            let userPhoto = (UIImage(named: namePhoto) ?? UIImage(systemName: "person")!)
            userPhotos.append(userPhoto)
        }
        cell.userPhoto.image = userPhotos[indexPath.row]
        return cell
    }
}
