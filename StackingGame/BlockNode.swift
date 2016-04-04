//
//  BlockNode.swift
//  StackingGame
//
//  Created by TODAYUJIRO on 2016/02/06.
//  Copyright © 2016年 osman toda. All rights reserved.
//

import UIKit
import SpriteKit


class BlockNode: SKSpriteNode {
    
    var delegate : GameScene!
    var isOnGoal = false
    var onGoalTimer = 0
    var isTouchEnd = false
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.xScale = 1.2
        self.yScale = 1.2
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let dx = touch.locationInNode(self.parent!).x -
            touch.previousLocationInNode(self.parent!).x
        let dy = touch.locationInNode(self.parent!).y -
            touch.previousLocationInNode(self.parent!).y
        
        self.position = CGPointMake(self.position.x + dx, self.position.y+dy)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.xScale = 1.0
        self.yScale = 1.0
        
        self.physicsBody?.dynamic = true
        self.userInteractionEnabled = false
        
        isTouchEnd = true
        delegate.createBlock()
        
        
    }

}

//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/

protocol BlockNodeDelegate {

func createBlock()

}
