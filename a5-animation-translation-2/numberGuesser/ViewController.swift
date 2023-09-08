//
//  ViewController.swift
//  numberGuesser
//
//  Created by Cambrian on 2022-04-11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessSlider: UISlider!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    let congratulations = NSLocalizedString("congratulations", comment: "label: When the number gussed is correct")
    
    
    @IBAction func showAnswer(_ sender: Any) {
        let maxVal = Int(guessSlider.maximumValue)
        let answerVal = Int.random(in: 0...maxVal)
        let guess = Int(guessSlider.value)
        
        answerLabel.text = String(answerVal)
        
        if answerVal == guess {
            resultLabel.text = congratulations
            // Change background to green
            view.backgroundColor = UIColor.green
        } else {
            resultLabel.text = NSLocalizedString("better luck next time", comment: "label: If the guess is not right we wish users a better luck for next try")
            // Calculate the difference between guess and answer
            let difference = abs(answerVal - guess)
            // Calculate gradient factor between 0 and 1
            let gradientFactor = CGFloat(difference) / CGFloat(maxVal)
            // Create gradient color between red and green based on gradientFactor
            let backgroundColor = UIColor(
                red: 1.0 - gradientFactor,
                green: gradientFactor,
                blue: 0.0,
                alpha: 1.0
            )
            // Set the background color
            view.backgroundColor = backgroundColor
        }
        //Adding animation to the result 
        UIView.animateKeyframes(withDuration: 2.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.83) {
                self.resultLabel.alpha = 1
            }
            UIView.addKeyframe(withRelativeStartTime: 0.83, relativeDuration: 1.67) {
                self.resultLabel.alpha = 0
            }
        }
    }
    
    @IBAction func setGuess(_ sender: UISlider) {
        guessLabel.text = String(Int(sender.value))
    }
    
    @IBAction func changeDiff(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            guessSlider.maximumValue = 10
            guessSlider.tintColor = UIColor.blue
        case 1:
            guessSlider.maximumValue = 100
            guessSlider.tintColor = UIColor.yellow
        case 2:
            guessSlider.maximumValue = 1000
            guessSlider.tintColor = UIColor.purple
        default:
            guessSlider.maximumValue = 10
            guessSlider.tintColor = UIColor.blue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""

    }


}

