
import UIKit

class ListOfFriendsController: UITableViewController {
    
    let friends = [
        Friend(image: UIImage.init(named: "Cobain"), name: "Kurt Cobain"),
        Friend(image: UIImage.init(named: "Alekseev"), name: "Ivan Alekseev"),
        Friend(image: UIImage.init(named: "Sinatra"), name: "Frank Sinatra"),
        Friend(image: UIImage.init(named: "Rutherford"), name: "Jesse Rutherford"),
        Friend(image: UIImage.init(named: "Sheeran"), name: "Ed Sheeran"),
        Friend(image: UIImage.init(named: "Joseph"), name: "Tyler Joseph"),
        Friend(image: UIImage.init(named: "Dun"), name: "Josh Dun")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            preconditionFailure("FriendCell cannot")
        }
        
        cell.labelFriendCell.text = friends[indexPath.row].name
        cell.imageFriendCell.image = friends[indexPath.row].image


        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendFromList",
           let destinationVC = segue.destination as? FriendInfoVeiwController,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let friends = friends[indexPath.row].name
            destinationVC.title = friends
        }
    }

}
