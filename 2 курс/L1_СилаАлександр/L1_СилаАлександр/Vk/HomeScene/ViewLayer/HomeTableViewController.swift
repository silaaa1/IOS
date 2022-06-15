
import UIKit

class HomeTableViewController: UITableViewController {
    
    private let localService = LocalLoaderHomeScene()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AnoutherNewsCell", bundle: nil), forCellReuseIdentifier: "AnoutherNewsCell")
        loadNewsfeed()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return localService.news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MomentsTableViewCell", for: indexPath) as! MomentsTableViewCell
            cell.configure(with: localService.moments)
                return cell
            }
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnoutherNewsCell", for: indexPath) as! AnotherNewsCell
        
        cell.anotherNewsAvaImage.image = localService.news[indexPath.row].avatarImage
        cell.anotherNewsName.text = localService.news[indexPath.row].name
        cell.anoutherNewsTime.text = localService.news[indexPath.row].timeOfPublication
        cell.anotherNewsText.text = localService.news[indexPath.row].text
        cell.anotherNewsImage.image = localService.news[indexPath.row].image
        
        return cell
        }
        
    }

