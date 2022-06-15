//
//  LocalLoaderUserScene.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 08.06.2022.
//

import UIKit

final class LocalLoaderUserScene {
    
    let userData = UserData(userFriends:
                                [UserFriends(image: UIImage(named: "friendsAvatar/Alekseev"), firstName: "Ivan", lastName: "Alekseev"),
                                 UserFriends(image: UIImage(named: "friendsAvatar/Cobain"), firstName: "Kurt", lastName: "Cobain"),
                                 UserFriends(image: UIImage(named: "friendsAvatar/Joseph"), firstName: "Tyler", lastName: "Joseph"),
                                 UserFriends(image: UIImage(named: "friendsAvatar/Sheeran"), firstName: "Ed", lastName: "Sheeran"),
                                 UserFriends(image: UIImage.init(named: "friendsAvatar/Sinatra"), firstName: "Frank", lastName: "Sinatra"),
                                 UserFriends(image: UIImage.init(named: "friendsAvatar/Rutherford"), firstName: "Jesse", lastName: "Rutherford")],
                            userPhotos: ["News_Tyler-the-Creator",
                                         "friendsAvatar/Sheeran",
                                         "groupsAvatar/Rock",
                                         "friendsAvatar/Rutherford",
                                         "News_bah",
                                         "groupsAvatar/Classical",
                                         "friendsAvatar/Alekseev"],
                            userNews: [UserNews(avatarImage: nil, name: "", timeOfPublication: "", image: nil, text: ""),
                                       UserNews(avatarImage: nil, name: "", timeOfPublication: "", image: nil, text: ""),
                                       UserNews(avatarImage: nil, name: "", timeOfPublication: "", image: nil, text: ""),
                                       UserNews(avatarImage: UIImage(named: "friendsAvatar/Alekseev"), name: "no name", timeOfPublication: "today 10:50", image: UIImage(named: "News_Tyler-the-Creator"), text: "test"),
                                       UserNews(avatarImage: UIImage(named: "friendsAvatar/Alekseev"), name: "no name", timeOfPublication: "today 10:50", image: UIImage(named: "News_Tyler-the-Creator"), text: "test"),
                                       UserNews(avatarImage: UIImage(named: "friendsAvatar/Alekseev"), name: "no name", timeOfPublication: "today 10:50", image: UIImage(named: "News_Tyler-the-Creator"), text: "test"),
                                       UserNews(avatarImage: UIImage(named: "friendsAvatar/Alekseev"), name: "no name", timeOfPublication: "today 10:50", image: UIImage(named: "News_Tyler-the-Creator"), text: "test")])
}
