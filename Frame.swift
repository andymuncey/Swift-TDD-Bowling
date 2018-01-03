class Frame{
    
    var finalFrame = false
    
    private var throw1: Int?
    private var throw2: Int?
    private var throw3: Int?
    
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
        if throw1 != nil && throw2 != nil{
            return throw1! + throw2! == 10
        }
        return false
    }
    
    func isStrike() -> Bool{
        return throw1 == 10
    }
    
    func baseScore() -> Int{
        var score = 0
        if throw1 != nil{
            score += throw1!
        }
        if throw2 != nil{
            score += throw2!
        }
        if throw3 != nil{
            score += throw3!
        }
        return score
    }
    
    func throwWithPins(_ pins: Int){
        
        if throw1 == nil{
            throw1 = pins
        } else if throw2 == nil{
            throw2 = pins
        } else if throw3 == nil{
            throw3 = pins
        }
    }
    
    
    func throw1Score() -> Int{
        if let score = throw1{
            return score
        }else{
            return 0
        }
    }
    
    func throw2Score() -> Int{
        if let score = throw2{
            return score
        }else{
            return 0
        }
    }
}
