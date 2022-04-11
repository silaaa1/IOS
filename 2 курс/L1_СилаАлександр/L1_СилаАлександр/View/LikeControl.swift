
import UIKit

class LikeControl: UIControl {
    
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var likeLabel: UILabel!
    
    var numberOfLikes = 0
    var isLike: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
