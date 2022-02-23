
import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet var labelFriendCell: UILabel!
    @IBOutlet var imageFriendCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageFriendCell.layer.cornerRadius = 40
        imageFriendCell.contentMode = .scaleAspectFill
        imageFriendCell.layer.masksToBounds = true
    }

}
