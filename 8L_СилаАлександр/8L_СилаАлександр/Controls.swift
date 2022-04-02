//
//  Controls.swift
//  8L_СилаАлександр
//
//  Created by Александр Сила on 10.02.2022.
//

import UIKit
import SpriteKit

class Controls: SKShapeNode {
    
    static func makeButton(at point: CGPoint) -> SKShapeNode {
        let button = SKShapeNode()
        button.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        button.position = point
        button.fillColor = SKColor.blue
        button.strokeColor = SKColor.blue
        button.lineWidth = 10
    
        return button
    }
}
