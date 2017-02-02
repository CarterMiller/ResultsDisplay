//
//  ResultsDisplay
//  RowingIntervals
//
//  Created by Russell D Morgan on 01/02/2017.
//  Copyright © 2017 Carter Miller. All rights reserved.
//

import Foundation
import UIKit

class ResultsDisplay: UIImageView
{
    // default values - but they will be overwritten
    var colourWin       = UIColor.green
    var colourLose      = UIColor.red
    var colourDraw      = UIColor.gray
    var colourUnknown   = UIColor.blue

    var results : [String] = ["U", "U", "U", "U", "U", "U", "U", "U", "U", "U"]
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func displayResults()
    {
        let displaySize = self.frame.size
        UIGraphicsBeginImageContextWithOptions(displaySize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // draw line around the box
        context!.setLineWidth(1)
        context!.move(to: CGPoint(x: 0, y: 0))
        context!.addLine(to: CGPoint(x: displaySize.width, y: 0))
        context!.addLine(to: CGPoint(x: displaySize.width, y: displaySize.height))
        context!.addLine(to: CGPoint(x: 0, y: displaySize.height))
        context!.addLine(to: CGPoint(x: 0, y: 0))
        context!.strokePath()

        let barGap      = CGFloat(10)
        let lineWidth   = CGFloat(5)
        let lineLength  = (displaySize.width - barGap * 11) / 10
        
        context!.setLineWidth(lineWidth)
        
        for (index, result) in results.enumerated()
        {
            switch result
            {
                case "W":
                    context!.setStrokeColor(colourWin.cgColor)
                case "L":
                    context!.setStrokeColor(colourLose.cgColor)
                case "D":
                    context!.setStrokeColor(colourDraw.cgColor)
                default:
                    context!.setStrokeColor(colourUnknown.cgColor)
            }
            let x = barGap + CGFloat(index) * (lineLength + barGap)
            
            context!.move(to: CGPoint(x: x, y: displaySize.height / 2))
            context!.addLine(to: CGPoint(x: x + lineLength, y: displaySize.height / 2))
            context!.strokePath()
        }
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
