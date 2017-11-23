//
//  GameScene.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-02.
//  Copyright (c) 2016 Marcus Toldo. All rights reserved.
//

import SpriteKit
import AudioToolbox
import AVFoundation

class GameSceneHalves: SKScene {
    
    var tapCooldown = false
    
    //Blue Block - Off
    let blueBlock = SKSpriteNode(imageNamed: "blueBlockOffHalf")
    
    //Red Block - Off
    let redBlock = SKSpriteNode(imageNamed: "redBlockOffHalf")
    
    //Blue Block - On
    let blueBlockOn = SKSpriteNode(imageNamed: "blueBlockOnHalf")
    
    //Red Block - On
    let redBlockOn = SKSpriteNode(imageNamed: "redBlockOnHalf")
    
    let startButton = SKSpriteNode(imageNamed: "startButton")
    let startButtonOff = SKSpriteNode(imageNamed: "startButtonOff")
    
    let goodDing = SKAudioNode(fileNamed: "goodDing.wav")
    let loseSound = SKAudioNode(fileNamed: "badBounce.wav")
    
    var redOn = false
    var blueOn = false
    var randomNumber:Int = 0
    var nowFailed = false
    var score:Int = -1
    
    var scoreLabel = SKLabelNode(fontNamed: "Impact")
    
    func updateLabel() {
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width/2 + 305, y: size.height/2 + 185); scoreLabel.zPosition = 4
        let scoreText = "Score: \(score)"
        scoreLabel.text = scoreText

    }
    
    func runSequence() {
        
        let nextPhase = SKAction.run() {
            let quartPhase = GameSceneQuart(size: self.size)
            self.view?.presentScene(quartPhase)
        }
        
        //Generate random number
        randomNumber = Int(arc4random_uniform(2))
        //Flash Light
        if randomNumber == 0 {
            print("Red")
            addChild(redBlockOn)
            redOn = true
            score += 1
            updateLabel()
            //runAction(SKAction.playSoundFileNamed("goodDing", waitForCompletion: false))
        } else if randomNumber == 1 {
            print("Blue")
            addChild(blueBlockOn)
            blueOn = true
            score += 1
            updateLabel()
            //runAction(SKAction.playSoundFileNamed("goodDing", waitForCompletion: false))
            
        }
        
        if score >= 20 {
            run(nextPhase)
        }
    }
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        startButtonOff.anchorPoint = CGPoint(x: 0, y: 0)
        redBlock.position = CGPoint(x: size.width/4, y: size.height/2) ; blueBlock.zPosition = 1
        blueBlock.position = CGPoint(x: size.width-184, y: size.height/2) ; redBlock.zPosition = 1
        redBlockOn.position = CGPoint(x:size.width/4, y: size.height/2) ; blueBlockOn.zPosition = 2
        blueBlockOn.position = CGPoint(x: size.width-184, y: size.height/2) ; redBlockOn.zPosition = 2
        startButton.anchorPoint = CGPoint(x: 0, y: 0)
        startButton.position = CGPoint(x: 250, y: size.height/2-40); startButton.zPosition = 3
        startButtonOff.position = CGPoint(x: 250, y: size.height/2-40); startButtonOff.zPosition = 3

        addChild(redBlock)
        addChild(blueBlock)
        addChild(startButton)
        addChild(scoreLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if startButton.contains(location) {
                startButton.removeFromParent()
                addChild(startButtonOff)

            }
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
                if startButton.position == CGPoint(x: 1000, y: 1000) {
                    run(failAction)
                    nowFailed = true
                }
            }
            
            if redBlock.contains(location) && redOn == false {
                if startButton.position == CGPoint(x: 1000, y: 1000) {
                    run(failAction)
                    nowFailed = true
                }
                
            }
            
            if redBlockOn.contains(location) && redOn == true {
                if nowFailed == true {
                    if redOn == true {
                        redBlockOn.removeFromParent()
                    }
                    if blueOn == true {
                        blueBlockOn.removeFromParent()
                    }
                }
                redBlockOn.removeFromParent()
                redOn = false
                runSequence()

            }
            
            if blueBlockOn.contains(location) && blueOn == true {
                if nowFailed == true {
                    if redOn == true {
                        redBlockOn.removeFromParent()
                    }
                    if blueOn == true {
                        blueBlockOn.removeFromParent()
                    }
                }
                blueBlockOn.removeFromParent()
                blueOn = false
                runSequence()


            }
            
            if startButtonOff.contains(location) {
                startButtonOff.removeFromParent()
                startButton.position = CGPoint(x: 1000, y: 1000); startButtonOff.position = CGPoint(x: 1000, y: 1000)
                runSequence()
            }
            
            
        }
    }
    
}
