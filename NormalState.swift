import GameplayKit

class NormalState: GKState {
    
    var cNode: characterNode
    
    init(with node: characterNode){
        cNode=node
        
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if cNode.left{
            cNode.hspeed = -cNode.walkSpeed
        } else if cNode.right{
            cNode.hspeed = cNode.walkSpeed
        } else if cNode.up{
            cNode.hspeed = cNode.walkSpeed
            
        } else if cNode.down{
            cNode.hspeed = -cNode.walkSpeed
        }
        else{
            cNode.hspeed = 0.0
        }
        
        cNode.position.x = cNode.position.x + cNode.hspeed
        
    }
    
    
}
