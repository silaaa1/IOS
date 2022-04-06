
import UIKit

class HomeTableViewController: UITableViewController {
    
    var moments = [
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
    
    var news = [
        News(avatarImage: UIImage(named: "groupsAvatar/HipHop"), name: "HipHop", timeOfPublication: "today 10:50", text: "test", image: UIImage(named: "News_Tyler-the-Creator")),
        News(avatarImage: UIImage(named: "friendsAvatar/Sheeran"), name: "Ed Sheeran", timeOfPublication: "today 10:30", text: "Сover of my new album!", image: UIImage(named: "News_ed album")),
        News(avatarImage: UIImage(named: "groupsAvatar/Rock"), name: "Rock", timeOfPublication: "yesterday 21:48", text: "test", image: UIImage(named: "News_linkin-park")),
        News(avatarImage: UIImage(named: "friendsAvatar/Rutherford")!, name: "Jesse Rutherford", timeOfPublication: "yesterday 21:15", text: "test", image: UIImage(named: "News_Jesse")),
        News(avatarImage: UIImage(named: "friendsAvatar/Alekseev")!, name: "Ivan Alekseev", timeOfPublication: "yesterday 15:21", text: "Exit to the city.", image: UIImage(named: "News_exit to the city")),
        News(avatarImage: UIImage(named: "groupsAvatar/Classical"), name: "Classical", timeOfPublication: "yesterday 13:06", text: "test", image: UIImage(named: "News_bah"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AnoutherNewsCell", bundle: nil), forCellReuseIdentifier: "AnoutherNewsCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MomentsTableViewCell", for: indexPath) as! MomentsTableViewCell
                cell.configure(with: moments)
                return cell
            }
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnoutherNewsCell", for: indexPath) as! AnotherNewsCell
        
        cell.anotherNewsAvaImage.image = news[indexPath.row].avatarImage
        cell.anotherNewsName.text = news[indexPath.row].name
        cell.anoutherNewsTime.text = news[indexPath.row].timeOfPublication
        cell.anotherNewsText.text = news[indexPath.row].text
        cell.anotherNewsImage.image = news[indexPath.row].image
        
        return cell
        }
        
    }

