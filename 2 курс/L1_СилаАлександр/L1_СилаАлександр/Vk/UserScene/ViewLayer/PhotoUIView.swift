//
//  PhotoUIView.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 11.06.2022.
//

import UIKit

class PhotoUIView: UIView {
    
    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet var shadowView: UIView!
    
    override func layoutSubviews() {
        
        userPhoto.layer.cornerRadius = 4
    }
}
