class Game{
    
    var frames : [Frame]
    
    init(){
        //create array of frames
        frames = [Frame]()
    }
    
    //boolean returned indicates if frame is complete
    func addThrow(_ pins: Int) -> Bool{
        guard frames.count > 0 else {
            frames.append(Frame(pins: pins))
            return pins == 10
        }
        let currentFrame = frames.last!
        if !currentFrame.isComplete(){
            currentFrame.addThrow(pins: pins)
            return currentFrame.isComplete()
        }
        else{
            if frames.count < 10{
                let newFrame = Frame(pins: pins)
                if frames.count == 9 {
                    newFrame.finalFrame = true
                }
                frames.append(newFrame)
                return newFrame.isComplete()
            }
        }
        return false
    }
    
    func complete() -> Bool {
        if frames.count == 10 {
            if frames.last!.isComplete(){
                return true
            }
        }
        return false
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

extension Game : CustomStringConvertible {
    
    var description : String {
        get {
            var framesPrint = ""
            for frame in frames {
                framesPrint.append(frame.description)
            }
            return framesPrint
        }
    }
    
}
