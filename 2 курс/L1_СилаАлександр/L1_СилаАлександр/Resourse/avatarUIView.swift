
import UIKit

class avatarUIView: UIView {
    
    @IBOutlet var avatarImageViews: [UIImageView] = []
    @IBOutlet var shadowViews: [UIView] = []
    @IBOutlet var contanierForAnimation: [UIView] = []
    
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 1
        contanierForAnimation.forEach() {$0.addGestureRecognizer(tap)}
    }
    
    override func layoutSubviews() {

        avatarImageViews.forEach() {$0.layer.cornerRadius = bounds.height/2}
        shadowViews.forEach() {$0.layer.cornerRadius = bounds.height/2}
    }
    
    @objc func handleTap(_ : UITapGestureRecognizer) {
        
        avatarAnimation(avatarImageViews, shadow: shadowViews)
    }
}
