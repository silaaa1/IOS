
import UIKit

class ListOfGroupsController: UITableViewController {
    
    var groups = [
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            preconditionFailure("GroupCell cannot find")
        }
        
        cell.labelGroupCell.text = groups[indexPath.row].name
        cell.imageGroupCell.image = groups[indexPath.row].image

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchButton",
           let destinationVC = segue.destination as? AllGroupsController
        {
            destinationVC.title = "All groups"
        }
    }
    
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllGroupsController,
           let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.groups[indexPath.row]
            
            if !groups.contains(where: {$0.name == group.name}) {
                groups.append(group)
                
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
