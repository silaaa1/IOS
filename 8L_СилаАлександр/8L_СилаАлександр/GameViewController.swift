//
//  GameViewController.swift
//  8L_СилаАлександр
//
//  Created by Александр Сила on 08.02.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let sKView = view as! SKView
        
        sKView.showsFPS = true
        sKView.showsNodeCount = true
        
        sKView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        sKView.presentScene(scene)
        
    }
}
