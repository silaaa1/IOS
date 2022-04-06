
import UIKit

class ListOfGroupsController: UITableViewController {
    
    var myGroups = [
        Group(image: UIImage.init(named: "groupsAvatar/Rock"), name: "Rock"),
        Group(image: UIImage.init(named: "groupsAvatar/Pop"), name: "Pop"),
        Group(image: UIImage.init(named: "groupsAvatar/Jazz"), name: "Jazz"),
        Group(image: UIImage.init(named: "groupsAvatar/Classical"), name: "Classical"),
        Group(image: UIImage.init(named: "groupsAvatar/HipHop"), name: "HipHop"),
        Group(image: UIImage.init(named: "groupsAvatar/Alternative"), name: "Alternative")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CellForList", bundle: nil), forCellReuseIdentifier: "CellForList")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForList", for: indexPath) as? CellForList else {
            preconditionFailure("Error")
        }
        
        cell.labelForList.text = myGroups[indexPath.row].name
        cell.avaImageForList.image = myGroups[indexPath.row].image

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchButton",
           let destinationVC = segue.destination as? AllGroupsController
        {
            destinationVC.title = "All groups"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    MARK: - Is't work, fix or remake
    @IBAction func addSelectedGroupSegue(_ unwindSegue: UIStoryboardSegue) {
        
        if let sourceViewController = unwindSegue.source as? AllGroupsController,
           let indexPath = sourceViewController.tableView.indexPathForSelectedRow {
            
            let group = sourceViewController.groups[indexPath.row]
            if !myGroups.contains(where: {$0.name == group.name}) {
               
                myGroups.append(group)
                tableView.reloadData()
            }
            self.performSegue(withIdentifier: "addSelectedGroupSegue", sender: nil)
        }
        
        
    }
}
