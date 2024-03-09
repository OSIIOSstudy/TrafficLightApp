//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by OSIIOSdev on 09.03.2024.
//

import UIKit

enum Lights {
    case redLight, yellowLight, greenLight
}

class TrafficLightViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var switchButton: UIButton!
    
    var lightOn: CGFloat = 1
    var lightOff: CGFloat = 0.25
    
    var currentLight = Lights.redLight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        
        switchButton.layer.cornerRadius = 10
        switchButton.setTitle("START", for: .normal)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }

    @IBAction func switchButtonPressed(_ sender: UIButton) {
        sender.currentTitle == "START" ? sender.setTitle("NEXT", for: .normal) : sender.setTitle("START", for: .normal)
        
        switch currentLight {
        case .redLight:
            greenView.alpha = lightOff
            redView.alpha = lightOn
            currentLight = .yellowLight
        case .yellowLight:
            redView.alpha = lightOff
            yellowView.alpha = lightOn
            currentLight = .greenLight
        case .greenLight:
            yellowView.alpha = lightOff
            greenView.alpha = lightOn
            currentLight = .redLight
        }
    }
}

