//
//  CustomUIButton.swift
//  CalculatorApp
//
//  Created by poskreepta on 18.05.23.
//

import UIKit

class CustomUIButton: UIButton {
    
    init(nameButton: String,
         buttonColor: UIColor,
         textColor: UIColor) {
        
        super.init(frame: CGRect())
        self.setTitle(nameButton, for: .normal)
        titleLabel?.textColor = textColor
        tintColor = textColor
        layer.cornerRadius = 40
        titleLabel?.font = UIFont.systemFont(ofSize: 35)  
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
