
import UIKit

class AnoutherNewsCell: UITableViewCell {

    
    @IBOutlet var anotherNewsAvaImage: UIImageView!
    @IBOutlet var anotherNewsName: UILabel!
    @IBOutlet var anoutherNewsTime: UILabel!
    @IBOutlet var anotherNewsImage: UIImageView!
    @IBOutlet var anotherNewsText: UILabel!
    
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 1
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ : UITapGestureRecognizer) {
        likeControl.isLike.toggle()
        
        if likeControl.isLike {
            likeControl.likeImage.image = UIImage(systemName: "heart.fill")
            likeControl.likeImage.tintColor = UIColor.systemPink
            likeControl.numberOfLikes += 1
            likeControl.likeLabel.text = "\(likeControl.numberOfLikes)"
            likeControl.likeLabel.textColor = UIColor.systemPink
        } else {
            likeControl.likeImage.image = UIImage(systemName: "heart")
            likeControl.likeImage.tintColor = UIColor.systemGray
            likeControl.numberOfLikes -= 1
            likeControl.likeLabel.text = "\(likeControl.numberOfLikes)"
            likeControl.likeLabel.textColor = UIColor.systemGray
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
