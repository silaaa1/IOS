//
//  UserFriendsTableViewCell.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 08.06.2022.
//

import UIKit

class UserFriendsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var localLoader = LocalLoaderUserScene()
    
    @IBOutlet var mutualFriends: UILabel!
    @IBOutlet var userFriendsCount: UILabel!
    @IBOutlet var userFriendsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userFriendsCollectionView.delegate = self
        userFriendsCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let userFriends = localLoader.userData.userFriends
        return userFriends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFriendsViewCell", for: indexPath) as! UserFriendsViewCell
        
        let userFriends = localLoader.userData.userFriends
        cell.configure(with: userFriends[indexPath.row])
        return cell
    }
}
