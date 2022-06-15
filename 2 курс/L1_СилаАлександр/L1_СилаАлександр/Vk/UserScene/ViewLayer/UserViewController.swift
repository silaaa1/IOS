//
//  UserViewController.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 04.06.2022.
//

import UIKit


/// Таблица, отображающая авторизованному пользователю страницы друзей и других пользователей.
class UserViewController: UITableViewController {
    
    let localLoader = LocalLoaderUserScene()
    
    var name = ""
    var avatar: UIImage?
    @IBOutlet var userHeaderView: UIView!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.image = avatar
        userName.text = name
        
        tableView.register(UINib(nibName: "AnoutherNewsCell", bundle: nil), forCellReuseIdentifier: "AnoutherNewsCell")
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = localLoader.userData.userNews.count
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfo", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userFriends", for: indexPath) as! UserFriendsTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userPhotos", for: indexPath) as! UserPhotosTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnoutherNewsCell", for: indexPath) as! AnotherNewsCell
            
            cell.anotherNewsAvaImage.image = localLoader.userData.userNews[indexPath.row].avatarImage
            cell.anotherNewsImage.image = localLoader.userData.userNews[indexPath.row].image
            cell.anotherNewsName.text = localLoader.userData.userNews[indexPath.row].name
            cell.anotherNewsText.text = localLoader.userData.userNews[indexPath.row].text
            cell.anoutherNewsTime.text = localLoader.userData.userNews[indexPath.row].timeOfPublication
            return cell
        }
    }
}
