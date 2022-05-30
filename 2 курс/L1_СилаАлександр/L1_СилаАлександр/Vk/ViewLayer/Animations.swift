
import UIKit

func loadingAnimation(loadingBackground: UIView, point1: UIView, point2: UIView, point3: UIView) {
      
    loadingBackground.layer.cornerRadius = 4
    point1.layer.cornerRadius = 9
    point2.layer.cornerRadius = 9
    point3.layer.cornerRadius = 9
    loadingBackground.alpha = 0.5
    loadingBackground.backgroundColor = .systemGray2
    point1.alpha = 0
    point2.alpha = 0
    point3.alpha = 0
    
    let durationTime: TimeInterval = 0.5
    
    UIView.animate(withDuration: durationTime,
                   delay: durationTime,
                   options: [.repeat, .autoreverse],
                   animations: {
        point1.alpha = 1
    })
    UIView.animate(withDuration: durationTime,
                   delay: durationTime*1.5,
                   options: [.repeat, .autoreverse],
                   animations: {
        point2.alpha = 1
    })
    UIView.animate(withDuration: durationTime,
                   delay: durationTime*2,
                   options: [.repeat, .autoreverse],
                   animations: {
        point3.alpha = 1
    })
}


func avatarAnimation(_ image: [UIImageView], shadow: [UIView] ) {
    
    UIView.animate(withDuration: 1,
                   delay: 0.2,
                   usingSpringWithDamping: 0.3,
                   initialSpringVelocity: 0,
                   options: .curveEaseInOut,
                   animations: {
        image.forEach() {$0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)}
        shadow.forEach() {$0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)}
        image.forEach() {$0.transform = .identity}
        shadow.forEach() {$0.transform = .identity}
    })
}

func likeAnimation(imageView: UIImageView) {
    
    UIView.animate(withDuration: 0.4,
                   delay: 0,
                   options: .curveEaseIn,
                   animations: {
        imageView.alpha = 0
    }, completion: {_ in
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            imageView.image = UIImage(systemName: "heart.fill")!
            imageView.tintColor = UIColor.systemPink
            imageView.alpha = 1
        })
    })
}

func unlikeAnimation(imageView: UIImageView) {
    
    UIView.animate(withDuration: 0.4,
                   delay: 0,
                   options: .curveEaseIn,
                   animations: {
        imageView.alpha = 0
    }, completion: {_ in
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            imageView.image = UIImage(systemName: "heart")!
            imageView.tintColor = UIColor.systemGray
            imageView.alpha = 1
        })
    })
}
