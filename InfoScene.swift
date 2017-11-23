//
//  InfoScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-12.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit

class InfoScene: SKScene {
    
    let infoBackrgound = SKSpriteNode(imageNamed: "infoBackground")
    let backButtonOn = SKSpriteNode(imageNamed: "backButton")
    let backButtonOff = SKSpriteNode(imageNamed: "backButtonOff")
    
    let infoOne = SKLabelNode(fontNamed: "Impact")
    let infoTwo = SKLabelNode(fontNamed: "Impact")
    let infoThree = SKLabelNode(fontNamed: "Impact")
    let infoFour = SKLabelNode(fontNamed: "Impact")
    
    override func didMove(to view: SKView) {
        infoBackrgound.position = CGPoint(x: size.width/2, y: size.height/2); infoBackrgound.zPosition = 1
        backButtonOff.position = CGPoint(x: 110, y: 350); backButtonOff.zPosition = 2
        backButtonOn.position = CGPoint(x: 110, y: 350); backButtonOn.zPosition = 2
        
        infoOne.fontSize = 30; infoTwo.fontSize = 30; infoThree.fontSize = 30; infoFour.fontSize = 30
        infoOne.position = CGPoint(x: 380, y: 280); infoTwo.position = CGPoint(x: 380, y: 240); infoThree.position = CGPoint(x: 380, y: 200); infoFour.position = CGPoint(x: 380, y: 160)
        
        infoOne.zPosition = 3; infoTwo.zPosition = 3; infoThree.zPosition = 3; infoFour.zPosition = 3
        
        infoOne.text = "Lights will come on"; infoTwo.text = "Touch the lights to turn them off"; infoThree.text = "Don't touch lights that are off"; infoFour.text = "Or u die"
        
        addChild(infoBackrgound)
        addChild(backButtonOff)
        addChild(infoOne); addChild(infoTwo); addChild(infoThree); addChild(infoFour)
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
