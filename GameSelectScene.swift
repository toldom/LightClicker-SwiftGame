//
//  GameSelectScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-15.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit

class GameSelectScene: SKScene {
    let gameSelectBackground = SKSpriteNode(imageNamed: "gameSelectBackground")
    let backButtonOn = SKSpriteNode(imageNamed: "backButton")
    let backButtonOff = SKSpriteNode(imageNamed: "backButtonOff")
    let classicButtonOn = SKSpriteNode(imageNamed: "classicButton")
    let classicButtonOff = SKSpriteNode(imageNamed: "classicButtonOff")
    let speedButtonOn = SKSpriteNode(imageNamed: "speedButton")
    let speedButtonOff = SKSpriteNode(imageNamed: "speedButtonOff")
    
    override func didMove(to view: SKView) {
        gameSelectBackground.anchorPoint = CGPoint(x: 0, y: 0)
        backButtonOn.anchorPoint = CGPoint(x: 0, y: 0); backButtonOff.anchorPoint = CGPoint(x: 0, y: 0)
        classicButtonOff.anchorPoint = CGPoint(x: 0, y: 0); classicButtonOn.anchorPoint = CGPoint(x: 0, y: 0)
        speedButtonOff.anchorPoint = CGPoint(x: 0, y: 0); speedButtonOn.anchorPoint = CGPoint(x: 0, y: 0)
        
        gameSelectBackground.position = CGPoint(x: 0, y: 0); gameSelectBackground.zPosition = 0
        backButtonOff.position = CGPoint(x: 0, y: 0); backButtonOn.position = CGPoint(x: 0, y: 0); backButtonOff.zPosition = 1; backButtonOn.zPosition = 1
        classicButtonOff.position = CGPoint(x: 50, y: size.height/2-40); classicButtonOn.position = CGPoint(x: 50, y: size.height/2-40); classicButtonOff.zPosition = 1; classicButtonOn.zPosition = 1
        speedButtonOff.position = CGPoint(x: size.width/2 + 75, y: size.height/2-40); speedButtonOn.position = CGPoint(x: size.width/2 + 75, y: size.height/2-40); speedButtonOff.zPosition = 1; speedButtonOn.zPosition = 1
        
        addChild(gameSelectBackground)
        addChild(backButtonOff)
        addChild(classicButtonOff)
        addChild(speedButtonOff)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if backButtonOff.contains(location) {
                addChild(backButtonOn)
                backButtonOff.removeFromParent()
            }
            
            if classicButtonOff.contains(location) {
                addChild(classicButtonOn)
                classicButtonOff.removeFromParent()
            }
            
            if speedButtonOff.contains(location) {
                addChild(speedButtonOn)
                speedButtonOff.removeFromParent()
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
            
            let playGame = SKAction.run() {
                let gameScene = GameSceneHalves(size: self.size)
                self.view?.presentScene(gameScene)
            }
            
            let playSpeed = SKAction.run() {
                let speedScene = GameSceneSpeed(size: self.size)
                self.view?.presentScene(speedScene)
            }
            
            if backButtonOn.contains(location) {
                addChild(backButtonOff)
                backButtonOn.removeFromParent()
                run(backToMenu)
            }
            
            if classicButtonOn.contains(location) {
                addChild(classicButtonOff)
                classicButtonOn.removeFromParent()
                run(playGame)
            }
            
            if speedButtonOn.contains(location) {
                addChild(speedButtonOff)
                speedButtonOn.removeFromParent()
                run(playSpeed)
            }
        }
    }
}
