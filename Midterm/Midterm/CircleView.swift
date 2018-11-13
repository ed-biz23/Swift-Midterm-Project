//
//  CircleView.swift
//  Midterm
//
//  Created by Edward Biswas on 11/12/18.
//  Copyright © 2018 Edward Biswas. All rights reserved.
//

import UIKit

@IBDesignable
/// The view responsible for displaying a single card.
class CircleView: UIView {
    
    /// The symbol color (red, green or purple) for this card view.
    var color: Circle.Colors = Circle.Colors.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The symbol shading (solid, striped or open) for this card view.
    var symbolShading: Circle.Shades = Circle.Shades.striped {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The path containing all shapes of this view.
    var path: UIBezierPath?
    
    /// The rect in which each path is drawn.
    private var drawableRect: CGRect {
        let drawableWidth = frame.size.width * 0.80
        let drawableHeight = frame.size.height * 0.90
        
        return CGRect(x: frame.size.width * 0.1,
                      y: frame.size.height * 0.05,
                      width: drawableWidth,
                      height: drawableHeight)
    }
    
    private var colorForPath: UIColor {
        switch color {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .purple:
            return UIColor.purple
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(rect: bounds)
        roundedRect.addClip()

        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        roundedRect.fill()
        
        path = UIBezierPath(ovalIn: drawableRect)
        path!.lineCapStyle = .round
        
        switch symbolShading {
        case .filled:
            colorForPath.setFill()
            path!.fill()
            
        case .outlined:
            colorForPath.setStroke()
            path!.lineWidth = 1 
            path!.stroke()
            
        case .striped:
            path!.lineWidth = 0.01 * frame.size.width
            colorForPath.setStroke()
            path!.stroke()
            path!.addClip()
            
            var currentX: CGFloat = 0
            
            let stripedPath = UIBezierPath()
            stripedPath.lineWidth = 0.005 * frame.size.width
            
            while currentX < frame.size.width {
                stripedPath.move(to: CGPoint(x: currentX, y: 0))
                stripedPath.addLine(to: CGPoint(x: currentX, y: frame.size.height))
                currentX += 0.03 * frame.size.width
            }
            
            colorForPath.setStroke()
            stripedPath.stroke()
            
            break
        }
    }
    
}



