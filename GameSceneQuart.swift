//
//  GameSceneQuart.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-13.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit
import AudioToolbox

class GameSceneQuart: SKScene {
    
    //BlueBlock - Off
    let blueBlock = SKSpriteNode(imageNamed: "blueBlockOffQuart")
    //BlueBlock - On
    let blueBlockOn = SKSpriteNode(imageNamed: "blueBlockOnQuart")
    //RedBlock - Off
    let redBlock = SKSpriteNode(imageNamed: "redBlockOffQuart")
    //RedBlock - On
    let redBlockOn = SKSpriteNode(imageNamed: "redBlockOnQuart")
    //GreenBlock - Off
    let greenBlock = SKSpriteNode(imageNamed: "greenBlockOffQuart")
    //GreenBlock - On
    let greenBlockOn = SKSpriteNode(imageNamed: "greenBlockOnQuart")
    //YellowBlock - Off
    let yellowBlock = SKSpriteNode(imageNamed: "yellowBlockOffQuart")
    //YellowBlock - On
    let yellowBlockOn = SKSpriteNode(imageNamed: "yellowBlockOnQuart")
    
    let startButton = SKSpriteNode(imageNamed: "startButton")
    let startButtonOff = SKSpriteNode(imageNamed: "startButtonOff")
    
    var redOn = false
    var blueOn = false
    var greenOn = false
    var yellowOn = false
    
    var hasBegun = false
    var randomNumber:Int = 0
    var nowFailed = false
    var score:Int = 19
    var scoreLabel = SKLabelNode(fontNamed: "Impact")
    
    func updateLabel() {
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width/2 + 305, y: size.height/2 + 185); scoreLabel.zPosition = 3
        let scoreText = "Score: \(score)"
        scoreLabel.text = scoreText
    }
    
    func runSequence() {
        let nextPhase = SKAction.run() {
            let sixthPhase = GameScaneSixths(size: self.size)
            self.view?.presentScene(sixthPhase)
        }
        
        randomNumber = Int(arc4random_uniform(4))
        
        if randomNumber == 0 {
            print("Red")
            addChild(redBlockOn)
            redOn = true
            score += 1
            updateLabel()
        } else if randomNumber == 1 {
            print("Blue")
            addChild(blueBlockOn)
            blueOn = true
            score += 1
            updateLabel()
        } else if randomNumber == 2 {
            print("Green")
            addChild(greenBlockOn)
            greenOn = true
            score += 1
            updateLabel()
        } else if randomNumber == 3 {
            print("Yellow")
            addChild(yellowBlockOn)
            yellowOn = true
            score += 1
            updateLabel()
        }
        
        if score >= 40 {
            run(nextPhase)
        }
    }
 
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        blueBlock.anchorPoint = CGPoint(x: 0,y: 0); redBlock.anchorPoint = CGPoint(x: 0, y: 0); greenBlock.anchorPoint = CGPoint(x: 0, y: 0); yellowBlock.anchorPoint = CGPoint(x: 0, y: 0)
        blueBlockOn.anchorPoint = CGPoint(x: 0, y: 0); redBlockOn.anchorPoint = CGPoint(x: 0, y: 0); greenBlockOn.anchorPoint = CGPoint(x: 0, y: 0); yellowBlockOn.anchorPoint = CGPoint(x: 0, y: 0)

        redBlock.position = CGPoint(x: 0, y: size.height/2); blueBlock.zPosition = 1
        blueBlock.position = CGPoint(x: size.width/2, y: size.height/2); redBlock.zPosition = 1
        yellowBlock.position = CGPoint(x: 0, y: 0); yellowBlock.zPosition = 1
        greenBlock.position = CGPoint(x: size.width/2, y: 0); greenBlock.zPosition = 1
        
        redBlockOn.position = CGPoint(x: 0, y: size.height/2); blueBlockOn.zPosition = 2
        blueBlockOn.position = CGPoint(x: size.width/2, y: size.height/2); redBlockOn.zPosition = 2
        yellowBlockOn.position = CGPoint(x: 0, y: 0); yellowBlockOn.zPosition = 2
        greenBlockOn.position = CGPoint(x: size.width/2, y: 0); greenBlockOn.zPosition = 2
        
        addChild(blueBlock)
        addChild(redBlock)
        addChild(yellowBlock)
        addChild(greenBlock)
        addChild(scoreLabel)
        
        if hasBegun == false {
            runSequence()
            hasBegun = true
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            let failAction = SKAction.run() {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                let gameOver = GameOverScene(size: self.size)
                self.view?.presentScene(gameOver)
            }
            
            if blueBlock.contains(location) && blueOn == false {
                run(failAction)
                nowFailed = true
            }
            if redBlock.contains(location) && redOn == false {
                run(failAction)
                nowFailed = true
            }
            if greenBlock.contains(location) && greenOn == false {
                run(failAction)
                nowFailed = true
            }
            if yellowBlock.contains(location) && yellowOn == false {
                run(failAction)
                nowFailed = true
            }
            
            if blueBlockOn.contains(location) && blueOn == true {
                blueBlockOn.removeFromParent()
                blueOn = false
                runSequence()
            }
            if redBlockOn.contains(location) && redOn == true {
                redBlockOn.removeFromParent()
                redOn = false
                runSequence()
            }
            if greenBlockOn.contains(location) && greenOn == true {
                greenBlockOn.removeFromParent()
                greenOn = false
                runSequence()
            }
            if yellowBlockOn.contains(location) && yellowOn == true {
                yellowBlockOn.removeFromParent()
                yellowOn = false
                runSequence()
            }
        }
    }
    
}
