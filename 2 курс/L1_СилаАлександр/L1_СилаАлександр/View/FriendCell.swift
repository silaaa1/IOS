
import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet var labelFriendCell: UILabel!
    @IBOutlet var imageFriendCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
