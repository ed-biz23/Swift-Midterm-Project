//
//  ViewController.swift
//  Midterm
//
//  Created by Edward Biswas on 11/12/18.
//  Copyright © 2018 Edward Biswas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateviewFromModel()
    }
    
    lazy var game = Game()
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var spinButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func spinButtonAction(_ sender: UIButton) {
        game.spin()
        updateviewFromModel()
    }
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        game.reset()
        updateviewFromModel()
    }
    
    var circleViews = [CircleView]()
    
    private func createView() {
        circleViews.forEach( { $0.removeFromSuperview() } )
        
        circleViews = [CircleView]()
        
        game.circles.forEach({
            let circleView = CircleView()
            circleView.symbolShading = $0.shade
            circleView.color = $0.color
            
            circleViews.append(circleView)
        })
        
        circleViews.forEach( {stackView.addArrangedSubview($0)} )
        
    }
    
    private func updateviewFromModel() {
        createView()
        
        scoreLabel.text = "Score: \(game.score)"
        
        if game.score < 10 {
            spinButton.isEnabled = false
        } else {
            spinButton.isEnabled = true
        }
    }
    
}

