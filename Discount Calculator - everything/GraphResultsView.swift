//
//  GraphResultsView.swift
//  DiscountCalculator
//
//  Created by Bryan Bonner on 3/18/17.
//  CPSC 411 - Assignment 3
//

import UIKit

class GraphResultsView: UIView {
    let Data: CalculatorData = CalculatorData.shared
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = screenWidth/2.0 + 30.0
        let topGuide:CGFloat = 48.0
        
        let discountPercent:CGFloat = CGFloat(Data.discountPrice/Data.originalPrice)
        let savedPercent:CGFloat = 100.0 - (discountPercent*100)
        
        // Draw Original Price Rectangle on left half of the screen
        context.setFillColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context.fill(CGRect(x: 0.0, y: topGuide, width: screenWidth/2.0, height:screenHeight))
        
        // Draw Rectangle on right side
        context.setFillColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        context.fill(CGRect(x: screenWidth/2.0, y: topGuide, width: screenWidth/2.0, height:screenHeight))
        
        // Draw Rectangle based on discount percentage
        context.setFillColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context.fill(CGRect(x: screenWidth/2.0, y: screenHeight * discountPercent, width: screenWidth/2.0, height:screenHeight))
        
        // Set Text values
        let originalPriceText = "Original Price\n\n" + "$" + String(format: "%.2f", Data.originalPrice)
        let savedText = "You Saved\n\n" + "$" + String(format: "%.2f",Data.originalPrice - Data.discountPrice) + "\n%" + String(format: "%.2f", savedPercent)
        let payedText = "You Pay\n\n" +  "$" + String(format: "%.2f",Data.discountPrice) + "\n%" + String(format: "%.2f", discountPercent*100.0)
        
        // Text Attributes
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        // Draw Text
        originalPriceText.draw(at: CGPoint(x: leftGuide + 30, y: topGuide + 60.0),
                    withAttributes: textAttributes)
        savedText.draw(at: CGPoint(x: rightGuide, y: screenHeight * discountPercent + 30.0),
                     withAttributes: textAttributes)
        payedText.draw(at: CGPoint(x: rightGuide, y: topGuide + 60.0),
                       withAttributes: textAttributes)
    }

}
