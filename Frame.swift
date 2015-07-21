//
//  Frame.swift
//  Bowling
//
//  Created by Andrew Muncey on 21/07/2015.
//  Copyright (c) 2015 University of Chester. All rights reserved.
//

import Foundation


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
       var completeFinalFrameWithStrike = (isStrike() || isSpare()) && throw3 >= 0;
        
        //no spare, strike and second ball has value
        var completeFinalFrameNoSpareOrStrike =  !isSpare() && !isStrike() && throw2 >= 0;
        
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

func throwWithPins(pins: Int){
    
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