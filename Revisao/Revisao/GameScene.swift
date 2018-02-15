//
//  GameScene.swift
//  Revisao
//
//  Created by Eduardo Vital Alencar Cunha on 03/10/17.
//  Copyright © 2017 VCode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        
    }

    override init(size: CGSize) {
        super.init(size: size)

        let aresta = 100
        let quadrado = SKSpriteNode(color: .cyan, size: CGSize(width: aresta, height: aresta))

        quadrado.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        quadrado.name = "Quadrado"

        self.addChild(quadrado)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    // MARK: - Touches Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.moveWith(touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.moveWith(touches: touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.enumerateChildNodes(withName: "Quadrado") { (node, stop) in
            (node as! SKSpriteNode).color = .cyan
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    func moveWith(touches: Set<UITouch>) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)

        self.enumerateChildNodes(withName: "Quadrado") { (node, stop) in
            node.position = touchLocation
        }
    }
}
