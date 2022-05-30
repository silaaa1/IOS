//
//  LocalLoaderMoments.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 30.05.2022.
//

import UIKit

final class LocalLoaderHomeScene {
    
    let moments = [
        Moments(image: UIImage(named: "friendsAvatar/Alekseev"), name: "Ivan"),
        Moments(image: UIImage(named: "friendsAvatar/Cobain"), name: "Kurt"),
        Moments(image: UIImage(named: "groupsAvatar/HipHop"), name: "HipHop"),
        Moments(image: UIImage(named: "groupsAvatar/Pop"), name: "Pop"),
        Moments(image: UIImage(named: "friendsAvatar/Joseph"), name: "Tyler"),
        Moments(image: UIImage(named: "groupsAvatar/Jazz"), name: "Jazz"),
        Moments(image: UIImage(named: "groupsAvatar/Rock"), name: "Rock"),
        Moments(image: UIImage(named: "friendsAvatar/Sheeran"), name: "Ed"),
        Moments(image: UIImage(named: "groupsAvatar/Alternative"), name: "Alternative")
    ]
    
    let news = [
        News(avatarImage: UIImage(named: "groupsAvatar/HipHop"), name: "HipHop", timeOfPublication: "today 10:50", text: "test", image: UIImage(named: "News_Tyler-the-Creator")),
        News(avatarImage: UIImage(named: "friendsAvatar/Sheeran"), name: "Ed Sheeran", timeOfPublication: "today 10:30", text: "Сover of my new album!", image: UIImage(named: "News_ed album")),
        News(avatarImage: UIImage(named: "groupsAvatar/Rock"), name: "Rock", timeOfPublication: "yesterday 21:48", text: "test", image: UIImage(named: "News_linkin-park")),
        News(avatarImage: UIImage(named: "friendsAvatar/Rutherford")!, name: "Jesse Rutherford", timeOfPublication: "yesterday 21:15", text: "test", image: UIImage(named: "News_Jesse")),
        News(avatarImage: UIImage(named: "friendsAvatar/Alekseev")!, name: "Ivan Alekseev", timeOfPublication: "yesterday 15:21", text: "Exit to the city.", image: UIImage(named: "News_exit to the city")),
        News(avatarImage: UIImage(named: "groupsAvatar/Classical"), name: "Classical", timeOfPublication: "yesterday 13:06", text: "test", image: UIImage(named: "News_bah"))
    ]
}
