//
//  ViewController.swift
//  Hit the mark
//
//  Created by Bakhrom Usmanov on 20/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderMark: Float = 0
    var targetMark: Float = 0
    var score: Int = 0
    var prevScore: Int = 0
    var round: Int = 1
    
    @IBOutlet weak var targetMarkLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    @IBAction func hitButtonPressed(){
        calculateScore()
        showAlert()
        updateScore()
    }
    
    @IBAction func replayButtonPressed(_ sender: UIButton) {
        round = 1
        score = 0
        startGame()
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hit The Mark", message: "Developed by Bakhrom Usmanov", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderMark = slider.value
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Welldone!", message: "Your score is: \(score)/100", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func calculateScore() {
        prevScore = score
        score = Int(((1 - abs(sliderMark - targetMark) / 100.0) * 100.0).rounded())
    }
    
    func updateScore(){
        score += prevScore
        scoreLabel.text = "\(score)"
        round += 1
        roundLabel.text = "\(round)"
    }
    
    func generateRandomNumber() -> Float {
        return Float.random(in: 0...100)
    }
    
    func startGame(){
        sliderMark = slider.value
        targetMark = generateRandomNumber()
        targetMarkLabel.text = "\(Int(targetMark.rounded()))"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
}

