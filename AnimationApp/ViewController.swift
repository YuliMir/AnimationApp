//
//  ViewController.swift
//  AnimationApp
//
//  Created by Юлия Миронова on 23.05.2022.
//

import Spring


class ViewController: UIViewController {
    
    var animationPreset = Spring.AnimationPreset.allCases.randomElement()!
    var labelHide = true
    
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var mainView: SpringView!
    
    @IBOutlet var runActionLabel: SpringButton!
    
    func hideLabel() {
        forceLabel.isHidden = labelHide
        durationLabel.isHidden = labelHide
        velocityLabel.isHidden = labelHide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runActionLabel.setTitle("Run", for: .normal)
        animationLabel.text = "Animation parametres"
        
        hideLabel()
    }
    
    @IBAction func runActionButton(_ sender: SpringButton) {
        
        mainView.animation = "\(animationPreset)"
        mainView.animate()
        animationPreset = Spring.AnimationPreset.allCases.randomElement()!
        runActionLabel.setTitle("Run \(animationPreset)", for: .normal)
        
        if labelHide {
            labelHide = false
            hideLabel()
        }
        
        animationLabel.text = "Preset: \(mainView.animation)"
        forceLabel.text = "Force: \(mainView.force)"
        durationLabel.text = "Duration: \(mainView.duration)"
        velocityLabel.text = "Velocity: \(mainView.velocity)"
        
    }
    
}
