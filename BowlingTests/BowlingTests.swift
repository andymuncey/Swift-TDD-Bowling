//
//  BowlingTests.swift
//  BowlingTests
//
//  Created by Andrew Muncey on 21/07/2015.
//  Copyright (c) 2015 University of Chester. All rights reserved.
//

import Cocoa
import XCTest

class BowlingTests: XCTestCase {
    
    var scorer : Scorer!
    
    override func setUp() {
        super.setUp()
        scorer = Scorer()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testTurkey(){
        
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        var frame1Score = scorer.scoreForFrameIndex(0)
        XCTAssert(frame1Score == 30,"Turkey OK");
    }
    
    func testDoubleGutterball(){
        scorer.addThrow(0)
        scorer.addThrow(0)
        var frame1Score = scorer.scoreForFrameIndex(0)
        XCTAssert(frame1Score == 0,"Double gutterball OK");
    }
    
    func testTwoSpares(){
        //ball 1
        scorer.addThrow(2)
        scorer.addThrow(4) //6 for frame 1
        scorer.addThrow(5)
        scorer.addThrow(5) //10 for frame 2, 14 with next ball added on
        scorer.addThrow(4)
        scorer.addThrow(6)
        var frame1Score = scorer.scoreForFrameIndex(1)
        XCTAssert(frame1Score == 14,"Two Spares test, value was \(frame1Score), should be 14")
    }
    
    func testLastFramePerfectGame(){
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)//10th frame
        scorer.addThrow(10)
        scorer.addThrow(10)
        var frame10Score = scorer.scoreForFrameIndex(9)
        XCTAssert(frame10Score == 30,"Last Frame Perfect Game, value was \(frame10Score), should be 30")
    }
    
    func test9thFramePerfectGame(){
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)//10th frame
        scorer.addThrow(10)
        scorer.addThrow(10)
        var frame9Score = scorer.scoreForFrameIndex(8)
        XCTAssert(frame9Score == 30,"9th Perfect Game failed, value was \(frame9Score), should be 30")
    }
    
    func testPerfectGame(){
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)//10th frame
        scorer.addThrow(10)
        scorer.addThrow(10)
        var totalScore = scorer.totalScore()
        XCTAssert(totalScore == 300,"Perfect Game Failed, value was \(totalScore)")
    }
    
    func testImperfectGame(){
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)
        scorer.addThrow(10)//10th frame
        scorer.addThrow(10)
        scorer.addThrow(9)
        var totalScore = scorer.totalScore()
        XCTAssert(totalScore == 299,"Imperfect Game Failed, value was \(totalScore)")
    }
    
    func spare9thFrame(){
        scorer.addThrow(10)//30
        scorer.addThrow(10)//60
        scorer.addThrow(10)//90
        scorer.addThrow(10)//120
        scorer.addThrow(10)//150
        scorer.addThrow(10)//180
        scorer.addThrow(10)//205
        scorer.addThrow(10)//225
        scorer.addThrow(5)
        scorer.addThrow(5)//245
        scorer.addThrow(10)//10th frame
        scorer.addThrow(10)
        scorer.addThrow(10) //275
        var totalScore = scorer.totalScore()
        XCTAssert(totalScore == 275,"9th frame spare, value was \(totalScore)")
    }
}
