//
//  PlayerControlComponent.swift
//  PShooter
//
//  Created by Ricardo Giron on 9/6/17.
//  Copyright © 2017 Ricardo Giron. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayerControlComponent: GKComponent,  ControlInputSourceDelegate{
    
    
    
    var touchControlNode : TouchControlInputNode?
    var cNode : characterNode?
    
    
    
    func setupControls(camera : SKCameraNode, scene: SKScene) {
        
        touchControlNode = TouchControlInputNode(frame: scene.frame)
        touchControlNode?.inputDelegate = self
        touchControlNode?.position = CGPoint.zero
        
        camera.addChild(touchControlNode!)
        
        if (cNode == nil) {
            if let nodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self){
                cNode = nodeComponent.node as? characterNode
            }
            
        }
        
    }
    
    func follow(command: String?) {
        
        if (cNode != nil){
            switch(command!){
            case("left"):
                cNode?.left=true
            case "cancel left", "stop left":
                cNode?.left=false
            case "right":
                cNode?.right=true
            case "cancel right","stop right":
                cNode?.right=false
            case "up":
                cNode?.up = true
            case "cancel up","stop up":
                cNode?.up = false
            case "down":
                cNode?.down = true
            case "cancel down", "stop down":
                cNode?.down = false
                
            
            default:
                print("command: \(String(describing: command))")
                }
            }

        
            }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        cNode?.stateMachine?.update(deltaTime: seconds)
    }
    
    
        }

    

