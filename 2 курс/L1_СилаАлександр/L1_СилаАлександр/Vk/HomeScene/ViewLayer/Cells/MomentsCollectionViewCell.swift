
import UIKit

class MomentsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageMomentsCell: UIImageView!
    @IBOutlet var labelMomentsCell: UILabel!
    
    public func configure(with moments: Moments) {
        
        self.labelMomentsCell.text = moments.name
        self.imageMomentsCell.image = moments.image
    }
}
