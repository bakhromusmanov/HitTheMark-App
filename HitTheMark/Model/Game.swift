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
    
    init(sliderMark: Float = 50, targetMark: Float = 0, score: Int = 0, totalScore: Int = 0, round: Int = 1) {
        self.sliderMark = sliderMark
        self.targetMark = targetMark
        self.score = score
        self.totalScore = totalScore
        self.round = round
    }
    
    func setSliderMark(to value: Float) {
        sliderMark = value
    }
    
    func setRound() {
        round += 1
    }
    
    func calculateScore() {
        score = Int(((1 - abs(sliderMark - targetMark) / 100.0) * 100.0).rounded())
        totalScore += score
    }
    
    func setScore(to value: Int){
        score = value
    }
    
    func generateRandomMark() {
        targetMark = Float.random(in: 0...100)
    }
}
