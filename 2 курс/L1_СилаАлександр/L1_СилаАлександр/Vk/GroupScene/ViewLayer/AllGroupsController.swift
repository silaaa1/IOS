
import UIKit

class AllGroupsController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    
    private let localService = LocalLoaderGroup()
    var filteredGroups = [LocalGroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredGroups = localService.allGroups
        
        tableView.register(UINib(nibName: "CellForList", bundle: nil), forCellReuseIdentifier: "CellForList")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForList", for: indexPath) as? CellForList else {
            preconditionFailure("Error")
        }
        
        cell.labelForList.text = filteredGroups[indexPath.row].name
        cell.avaImageForList.image = filteredGroups[indexPath.row].image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredGroups = []
        
        if searchText == "" {
            
            filteredGroups = localService.allGroups
        } else {
            for group in localService.allGroups {
                
                if group.name.lowercased().contains(searchText.lowercased()) {
                    
                    filteredGroups.append(group)
                    loadSearchGroups(searchText)
                }
            }
        }
        self.tableView.reloadData()
    }
}
