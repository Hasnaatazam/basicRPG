import GameplayKit
import SpriteKit

class characterNode : SKSpriteNode {
    
    
    var left = false
    var right = false
    var up = false
    var down = false
    
    
    var hspeed:CGFloat = 0.0
    var walkSpeed:CGFloat = 2
    
    var stateMachine: GKStateMachine?
    func setupStateMachine(){
        let normalState = NormalState(with: self)
        stateMachine = GKStateMachine(states: [normalState])
        stateMachine?.enter(NormalState.self)
    }
    
    
}


