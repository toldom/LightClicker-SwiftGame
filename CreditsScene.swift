//
//  CreditsScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-12.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit

class CreditsScene: SKScene {
    
    let creditsBackground = SKSpriteNode(imageNamed: "creditsBackground")
    let backButtonOff = SKSpriteNode(imageNamed: "backButtonOff")
    let backButtonOn = SKSpriteNode(imageNamed: "backButton")
    
    let marcusLabel = SKLabelNode(fontNamed: "Impact")
    let reeanLabel = SKLabelNode(fontNamed: "Impact")
    let matthewLabel = SKLabelNode(fontNamed: "Impact")
    

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        creditsBackground.position = CGPoint(x: size.width/2, y: size.height/2); creditsBackground.zPosition = 1
        backButtonOff.position = CGPoint(x: 110, y: 350); backButtonOff.zPosition = 2
        backButtonOn.position = CGPoint(x: 110, y: 350); backButtonOn.zPosition = 2
        
        marcusLabel.fontSize = 30; reeanLabel.fontSize = 30
        marcusLabel.position = CGPoint(x: 300, y: 250); reeanLabel.position = CGPoint(x: 324, y: 200); matthewLabel.position = CGPoint(x: 270, y: 150)
        marcusLabel.zPosition = 3; reeanLabel.zPosition = 3; matthewLabel.zPosition = 3
        let marcusLabelText = "Programming and Logic -- Marcus Toldo"
        let reeanLabelText = "Graphics and Visual Design -- Ryan Lebeau"
        marcusLabel.text = marcusLabelText; reeanLabel.text = reeanLabelText
        matthewLabel.text = "Moral Support -- Matthew Wroble"
        
        addChild(creditsBackground)
        addChild(backButtonOff)
        addChild(marcusLabel)
        addChild(reeanLabel)
        addChild(matthewLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if backButtonOff.contains(location) {
                addChild(backButtonOn)
                backButtonOff.removeFromParent()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
        
        
        let backToMenu = SKAction.run() {
            //let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let menuScene = MainMenu(size: self.size)
            self.view?.presentScene(menuScene)
        }
        
        if backButtonOn.contains(location) {
            addChild(backButtonOff)
            backButtonOn.removeFromParent()
            run(backToMenu)
        
            }
            
        }
    
    }

}
