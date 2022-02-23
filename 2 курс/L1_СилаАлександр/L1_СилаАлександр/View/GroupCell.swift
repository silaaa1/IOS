
import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet var imageGroupCell: UIImageView!
    @IBOutlet var labelGroupCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageGroupCell.layer.cornerRadius = 40
        imageGroupCell.contentMode = .scaleAspectFill
        imageGroupCell.layer.masksToBounds = true
    }


}
