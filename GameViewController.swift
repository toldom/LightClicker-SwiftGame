//
//  GameViewController.swift
//  LightClicker
//
//  Created by Marcus Toldo on 2016-06-02.
//  Copyright (c) 2016 Marcus Toldo. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenu(size: view.bounds.size)
        let skView = view as! SKView
        scene.size = CGSize(width: 5760, height: 3240)
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
