//
//  Game.swift
//  HitTheMark
//
//  Created by Bakhrom Usmanov on 23/09/24.
//
class Game {
    private(set) var sliderMark: Float
    private(set) var targetMark: Float
    private(set) var totalScore: Int
    private(set) var score: Int
    private(set) var round: Int
    private(set) var feedBack: String
    
    init(sliderMark: Float = 0, targetMark: Float = 0, score: Int = 0, totalScore: Int = 0, round: Int = 1, feedBack: String = "Welldone!") {
        self.sliderMark = sliderMark
        self.targetMark = targetMark
        self.score = score
        self.totalScore = totalScore
        self.round = round
        self.feedBack = feedBack
    }
    
    func setSliderMark(to value: Float) {
        sliderMark = value
    }
    
    func setFeedBack(to value: Int){
        switch value {
        case 1..<30: feedBack = "Not even close..."
        case 30..<60: feedBack = "You almost had it!"
        case 60...100: feedBack = "Perfect!"
        default: return
        }
    }
    
    func setRound() {
        round += 1
    }
    
    func calculateScore() {
        score = Int(((100 - abs(sliderMark - targetMark))).rounded())
        setFeedBack(to: score)
        
        totalScore += score
        generateRandomMark()
        setRound()
    }
    
    func setScore(to value: Int){
        score = value
    }
    
    func generateRandomMark() {
        targetMark = Float.random(in: 0...100)
    }
}
