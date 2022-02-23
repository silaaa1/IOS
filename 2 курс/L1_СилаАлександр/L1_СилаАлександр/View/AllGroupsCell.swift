
import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet var labelAllGroupsCell: UILabel!
    @IBOutlet var imageAllGroupCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageAllGroupCell.layer.cornerRadius = 40
        imageAllGroupCell.contentMode = .scaleAspectFill
        imageAllGroupCell.layer.masksToBounds = true
    }

}
