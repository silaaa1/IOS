
import UIKit

class AllGroupsController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    
    let groups = [
        Group(image: UIImage.init(named: "groupsAvatar/Electro"), name: "Electro"),
        Group(image: UIImage.init(named: "groupsAvatar/Music skills"), name: "Music skills"),
        Group(image: UIImage.init(named: "groupsAvatar/Drums"), name: "Drums"),
        Group(image: UIImage.init(named: "groupsAvatar/Guitars"), name: "Guitars"),
        Group(image: UIImage.init(named: "groupsAvatar/Vokal"), name: "Vokal"),
        Group(image: UIImage.init(named: "groupsAvatar/Piano"), name: "Piano"),
        Group(image: UIImage.init(named: "groupsAvatar/Reggae"), name: "Reggae"),
        Group(image: UIImage.init(named: "groupsAvatar/Rock"), name: "Rock"),
        Group(image: UIImage.init(named: "groupsAvatar/Pop"), name: "Pop"),
        Group(image: UIImage.init(named: "groupsAvatar/Jazz"), name: "Jazz"),
        Group(image: UIImage.init(named: "groupsAvatar/Classical"), name: "Classical"),
        Group(image: UIImage.init(named: "groupsAvatar/HipHop"), name: "HipHop"),
        Group(image: UIImage.init(named: "groupsAvatar/Alternative"), name: "Alternative")
    ]
    var filteredGroups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredGroups = groups
        
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredGroups = []
        
        if searchText == "" {
            
            filteredGroups = groups
        } else {
            for group in groups {
                
                if group.name.lowercased().contains(searchText.lowercased()) {
                    
                    filteredGroups.append(group)
                }
            }
        }
        self.tableView.reloadData()
    }
    

}
