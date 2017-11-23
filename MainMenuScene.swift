//
//  MainMenuScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-10.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu: SKScene {
    
    //Defining Sprites
    let mainMenuBackground = SKSpriteNode(imageNamed: "mainMenuBackground")
    let playGameOff = SKSpriteNode(imageNamed: "playGameOff")
    let playGameOn = SKSpriteNode(imageNamed: "playGameOn")
    let infoOff = SKSpriteNode(imageNamed: "infoOff")
    let infoOn = SKSpriteNode(imageNamed: "infoOn")
    let creditsOff = SKSpriteNode(imageNamed: "creditsOff")
    let creditsOn = SKSpriteNode(imageNamed: "creditsOn")
    
    
    //Code to move sprites to the screen
    override func didMove(to view: SKView) {
        
        //Placing Background
        backgroundColor = SKColor.black
        mainMenuBackground.position = CGPoint(x:size.width/2, y:size.height/2); mainMenuBackground.zPosition = 0
        
        //Placing PlayGame Button
        playGameOn.position = CGPoint(x: size.width/2+150, y: size.height/2+100); playGameOn.zPosition = 1
        playGameOff.position = CGPoint(x: size.width/2+150, y: size.height/2+100); playGameOff.zPosition = 1
        
        //Placing Info Button
        infoOff.position = CGPoint(x: size.width/2-180, y: size.height/2-100); infoOff.zPosition = 1
        infoOn.position = CGPoint(x: size.width/2-180, y: size.height/2-100); infoOn.zPosition = 1
        
        //Placing Credits Button
        creditsOff.position = CGPoint(x: size.width/2+170, y: size.height/2-100); creditsOff.zPosition = 1
        creditsOn.position = CGPoint(x: size.width/2+170, y: size.height/2-100); creditsOn.zPosition = 1
        
        //Adding Sprites
        addChild(mainMenuBackground)
        addChild(playGameOn)
        addChild(infoOn)
        addChild(creditsOn)
    }
    
    //Code for a touch down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if playGameOn.contains(location) {
                addChild(playGameOff)
                playGameOn.removeFromParent()
            }
            
            if infoOn.contains(location) {
                addChild(infoOff)
                infoOn.removeFromParent()
            }
            
            if creditsOn.contains(location) {
                addChild(creditsOff)
                creditsOn.removeFromParent()
            }
            
        }
    }
    
    //Code for a touch up
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            let gameSelectAction = SKAction.run() {
                //let reveal = SKTransition.crossFadeWithDuration(0.5)
                let gameScene = GameSelectScene(size: self.size)
                self.view?.presentScene(gameScene)
            }
            
            let infoScreenAction = SKAction.run() {
                //let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let infoScene = InfoScene(size: self.size)
                self.view?.presentScene(infoScene)
            }
            
            let creditsScreenAction = SKAction.run() {
                //let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let creditsScene = CreditsScene(size: self.size)
                self.view?.presentScene(creditsScene)
            }
            
            if playGameOff.contains(location) {
                run(gameSelectAction)
                addChild(playGameOn)
                playGameOff.removeFromParent()
            }
            
            if infoOff.contains(location) {
                run(infoScreenAction)
                addChild(infoOn)
                infoOff.removeFromParent()
            }
            
            if creditsOff.contains(location) {
                run(creditsScreenAction)
                addChild(creditsOn)
                creditsOff.removeFromParent()
            }
            
        }
    }
    
}
