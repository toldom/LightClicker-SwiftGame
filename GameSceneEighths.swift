//
//  GameSceneEighths.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-14.
//  Copyright © 2016 Marcus Toldo. All rights reserved.
//

import Foundation
import SpriteKit
import AudioToolbox

class GameSceneEighths: SKScene {
    
    //BlueBlocks
    let blueBlock = SKSpriteNode(imageNamed: "blueBlockOffEight")
    let blueBlockOn = SKSpriteNode(imageNamed: "blueBlockOnEight")
    //RedBlocks
    let redBlock = SKSpriteNode(imageNamed: "redBlockOffEight")
    let redBlockOn = SKSpriteNode(imageNamed: "redBlockOnEight")
    //GreenBlocks
    let greenBlock = SKSpriteNode(imageNamed: "greenBlockOffEight")
    let greenBlockOn = SKSpriteNode(imageNamed: "greenBlockOnEight")
    //YellowBlocks
    let yellowBlock = SKSpriteNode(imageNamed: "yellowBlockOffEight")
    let yellowBlockOn = SKSpriteNode(imageNamed: "yellowBlockOnEight")
    //OrangeBlocks
    let orangeBlock = SKSpriteNode(imageNamed: "orangeBlockOffEight")
    let orangeBlockOn = SKSpriteNode(imageNamed: "orangeBlockOnEight")
    //PurpleBlocks
    let purpleBlock = SKSpriteNode(imageNamed: "purpleBlockOffEight")
    let purpleBlockOn = SKSpriteNode(imageNamed: "purpleBlockOnEight")
    //PinkBlocks
    let pinkBlock = SKSpriteNode(imageNamed: "pinkBlockOffEight")
    let pinkBlockOn = SKSpriteNode(imageNamed: "pinkBlockOnEight")
    //BrownBlocks
    let brownBlock = SKSpriteNode(imageNamed: "brownBlockOffEight")
    let brownBlockOn = SKSpriteNode(imageNamed: "brownBlockOnEight")
    
    var redOn = false
    var blueOn = false
    var greenOn = false
    var yellowOn = false
    var orangeOn = false
    var purpleOn = false
    var pinkOn = false
    var brownOn = false
    
    var hasBegun = false
    var randomNumber:Int = 0
    var nowFailed = false
    var score:Int = 59
    
    var scoreLabel = SKLabelNode(fontNamed: "Impact")
    
    func updateLabel() {
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width/2 + 305, y: size.height/2 + 185); scoreLabel.zPosition = 4
        let scoreText = "Score: \(score)"
        scoreLabel.text = scoreText
    }
    
    func runSequence() {
        randomNumber = Int(arc4random_uniform(8))
        
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
        } else if randomNumber == 6 {
            print("Pink")
            addChild(pinkBlockOn)
            pinkOn = true
            score += 1
            updateLabel()
        } else if randomNumber == 7 {
            print("Brown")
            addChild(brownBlockOn)
            brownOn = true
            score += 1
            updateLabel()
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        blueBlock.anchorPoint = CGPoint(x: 0,y: 0); redBlock.anchorPoint = CGPoint(x: 0, y: 0); greenBlock.anchorPoint = CGPoint(x: 0, y: 0); yellowBlock.anchorPoint = CGPoint(x: 0, y: 0); orangeBlock.anchorPoint = CGPoint(x: 0, y: 0); purpleBlock.anchorPoint = CGPoint(x: 0, y: 0); pinkBlock.anchorPoint = CGPoint(x: 0, y: 0); brownBlock.anchorPoint = CGPoint(x: 0, y: 0)
        
        blueBlockOn.anchorPoint = CGPoint(x: 0,y: 0); redBlockOn.anchorPoint = CGPoint(x: 0, y: 0); greenBlockOn.anchorPoint = CGPoint(x: 0, y: 0); yellowBlockOn.anchorPoint = CGPoint(x: 0, y: 0); orangeBlockOn.anchorPoint = CGPoint(x: 0, y: 0); purpleBlockOn.anchorPoint = CGPoint(x: 0, y: 0); pinkBlockOn.anchorPoint = CGPoint(x: 0, y: 0); brownBlockOn.anchorPoint = CGPoint(x: 0, y: 0)

        
        redBlock.position = CGPoint(x: 0, y: size.height/2);  blueBlock.zPosition = 1
        redBlockOn.position = CGPoint(x: 0, y: size.height/2); blueBlockOn.zPosition = 2
        
        blueBlock.position = CGPoint(x: size.width/4, y: size.height/2); redBlock.zPosition = 1
        blueBlockOn.position = CGPoint(x: size.width/4, y: size.height/2); redBlockOn.zPosition = 2
        
        yellowBlock.position = CGPoint(x: 0, y:0); yellowBlock.zPosition = 1
        yellowBlockOn.position = CGPoint(x: 0, y:0); yellowBlockOn.zPosition = 2
        
        greenBlock.position = CGPoint(x: size.width/4, y: 0); greenBlock.zPosition = 1
        greenBlockOn.position = CGPoint(x: size.width/4, y: 0); greenBlockOn.zPosition = 2
        
        orangeBlock.position = CGPoint(x: size.width/2, y: size.height/2); orangeBlock.zPosition = 1
        orangeBlockOn.position = CGPoint(x: size.width/2, y: size.height/2); orangeBlockOn.zPosition = 2
        
        purpleBlock.position = CGPoint(x: size.width/2, y: 0); purpleBlock.zPosition = 1
        purpleBlockOn.position = CGPoint(x: size.width/2, y: 0); purpleBlockOn.zPosition = 2
        
        brownBlock.position = CGPoint(x: size.width/2+size.width/4, y: size.height/2); brownBlock.zPosition = 1
        brownBlockOn.position = CGPoint(x: size.width/2+size.width/4, y: size.height/2); brownBlockOn.zPosition = 2
        
        pinkBlock.position = CGPoint(x: size.width/2+size.width/4, y: 0); pinkBlock.zPosition = 1
        pinkBlockOn.position = CGPoint(x: size.width/2+size.width/4, y: 0); pinkBlockOn.zPosition = 2
        
        addChild(blueBlock)
        addChild(redBlock)
        addChild(yellowBlock)
        addChild(greenBlock)
        addChild(orangeBlock)
        addChild(purpleBlock)
        addChild(brownBlock)
        addChild(pinkBlock)
        
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
            if pinkBlock.contains(location) && pinkOn == false {
                run(failAction)
                nowFailed = true
            }
            if brownBlock.contains(location) && brownOn == false {
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
            if pinkBlockOn.contains(location) && pinkOn == true {
                pinkBlockOn.removeFromParent()
                pinkOn = false
                runSequence()
            }
            if brownBlockOn.contains(location) && brownOn == true {
                brownBlockOn.removeFromParent()
                brownOn = false
                runSequence()
            }

            //---------------------------------------------------------
        }
    }
    
}
