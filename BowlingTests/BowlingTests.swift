import XCTest

class BowlingTests: XCTestCase {
    
    var scorer : Scorer!
    
    override func setUp() {
        super.setUp()
        scorer = Scorer()
    }
    
    override func tearDown() {
        super.tearDown()
        scorer = nil
    }
    
    func testStrike(){
        _ = scorer.addThrow(10)
        _ = scorer.addThrow(2)
        _ = scorer.addThrow(1)
        let frame1Score = scorer.scoreForFrame(index: 0)
        XCTAssert(frame1Score == 13,"Strike test");
    }
    
    func testSpare(){
        //ball 1
        _ = scorer.addThrow(5)
        _ = scorer.addThrow(5) //10 for frame 2, 14 with next ball added on
        _ = scorer.addThrow(6)
        _ = scorer.addThrow(1)
        let frame1Score = scorer.scoreForFrame(index: 0)
        XCTAssert(frame1Score == 16,"Two Spares test, value was \(frame1Score), should be 16")
    }
    
    func testTwoSpares(){
        //ball 1
        _ = scorer.addThrow(2)
        _ = scorer.addThrow(4) //6 for frame 1
        _ = scorer.addThrow(5)
        _ = scorer.addThrow(5) //10 for frame 2, 14 with next ball added on
        _ = scorer.addThrow(4)
        _ = scorer.addThrow(6)
        let frame2Score = scorer.scoreForFrame(index: 1)
        XCTAssert(frame2Score == 14,"Two Spares test, value was \(frame2Score), should be 14")
    }
    
    func testTurkey(){
        
        _ = scorer.addThrow(10)
        _ = scorer.addThrow(10)
        _ = scorer.addThrow(10)
        let frame1Score = scorer.scoreForFrame(index: 0)
        XCTAssert(frame1Score == 30,"Turkey OK");
    }
    
    func testDoubleGutterball(){
        _ = scorer.addThrow(0)
        _ = scorer.addThrow(0)
        let frame1Score = scorer.scoreForFrame(index: 0)
        XCTAssert(frame1Score == 0,"Double gutterball OK");
    }
    
    func testSampleGame(){
        _ =  scorer.addThrow(2)
        _ =   scorer.addThrow(4)
        _ =   scorer.addThrow(4)
        _ =   scorer.addThrow(5)
        _ =  scorer.addThrow(6)
        _ =  scorer.addThrow(4)
        _ =  scorer.addThrow(5)
        _ =  scorer.addThrow(5)
        _ =  scorer.addThrow(10)
        _ =  scorer.addThrow(4)
        _ =  scorer.addThrow(1)
        _ =  scorer.addThrow(7)
        _ =  scorer.addThrow(3)
        _ =  scorer.addThrow(6)
        _ =   scorer.addThrow(4)
        _ =  scorer.addThrow(10)
        _ =  scorer.addThrow(2)
        _ =   scorer.addThrow(8)
        _ =  scorer.addThrow(6)
        let totalScore = scorer.totalScore()
        XCTAssert(totalScore == 142,"Sample Game (142), value was \(totalScore)")
    }
    
    func testLastFrameOfPerfectGame(){
        for _ in 1...13{
            _ =  scorer.addThrow(10)
        }
        let frame10Score = scorer.scoreForFrame(index: 9)
        XCTAssert(frame10Score == 30,"Last Frame Perfect Game, value was \(frame10Score), should be 30")
    }
    
    func test9thFrameOfPerfectGame(){
        for _ in 1...13{
            _ =  scorer.addThrow(10)
        }
        let frame9Score = scorer.scoreForFrame(index: 8)
        XCTAssert(frame9Score == 30,"9th Perfect Game failed, value was \(frame9Score), should be 30")
    }
    
    func testPerfectGame(){
        
        for _ in 1...13{
            _ = scorer.addThrow(10)
        }
        
        let totalScore = scorer.totalScore()
        XCTAssert(totalScore == 300,"Perfect Game Failed, value was \(totalScore)")
    }
    
    func testImperfectGame(){
        for _ in 1...11{
            _ =  scorer.addThrow(10)
        }
        _ =  scorer.addThrow(9)
        let totalScore = scorer.totalScore()
        XCTAssert(totalScore == 299,"Imperfect Game Failed, value was \(totalScore)")
    }
    
    func spare9thFrame(){
        for _ in 1...8{
            _ =  scorer.addThrow(10)
        }
        _ =  scorer.addThrow(5)
        _ =  scorer.addThrow(5)//245
        _ =  scorer.addThrow(10)//10th frame
        _ =  scorer.addThrow(10)
        _ =  scorer.addThrow(10) //275
        let totalScore = scorer.totalScore()
        XCTAssert(totalScore == 275,"9th frame spare, value was \(totalScore)")
    }
}
