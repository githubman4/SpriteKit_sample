//
//  ReplayButton.swift
//  StackingGame
//
//  Created by TODAYUJIRO on 2016/02/15.
//  Copyright © 2016年 osman toda. All rights reserved.
//

import UIKit
import SpriteKit


class ReplayButton: SKLabelNode {
    var delegate: GameScene!
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate.ReplayGame()   
    }
}
//*******************************************************//
protocol ReplayButtonDelegate {
    func ReplayGame()
}