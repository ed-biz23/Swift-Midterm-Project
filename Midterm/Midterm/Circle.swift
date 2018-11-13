//
//  Circle.swift
//  Midterm
//
//  Created by Edward Biswas on 11/12/18.
//  Copyright © 2018 Edward Biswas. All rights reserved.
//

import Foundation
import UIKit

class Circle : Equatable {
    
    static func == (lhs: Circle, rhs: Circle) -> Bool {
        return (lhs.shade == rhs.shade) && (lhs.color == rhs.color)
    }
    
    var shade: Shades
    var color: Colors
    
    enum Shades {
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined, .striped, .filled]
    }
    
    enum Colors {
        case green
        case red
        case blue
        case purple
        
        static var all = [Colors.green, .red, .blue, .purple]
    }
    
    func randomizeColorAndShade() {
        self.shade = Shades.all[Int(arc4random_uniform(UInt32(Shades.all.count-1)))]
        self.color = Colors.all[Int(arc4random_uniform(UInt32(Colors.all.count-1)))]
    }
    
    init(shade: Shades, color: Colors) {
        self.shade = shade
        self.color = color
    }
}
