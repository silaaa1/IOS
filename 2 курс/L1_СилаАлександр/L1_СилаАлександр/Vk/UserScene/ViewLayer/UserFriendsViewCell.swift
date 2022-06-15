//
//  UserFriendsViewCell.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 08.06.2022.
//

import UIKit

class UserFriendsViewCell: UICollectionViewCell {
    
    @IBOutlet var avatarViewCell: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    public func configure(with userFriends: UserFriends) {
        
        self.firstNameLabel.text = userFriends.firstName
        self.lastNameLabel.text = userFriends.lastName
        self.avatarViewCell.image = userFriends.image
    }
}
