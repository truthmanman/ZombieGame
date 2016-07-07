//
//  GameScene.swift
//  ZombieGame
//
//  Created by New on 2016/7/7.
//  Copyright (c) 2016年 New. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    let zombie1 = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime:NSTimeInterval = 0
    var dt :NSTimeInterval = 0
    let zombieMovePointsPerSec : CGFloat  = 480
    var velocity:CGPoint = CGPointZero
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        backgroundColor = SKColor.whiteColor()
        background.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        background.zPosition = -1
        
        
   
        zombie1.position =  CGPointMake(400,400) 
        
        

        self.addChild(zombie1)
        self.addChild(background)
    }
    
    override func update(currentTime: NSTimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        }else{
            dt = 0
        }
        
        lastUpdateTime = currentTime
        moveSprite(zombie1, velocity: velocity)
    }
    
    func moveSprite(sprite:SKSpriteNode , velocity:CGPoint){
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt),
                                   y: velocity.y * CGFloat(dt))
      
        
        sprite.position = CGPoint(x:sprite.position.x + amountToMove.x,
                                  y:sprite.position.y + amountToMove.y)
    }
    
    func moveZombieToward(location:CGPoint){
        let offset = CGPoint(x: location.x,
                             y: location.y)
        
        let length = sqrt(offset.x * offset.x + offset.y * offset.y)
        
        let direction = CGPoint(x: offset.x / CGFloat(length),
                                y: offset.y / CGFloat(length))
        
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec,
                           y: direction.y * zombieMovePointsPerSec)
    }
    
    func sceneTouched(touchLocation:CGPoint){
        moveZombieToward(touchLocation)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! 
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }
}











































