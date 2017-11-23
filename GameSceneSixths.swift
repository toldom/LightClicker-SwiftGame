//
//  GameSceneSixths.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-14.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit
import AudioToolbox

class GameScaneSixths: SKScene {
    
    //BlueBlocks
    let blueBlock = SKSpriteNode(imageNamed: "blueBlockOffSixth")
    let blueBlockOn = SKSpriteNode(imageNamed: "blueBlockOnSixth")
    //RedBlocks
    let redBlock = SKSpriteNode(imageNamed: "redBlockOffSixth")
    let redBlockOn = SKSpriteNode(imageNamed: "redBlockOnSixth")
    //GreenBlocks
    let greenBlock = SKSpriteNode(imageNamed: "greenBlockOffSixth")
    let greenBlockOn = SKSpriteNode(imageNamed: "greenBlockOnSixth")
    //YellowBlocks
    let yellowBlock = SKSpriteNode(imageNamed: "yellowBlockOffSxith")
    let yellowBlockOn = SKSpriteNode(imageNamed: "yellowBlockOnSixth")
    //OrangeBlocks
    let orangeBlock = SKSpriteNode(imageNamed: "orangeBlockOffSixth")
    let orangeBlockOn = SKSpriteNode(imageNamed: "orangeBlockOnSixth")
    //PurpleBlocks
    let purpleBlock = SKSpriteNode(imageNamed: "purpleBlockOffSixth")
    let purpleBlockOn = SKSpriteNode(imageNamed: "purpleBlockOnSixth")
    
    var redOn = false
    var blueOn = false
    var greenOn = false
    var yellowOn = false
    var orangeOn = false
    var purpleOn = false
    
    var hasBegun = false
    var randomNumber:Int = 0
    var nowFailed = false
    var score:Int = 39
    
    var scoreLabel = SKLabelNode(fontNamed: "Impact")
    
    func updateLabel() {
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width/2 + 305, y: size.height/2 + 185); scoreLabel.zPosition = 4
        let scoreText = "Score: \(score)"
        scoreLabel.text = scoreText
    }
    
    func runSequence() {
        let nextPhase = SKAction.run() {
            let eighthPhase = GameSceneEighths(size: self.size)
            self.view?.presentScene(eighthPhase)
        }
        
        randomNumber = Int(arc4random_uniform(6))
        
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
        } else if randomNumber == 4 {
            print("Orange")
            addChild(orangeBlockOn)
            orangeOn = true
            score += 1
            updateLabel()
        } else if randomNumber == 5 {
            print("Purple")
            addChild(purpleBlockOn)
            purpleOn = true
            score += 1
            updateLabel()
        }
        
        if score >= 60 {
            run(nextPhase)
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        blueBlock.anchorPoint = CGPoint(x: 0, y: 0); redBlock.anchorPoint = CGPoint(x: 0, y: 0); greenBlock.anchorPoint = CGPoint(x: 0, y: 0); yellowBlock.anchorPoint = CGPoint(x: 0, y: 0); purpleBlock.anchorPoint = CGPoint(x: 0, y: 0); orangeBlock.anchorPoint = CGPoint(x: 0, y: 0)
        
        blueBlockOn.anchorPoint = CGPoint(x: 0, y: 0); redBlockOn.anchorPoint = CGPoint(x: 0, y: 0); greenBlockOn.anchorPoint = CGPoint(x: 0, y: 0); yellowBlockOn.anchorPoint = CGPoint(x: 0, y: 0); purpleBlockOn.anchorPoint = CGPoint(x: 0, y: 0); orangeBlockOn.anchorPoint = CGPoint(x: 0, y: 0)
        
        redBlock.position = CGPoint(x: 0, y: size.height/2); blueBlock.zPosition = 1
        redBlockOn.position = CGPoint(x: 0, y: size.height/2); blueBlockOn.zPosition = 2
        blueBlock.position = CGPoint(x: size.width/3, y: size.height/2); redBlock.zPosition = 1
        blueBlockOn.position = CGPoint(x: size.width/3, y: size.height/2); redBlockOn.zPosition = 2
        greenBlock.position = CGPoint(x: size.width/3, y: 0); greenBlock.zPosition = 1
        greenBlockOn.position = CGPoint(x: size.width/3, y: 0); greenBlockOn.zPosition = 2
        yellowBlock.position = CGPoint(x: 0, y: 0); yellowBlock.zPosition = 1
        yellowBlockOn.position = CGPoint(x: 0, y: 0); yellowBlockOn.zPosition = 2
        orangeBlock.position = CGPoint(x: size.width/3+size.width/3, y: size.height/2); orangeBlock.zPosition = 1
        orangeBlockOn.position = CGPoint(x: size.width/3+size.width/3, y: size.height/2); orangeBlockOn.zPosition = 2
        purpleBlock.position = CGPoint(x: size.width/3+size.width/3, y: 0); purpleBlock.zPosition = 1
        purpleBlockOn.position = CGPoint(x: size.width/3+size.width/3, y: 0); purpleBlockOn.zPosition = 2
        
        addChild(blueBlock)
        addChild(redBlock)
        addChild(greenBlock)
        addChild(yellowBlock)
        addChild(purpleBlock)
        addChild(orangeBlock)
        addChild(scoreLabel)
        
        if hasBegun == false {
            runSequence()
            hasBegun = true
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            //Defining protocol for Game Over
            let failAction = SKAction.run() {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                let gameOver = GameOverScene(size: self.size)
                self.view?.presentScene(gameOver)
            }
            //--------------------------------------------------------
            //Failing if touch on wrong block
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
            if orangeBlock.contains(location) && orangeOn == false {
                run(failAction)
                nowFailed = true
            }
            if purpleBlock.contains(location) && purpleOn == false {
                run(failAction)
                nowFailed = true
            }
            //----------------------------------------------------------
            //Adding score when touch on correct block
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
            if orangeBlockOn.contains(location) && orangeOn == true {
                orangeBlockOn.removeFromParent()
                orangeOn = false
                runSequence()
            }
            if purpleBlockOn.contains(location) && purpleOn == true {
                purpleBlockOn.removeFromParent()
                purpleOn = false
                runSequence()
            }
            //---------------------------------------------------------
        }
    }
}
