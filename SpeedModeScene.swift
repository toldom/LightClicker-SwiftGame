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

class GameSceneSpeed: SKScene {
    
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
    var appRunnng = false
    
    var hasBegun = false
    var randomNumber:Int = 0
    var nowFailed = false
    var score:Int = 0
    
    var ticker = 0
    var tickerLimit = 30
    
    var scoreLabel = SKLabelNode(fontNamed: "Impact")
    
    func updateLabel() {
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width/2 + 305, y: size.height/2 + 185); scoreLabel.zPosition = 4
        let scoreText = "Score: \(score)"
        scoreLabel.text = scoreText
    }
    
    func runSequence() {
        randomNumber = Int(arc4random_uniform(8))
        
        if randomNumber == 0 && redOn == false{
            print("Red")
            addChild(redBlockOn)
            redOn = true
            updateLabel()
        } else if randomNumber == 1 && blueOn == false{
            print("Blue")
            addChild(blueBlockOn)
            blueOn = true
            updateLabel()
        } else if randomNumber == 2 && greenOn == false{
            print("Green")
            addChild(greenBlockOn)
            greenOn = true
            updateLabel()
        } else if randomNumber == 3 && yellowOn == false{
            print("Yellow")
            addChild(yellowBlockOn)
            yellowOn = true
            updateLabel()
        } else if randomNumber == 4 && orangeOn == false{
            print("Orange")
            addChild(orangeBlockOn)
            orangeOn = true
            updateLabel()
        } else if randomNumber == 5 && purpleOn == false{
            print("Purple")
            addChild(purpleBlockOn)
            purpleOn = true
            updateLabel()
        } else if randomNumber == 6 && pinkOn == false{
            print("Pink")
            addChild(pinkBlockOn)
            pinkOn = true
            updateLabel()
        } else if randomNumber == 7 && brownOn == false{
            print("Brown")
            addChild(brownBlockOn)
            brownOn = true
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
            appRunnng = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if appRunnng == true {
            ticker += 1
            
            if ticker == tickerLimit {
                runSequence()
                ticker = 0
                }
            
            if redOn == true && blueOn == true && yellowOn == true && greenOn == true && orangeOn == true && purpleOn == true && brownOn == true && pinkOn == true {
                
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                let gameOver = GameOverScene(size: self.size)
                self.view?.presentScene(gameOver)

            }
            
            if score == 15 {
                tickerLimit = 20
            }
            if score == 30 {
                tickerLimit = 15
            }
            if score == 50 {
                tickerLimit = 10
            }
            if score == 70 {
                tickerLimit = 5
            }
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
                score += 1
            }
            if redBlockOn.contains(location) && redOn == true {
                redBlockOn.removeFromParent()
                redOn = false
                runSequence()
                score += 1
            }
            if greenBlockOn.contains(location) && greenOn == true {
                greenBlockOn.removeFromParent()
                greenOn = false
                runSequence()
                score += 1
            }
            if yellowBlockOn.contains(location) && yellowOn == true {
                yellowBlockOn.removeFromParent()
                yellowOn = false
                runSequence()
                score += 1
            }
            if orangeBlockOn.contains(location) && orangeOn == true {
                orangeBlockOn.removeFromParent()
                orangeOn = false
                runSequence()
                score += 1
            }
            if purpleBlockOn.contains(location) && purpleOn == true {
                purpleBlockOn.removeFromParent()
                purpleOn = false
                runSequence()
                score += 1
            }
            if pinkBlockOn.contains(location) && pinkOn == true {
                pinkBlockOn.removeFromParent()
                pinkOn = false
                runSequence()
                score += 1
            }
            if brownBlockOn.contains(location) && brownOn == true {
                brownBlockOn.removeFromParent()
                brownOn = false
                runSequence()
                score += 1
            }
            
            //---------------------------------------------------------
        }
    }
    
}
