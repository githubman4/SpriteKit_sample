//
//  HomeScene.swift
//  StackingGame
//
//  Created by TODAYUJIRO on 2016/02/20.
//  Copyright © 2016年 osman toda. All rights reserved.
//

import UIKit
import SpriteKit

class HomeScene: SKScene {
    
    override func didMoveToView(view : SKView){
        self.backgroundColor = SKColor.whiteColor()
        let rectSize = CGSizeMake(self.size.width, 150)
        let myStage = SKShapeNode(rectOfSize: rectSize, cornerRadius: 20)
        
        myStage.position = CGPointMake(self.size.width/2 , 50)
        myStage.physicsBody = SKPhysicsBody(rectangleOfSize: myStage.frame.size)
        myStage.physicsBody?.dynamic = false
        myStage.fillColor = UIColor.greenColor()
        self.addChild(myStage)
    }

}
