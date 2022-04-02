
import UIKit

class avatarUIView: UIView {
    
    @IBOutlet var avatarImageViews: [UIImageView] = []
    @IBOutlet var shadowViews: [UIView] = []
    
    
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowOpacity: Float = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for shadowView in shadowViews {
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = shadowOpacity
        }
    }
    
    override func layoutSubviews() {
        for avatarImageView in avatarImageViews {
            avatarImageView.layer.cornerRadius = bounds.height/2
        }
        for shadowView in shadowViews {
            shadowView.layer.cornerRadius = bounds.height/2
        }
    }
}
