//
//  GameScene.swift
//  AssassinsQuest
//
//  Created by Hasnaat Azam on 2019-03-03.
//  Copyright © 2019 Hasnaat Azam. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let velocityMultiplier : CGFloat = 0.12
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
       
    
    }
    
    override func didMove(to view: SKView) {
      
        
        if let thePlayer = childNode(withName: "Player"){
            thePlayer.physicsBody = SKPhysicsBody(circleOfRadius: 50)
           thePlayer.physicsBody?.affectedByGravity = false
            
            (thePlayer as! characterNode).setupStateMachine()
            if let pcComponent = thePlayer.entity?.component(ofType: PlayerControlComponent.self){
                pcComponent.setupControls(camera: camera!, scene: self)
            }
          
        }
       
        
    }
  
    
    
    override func update(_ currentTime: TimeInterval) {
      
        
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func setupDpad() {
        
    }
    
    
    

    
}
