//
//  ViewController.swift
//  Hit the mark
//
//  Created by Bakhrom Usmanov on 20/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    @IBOutlet weak var targetMarkLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    @IBAction func hitButtonPressed(){
        game.calculateScore()
        showAlert(title: game.feedBack, message: "Your score is: \(game.score)\nSlider was at value: \(Int(game.sliderMark.rounded()))")
        updateUILabels()
    }
    
    @IBAction func replayButtonPressed(_ sender: UIButton) {
        game = Game()
        startGame()
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        showAlert(title: "Hit The Mark", message: "Developed by Bakhrom Usmanov")
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        game.setSliderMark(to: slider.value)
    }
}

extension ViewController {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateUILabels(){
        updateTargetLabel()
        updateScoreLabel()
        updateRoundLabel()
    }

    func updateScoreLabel() {
        scoreLabel.text = "\(game.totalScore)"
    }
    
    func updateTargetLabel(){
        targetMarkLabel.text = "\(Int(game.targetMark.rounded()))"
    }

    func updateRoundLabel() {
        roundLabel.text = "\(game.round)"
    }
    
    func startGame(){
        game.setSliderMark(to: slider.value)
        game.generateRandomMark()
        updateUILabels()
    }
}

