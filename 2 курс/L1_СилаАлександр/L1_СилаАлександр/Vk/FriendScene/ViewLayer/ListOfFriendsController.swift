
import UIKit

class ListOfFriendsController: UITableViewController {
    
    private let localService = LocalLoaderFriend()
    var sortedFriends = [Character: [LocalFriendModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CellForList", bundle: nil), forCellReuseIdentifier: "CellForList")
        
        self.sortedFriends = sort(friends: localService.friends)
    }
    
    private func sort(friends: [LocalFriendModel]) -> [Character: [LocalFriendModel]] {
        
        var friendsDict = [Character: [LocalFriendModel]]()
        
        friends.forEach() {friend in
            
            guard let firstChar = friend.name.first else {return}
            
            if var thisCharFriends = friendsDict[firstChar] {
                thisCharFriends.append(friend)
                friendsDict[firstChar] = thisCharFriends
            } else {
                friendsDict[firstChar] = [friend]
            }
            
        }
        return friendsDict
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sortedFriends.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let keySorted = sortedFriends.keys.sorted()
        
        let friends = sortedFriends[keySorted[section]]?.count ?? 0
        
        return friends
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForList", for: indexPath) as? CellForList else {
            preconditionFailure("Error")
        }
        
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        
        let friend = friends[indexPath.row]
        
        cell.labelForList.text = friend.name
        cell.avaImageForList.image = friend.image


        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FriendFromList",
//           let destinationVC = segue.destination as? FriendInfoVeiwController,
//           let indexPath = tableView.indexPathForSelectedRow
//        {
//            let friends = friends[indexPath.row].name
//            destinationVC.title = friends
//        }
//    }

}
