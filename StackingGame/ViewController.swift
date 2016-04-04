//
//  ViewController.swift
//  StackingGame
//
//  Created by TODAYUJIRO on 2016/02/06.
//  Copyright © 2016年 osman toda. All rights reserved.
//

import UIKit
import SpriteKit


class ViewController: UIViewController ,GoHomeDelegate {
    
    private var gameSKView: SKView!
    private let sc1 = GameScene()
    private let sc2 = HomeScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ///let gameSKView = self.view as! SKView
        gameSKView = self.view as! SKView
        gameSKView.showsFPS = true;
        gameSKView.showsNodeCount = true;
        
        
        //let scene = GameScene()
        sc1.size = gameSKView.frame.size;
        sc1.deleView = self
        gameSKView.presentScene(sc1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //---------------------------------------------//
    func goHome(){
        print("Go Home!")
        ///let mySKView = self.view as! SKView
        
        gameSKView.showsFPS = true;
        //let scene = HomeScene()
        gameSKView.scene?.removeFromParent()
        sc2.size = gameSKView.frame.size
        gameSKView.presentScene(sc2, transition: SKTransition.flipHorizontalWithDuration(0.5))
    }
    

}



