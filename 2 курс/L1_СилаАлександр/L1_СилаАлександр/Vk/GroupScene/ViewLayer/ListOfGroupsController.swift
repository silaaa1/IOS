
import UIKit

class ListOfGroupsController: UITableViewController {
    
    private let localService = LocalLoaderGroup()

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
        return localService.myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForList", for: indexPath) as? CellForList else {
            preconditionFailure("Error")
        }
        
        cell.labelForList.text = localService.myGroups[indexPath.row].name
        cell.avaImageForList.image = localService.myGroups[indexPath.row].image

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
            localService.myGroups.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    MARK: - Is't work, fix or remake
//    @IBAction func addSelectedGroupSegue(_ unwindSegue: UIStoryboardSegue) {
//        
//        if let sourceViewController = unwindSegue.source as? AllGroupsController,
//           let indexPath = sourceViewController.tableView.indexPathForSelectedRow {
//            
//            let group = sourceViewController.groups[indexPath.row]
//            if !myGroups.contains(where: {$0.name == group.name}) {
//               
//                myGroups.append(group)
//                tableView.reloadData()
//            }
//            self.performSegue(withIdentifier: "addSelectedGroupSegue", sender: nil)
//        }
//        
//        
//    }
}
