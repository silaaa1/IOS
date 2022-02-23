
import UIKit

class AllGroupsController: UITableViewController {

    var groups = [
        Group(image: UIImage.init(named: "Electro"), name: "Electro"),
        Group(image: UIImage.init(named: "Music skills"), name: "Music skills"),
        Group(image: UIImage.init(named: "Drums"), name: "Drums"),
        Group(image: UIImage.init(named: "Guitars"), name: "Guitars"),
        Group(image: UIImage.init(named: "Vokal"), name: "Vokal"),
        Group(image: UIImage.init(named: "Piano"), name: "Piano"),
        Group(image: UIImage.init(named: "Reggae"), name: "Reggae"),
        Group(image: UIImage.init(named: "Rock"), name: "Rock"),
        Group(image: UIImage.init(named: "Pop"), name: "Pop"),
        Group(image: UIImage.init(named: "Jazz"), name: "Jazz"),
        Group(image: UIImage.init(named: "Classical"), name: "Classical"),
        Group(image: UIImage.init(named: "HipHop"), name: "HipHop"),
        Group(image: UIImage.init(named: "Alternative"), name: "Alternative")
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
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? AllGroupsCell else {
            preconditionFailure("AllGroupsCell cannot find")
        }
        
        cell.labelAllGroupsCell.text = groups[indexPath.row].name
        cell.imageAllGroupCell.image = groups[indexPath.row].image
        
        return cell
    }
    
}
