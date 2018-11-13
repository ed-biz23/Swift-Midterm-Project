//
//  Game.swift
//  Midterm
//
//  Created by Edward Biswas on 11/12/18.
//  Copyright © 2018 Edward Biswas. All rights reserved.
//

import Foundation

class Game {
    
    var circles = [Circle]()
    
    var score = 0
    
    func spin() {
        score -= 10
        circles.forEach( { $0.randomizeColorAndShade() })
        giveScore()
    }
    
    func reset() {
        score = 100
    }
    
    private func giveScore() {
        var shades = Set<Circle.Shades>()
        var colors = Set<Circle.Colors>()
        
        circles.forEach( {shades.insert($0.shade)} )
        circles.forEach( {colors.insert($0.color)} )
        
        if colors.count == 1 {
            if shades.count == 1 {
                score += 300
            } else if shades.count == 3 {
                score += 250
            } else {
                score += 200
            }
        } else if colors.count == 3 && shades.count == 3 {
            score += 100
        } else if shades.count == 1 {
            if colors.count == 3 {
                score += 150
            } else {
                score += 50
            }
        }
    }
    
    init() {
        self.circles = [Circle]()
        self.score = 100
        
        for _ in 0...2 {
            self.circles.append(Circle(shade: Circle.Shades.all[Int(arc4random_uniform(UInt32(Circle.Shades.all.count-1)))],
                                       color: Circle.Colors.all[Int(arc4random_uniform(UInt32(Circle.Colors.all.count-1)))]))
        }
    }
    
}
