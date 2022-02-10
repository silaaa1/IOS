//
//  GameScene.swift
//  8L_СилаАлександр
//
//  Created by Александр Сила on 08.02.2022.
//

import SpriteKit
import GameplayKit


struct CollisionCategories {
    
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}


class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        view.showsPhysics = true
        
        start()
        
        self.physicsWorld.contactDelegate = self
        
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.contactTestBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                      return
                  }
            touchNode.fillColor = SKColor.white
            
            if touchNode.name == "counterClockWiseButton" {
                snake!.moveCounterClokeWise()
            } else if touchNode.name == "clockWiseButton" {
                snake!.moveClockWise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                      return
                  }
            touchNode.fillColor = SKColor.blue
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func start() {
        let counterClockWiseButton = Controls.makeButton(at: CGPoint(x: view!.scene!.frame.minX + 30, y: view!.scene!.frame.minY + 30))
        counterClockWiseButton.name = "counterClockWiseButton"
        self.addChild(counterClockWiseButton)
        
        let clockWiseButton = Controls.makeButton(at: CGPoint(x: view!.scene!.frame.maxX - 80, y: view!.scene!.frame.minY + 30))
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        creatApple()
        
        creatSnake()
    }
    
    func creatApple() {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 10)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    func creatSnake() {
        snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
        self.addChild(snake!)
    }
}


extension GameScene: SKPhysicsContactDelegate {
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodyes - CollisionCategories.SnakeHead
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            creatApple()
            
        case CollisionCategories.EdgeBody:
            snake = nil
            self.removeAllChildren()
            start()
            
        default:
            break
        }
    }
}
