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
        setSlider()
        startGame()
    }
    
    @IBAction func hitButtonPressed(){
        game.calculateScore()
        showAlert(title: game.feedBack, message: "Your score is: \(game.score)\nSlider was at value: \(Int(game.sliderMark.rounded()))", handler: {[weak self] _ in
            self?.startNewRound()})
    }
    
    @IBAction func replayButtonPressed(_ sender: UIButton) {
        game = Game()
        startGame()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        game.setSliderMark(to: slider.value)
    }
}

extension ViewController {
    
    func fadeScreen(){
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        view.layer.add(transition, forKey: nil)
    }
    
    func setSlider(){
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Normal"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted)
        slider.setMinimumTrackImage(#imageLiteral(resourceName: "SliderTrackLeft"), for: .normal)
        slider.setMaximumTrackImage(#imageLiteral(resourceName: "SliderTrackRight"), for: .normal)
    }
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
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
        fadeScreen()
        game.setSliderMark(to: slider.value)
        game.generateRandomMark()
        updateUILabels()
    }
    
    func startNewRound(){
        game.updateRound()
        updateUILabels()
    }
}

