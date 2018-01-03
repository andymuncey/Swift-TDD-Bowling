class Frame {
    
    var finalFrame = false
    
    private var throw1: Int
    private var throw2: Int?
    private var throw3: Int?
    
    init(pins: Int){
        throw1 = pins
    }
    
    func isComplete() -> Bool{
        
        if !finalFrame{
            return isStrike() || throw2 != nil
        }
        else{
            //spare or strike and 3rd ball has value
            let completeFinalFrameWithStrike = (isStrike() || isSpare()) && throw3 != nil
            
            //no spare, strike and second ball has value
            let completeFinalFrameNoSpareOrStrike =  !isSpare() && !isStrike() && throw2 != nil;
            
            return completeFinalFrameNoSpareOrStrike || completeFinalFrameWithStrike;
        }
    }
    
    func isSpare() -> Bool{
        guard throw2 != nil else {
            return false
        }
        return throw1 + throw2! == 10
    }
    
    func isStrike() -> Bool{
        return throw1 == 10
    }
    
    func baseScore() -> Int{
        var score = throw1
        
        if throw2 != nil{
            score += throw2!
        }
        if throw3 != nil{
            score += throw3!
        }
        return score
    }
    
    func addThrow(pins: Int){
        
        if throw2 == nil{
            throw2 = pins
        } else if throw3 == nil && finalFrame{
            throw3 = pins
        }
    }
    
    func throw1Score() -> Int{
        return throw1
    }
    
    func throw2Score() -> Int{
        if let score = throw2{
            return score
        }else{
            return 0
        }
    }
}

extension Frame : CustomStringConvertible {
    var description: String {
        get{
            if isStrike() {
                return "[X| ]"
            }
            if isSpare() {
                return "[\(throw1)|/]"
            }
            if !finalFrame {
                if throw2 == nil  {
                    return "[\(throw1)| ]"
                }
                else {
                    return "[\(throw1)|\(throw2!)]"
                }
            }
            else {
                if throw2 == nil {
                    return "[\(throw1)| | ]"
                }
                else if throw3 == nil {
                    return "[(\throw1)|\(throw2!)| "
                } else {
                    return "[(\throw1)|\(throw2!)|\(throw3!)"
                }
            }
            
        }
    }
}
