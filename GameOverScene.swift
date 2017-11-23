//
//  GameOverScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-20.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let gameOverBackground = SKSpriteNode(imageNamed: "gameOverBackground")
    let backToMenuOff = SKSpriteNode(imageNamed: "backToMenuOff")
    let backToMenuOn = SKSpriteNode(imageNamed: "backToMenuOn")
    let gameOverTitle = SKSpriteNode(imageNamed: "gameOver")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        gameOverBackground.anchorPoint = CGPoint(x: 0, y: 0); backToMenuOff.anchorPoint = CGPoint(x: 0, y: 0); backToMenuOn.anchorPoint = CGPoint(x: 0, y: 0); gameOverTitle.anchorPoint = CGPoint(x: 0, y: 0)
        
        gameOverBackground.position = CGPoint(x: 0, y: 0); gameOverBackground.zPosition = 0
        backToMenuOff.position = CGPoint(x: size.width/2 - 230, y: size.height/2-50); backToMenuOff.zPosition = 1
        backToMenuOn.position = CGPoint(x: size.width/2 - 230, y: size.height/2-50); backToMenuOn.zPosition = 1
        gameOverTitle.position = CGPoint(x: size.width/2-220, y: size.height/2+78); gameOverTitle.zPosition = 1
        
        addChild(gameOverBackground)
        addChild(backToMenuOff)
        addChild(gameOverTitle)
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if backToMenuOff.contains(location) {
                addChild(backToMenuOn)
                backToMenuOff.removeFromParent()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            
            let backToMenu = SKAction.run() {
                let menuScene = MainMenu(size: self.size)
                self.view?.presentScene(menuScene)
            }
            
            if backToMenuOn.contains(location) {
                backToMenuOn.removeFromParent()
                addChild(backToMenuOff)
                run(backToMenu)
            }
            
        }
    }
}
