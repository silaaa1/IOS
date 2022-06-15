//
//  LocalUserFriendsModel.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 08.06.2022.
//

import UIKit

struct UserFriends {
    
    let image: UIImage?
    let firstName: String
    let lastName: String
}

struct UserNews {
    
    let avatarImage: UIImage?
    let name: String
    let timeOfPublication: String
    let image: UIImage?
    let text: String
}

struct UserData {
    
    let userFriends: [UserFriends]
    let userPhotos: [String]
    let userNews: [UserNews]
}
