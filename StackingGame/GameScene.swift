//
//  GameScene.swift
//  StackingGame
//
//  Created by TODAYUJIRO on 2016/02/06.
//  Copyright © 2016年 osman toda. All rights reserved.
//

import UIKit
import SpriteKit

//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/
class GameScene: SKScene, BlockNodeDelegate ,ReplayButtonDelegate  {
    var deleView:ViewController!

    
    var blockArray:[BlockNode] = []
    var goal = SKShapeNode()
    var clearLevel:CGFloat = 350
    var isClear = false
    var clearLabel = SKLabelNode()
    var replayButton = ReplayButton()
    
    //----------------------------------------------------//
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, -2)
        let rectSize = CGSizeMake(self.size.width, 100)
        let myStage = SKShapeNode(rectOfSize: rectSize, cornerRadius: 20)
        
        myStage.position = CGPointMake(self.size.width/2 , 50)
        myStage.physicsBody = SKPhysicsBody(rectangleOfSize: myStage.frame.size)
        myStage.physicsBody?.dynamic = false
        myStage.fillColor = UIColor.orangeColor()
        self.addChild(myStage)
        
        //>>
        let pos = CGPointMake(0, clearLevel)
        goal = SKShapeNode(rect: CGRectMake(pos.x, pos.y, self.size.width, 10))
        goal.fillColor = UIColor.greenColor()
        self.addChild(goal)
        //<<
        
        createBlock()
    }
    //----------------------------------------------------//
    func createBlock () {
        
        var aTexture = SKTexture()
        let rand = arc4random() % 3
        var aSpriteSize :CGSize!
        
        switch rand {
        case 0:
            print("条件1")
            aTexture = SKTexture(imageNamed: "rect.png")
            aSpriteSize = CGSizeMake(95, 115)

        case 1:
            print("条件2")
            aTexture = SKTexture(imageNamed: "star.png")
            aSpriteSize = CGSizeMake(95, 115 )

        case 2:
            print("条件3")
            aTexture = SKTexture(imageNamed: "image.png")
            aSpriteSize = CGSizeMake(74, 111 )

        default:
            break
        }
        
        //print("Create Block!!")
        //let aTexture = SKTexture(imageNamed: "box01_image.png")
        //let aSprite = SKSpriteNode(texture: aTexture)
        let aSprite = BlockNode(texture: aTexture)

        aSprite.position = CGPointMake(self.size.width / 2, self.size.height-5)
        aSprite.size = aSpriteSize
        aSprite.physicsBody = SKPhysicsBody(texture: aTexture, size: aSprite.size)
        
        aSprite.userInteractionEnabled = true
        aSprite.physicsBody?.dynamic = false
        
        aSprite.delegate = self
        self.addChild(aSprite)
        
        blockArray.append(aSprite)
        
    }
    //----------------------------------------------------//
    override func update(currentTime: NSTimeInterval) {
        //print("update")
        if isClear {return}
        //print ("ddd")
        for block in blockArray {
            //print("KKK")
            if block.isTouchEnd && block.position.y > clearLevel {
                block.isOnGoal = true
                block.onGoalTimer += 1
                //let sss : Int = block.onGoalTimer
                //print (sss)
                if block.onGoalTimer > 180 {
                    //print("Goal !!")
                    gameClear() 
                    break
                }
            }else{
                    block.isOnGoal = false
                    block.onGoalTimer = 0
                }
            }
    }
    //----------------------------------------------------//
    func gameClear (){
        isClear = true
        clearLabel = SKLabelNode(text: "Clear!!")
        clearLabel.position = CGPointMake(self.size.width/2, 350)
        clearLabel.fontSize = 140
        clearLabel.fontColor = UIColor.yellowColor()
        self.addChild(clearLabel)
        
        replayButton = ReplayButton(text: "Replay")
        replayButton.position = CGPointMake(self.size.width/2, 30)
        replayButton.fontSize = 80
        replayButton.fontColor = UIColor.whiteColor()
        replayButton.userInteractionEnabled = true
        replayButton.delegate = self
        self.addChild(replayButton)
        
        
    }
    //----------------------------------------------------//
    func ReplayGame() {
        clearLabel.removeFromParent()
        replayButton.removeFromParent( )
        for block in blockArray {
            block.removeFromParent()
            
        }
        blockArray.removeAll()
        //createBlock()
        isClear = false
        deleView.goHome()
        
    }
    
}
//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/

protocol GoHomeDelegate {
    
    func goHome()
    
}


