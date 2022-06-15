
import UIKit

class ListOfFriendsController: UITableViewController {
    
    private let localService = LocalLoaderFriend()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CellForList", bundle: nil), forCellReuseIdentifier: "CellForList")
        
        loadFriends()
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
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return localService.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForList", for: indexPath) as? CellForList else {
            preconditionFailure("Error")
        }
        
        cell.labelForList.text = localService.friends[indexPath.row].name
        cell.avaImageForList.image = localService.friends[indexPath.row].image


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sender: [String: Any?] = [
            "name": localService.friends[indexPath.row].name,
            "avatar": localService.friends[indexPath.row].image
        ]
        performSegue(withIdentifier: "SelectedRowCell", sender: sender)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SelectedRowCell" {
            
            let vc = segue.destination as! UserViewController
            let object = sender as! [String: Any?]
            vc.name = object["name"] as! String
            vc.avatar = object["avatar"] as? UIImage
        }
    }
    }
    
