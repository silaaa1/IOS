
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var likeButton: LikeButton!
    @IBOutlet var avatarImageNews: UIImageView!
    @IBOutlet var nameLabelNews: UILabel!
    @IBOutlet var timeLabelNews: UILabel!
    @IBOutlet var textLabelNews: UILabel!
    @IBOutlet var imageNews: UIImageView!
    var isLike: Bool = false
    var likeNumbers = 0
    
    @IBAction func likePressed(_ sender: LikeButton) {
        if !isLike {
            isLike.toggle()
            likeNumbers += 1
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.setTitle("\(likeNumbers)", for: .normal)
            likeButton.setTitleColor(UIColor.systemPink, for: .normal)
            
        } else {
            isLike.toggle()
            likeNumbers -= 1
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.setTitle("\(likeNumbers)", for: .normal)
            likeButton.setTitleColor(UIColor.systemGray, for: .normal)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
