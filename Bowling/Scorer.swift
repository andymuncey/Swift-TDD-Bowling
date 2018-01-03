class Scorer{
    
    var frames : [Frame]
    
    init(){
        //create array of frames
        frames = [Frame]()
        
        //add new frames
        frames.append(Frame())
    }
    
    func addThrow(_ pins: Int){
     
        let currentFrame = frames.last!
        if !currentFrame.isComplete(){
            currentFrame.addThrow(pins: pins)
        }
        else{
            if frames.count < 10{
                let newFrame = Frame()
                newFrame.addThrow(pins: pins)
                if frames.count == 9 {
                    newFrame.finalFrame = true
                }
                frames.append(newFrame)
            }
        }
    }
    
    
    func totalScore() -> Int{
        var total = 0
        for i in 0..<frames.count {
            total += scoreForFrame(index:i)
        }
        return total
    }
    
    func scoreForFrame(index: Int) -> Int{
        
        let frame = frames[index]
        
        if index < 9 {
            var frameScore = frame.baseScore()
            
            if frame.isStrike(){
                //next frame
                if frames.count > index + 1 {
                    let nextFrame = frames[index + 1]
                    frameScore += nextFrame.throw1Score() + nextFrame.throw2Score()
                    if nextFrame.isStrike() && !nextFrame.finalFrame{
                        //next frame
                        if frames.count > index + 2{
                            let thirdFrame = frames[index + 2]
                            frameScore += thirdFrame.throw1Score()
                        }
                    }
                }
            }
            else{
                //spare?
                if frame.isSpare(){
                    //next frame
                    if frames.count > index + 1{
                        let nextFrame = frames[index + 1]
                        frameScore += nextFrame.throw1Score()
                    }
                }
            }
            return frameScore
        }
        else{
            return frame.baseScore()
        }
    } 
}
