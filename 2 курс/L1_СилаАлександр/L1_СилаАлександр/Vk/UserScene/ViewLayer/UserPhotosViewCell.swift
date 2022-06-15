//
//  UserPhotosViewCell.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 10.06.2022.
//

import UIKit

class UserPhotosViewCell: UICollectionViewCell {
    
    
    @IBOutlet var userPhoto: UIImageView!
    
    public func createImage(_ imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else { return UIImage(systemName: "person")! }
        return image
    }
}
