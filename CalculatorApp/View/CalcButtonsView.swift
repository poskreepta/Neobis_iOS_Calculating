//
//  CalcButtonsView.swift
//  CalculatorApp
//
//  Created by poskreepta on 18.05.23.
//

import UIKit

class CalcButtonsView: UIView {
    
    let displaylabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 100)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let buttonAC: CustomUIButton = {
        let button = CustomUIButton(nameButton: "AC", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonPlusMinus: CustomUIButton = {
        let button = CustomUIButton(nameButton: "+/-", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonPercentage: CustomUIButton = {
        let button = CustomUIButton(nameButton: "%", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonDivide: CustomUIButton = {
        let button = CustomUIButton(nameButton: "/", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonMultiply: CustomUIButton = {
        let button = CustomUIButton(nameButton: "*", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonMinus: CustomUIButton = {
        let button = CustomUIButton(nameButton: "-", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonPlus: CustomUIButton = {
        let button = CustomUIButton(nameButton: "+", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let buttonEqual: CustomUIButton = {
        let button = CustomUIButton(nameButton: "=", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button1: CustomUIButton = {
        let button = CustomUIButton(nameButton: "1", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button2: CustomUIButton = {
        let button = CustomUIButton(nameButton: "2", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button3: CustomUIButton = {
        let button = CustomUIButton(nameButton: "3", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button4: CustomUIButton = {
        let button = CustomUIButton(nameButton: "4", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button5: CustomUIButton = {
        let button = CustomUIButton(nameButton: "5", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button6: CustomUIButton = {
        let button = CustomUIButton(nameButton: "6", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button7: CustomUIButton = {
        let button = CustomUIButton(nameButton: "7", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button8: CustomUIButton = {
        let button = CustomUIButton(nameButton: "8", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button9: CustomUIButton = {
        let button = CustomUIButton(nameButton: "9", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let button0: CustomUIButton = {
        let button = CustomUIButton(nameButton: "0", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    let decimalPoint: CustomUIButton = {
        let button = CustomUIButton(nameButton: ".", buttonColor: .lightGray, textColor: .black)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .black
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        setupNumberButtons()
        setupOperationButtons()
        
        
    }
    
    private func setupNumberButtons() {
        let buttons = [button0,button1,button2,button3,button4,button5,button6,button7,button8,button9]
        for button in buttons {
            button.addTarget(self, action: #selector(numberButtonTapped), for: .touchUpInside)
            addSubview(button)
        }
    }
    
    func setupOperationButtons() {
        let buttons = [buttonPlus, buttonMinus, buttonMultiply, buttonDivide]
        for button in buttons {
            button.addTarget(self, action: #selector(operationButtonTapped), for: .touchUpInside)
            addSubview(button)
        }
    }
    
    @objc private func operationButtonTapped() {
        if let text = displaylabel.text, let value = Float(text) {
            operationPressed?(value, sender.)
        }
        answerlabel.text = "0"
        //        if let text = answerlabel.text, let value = Float(text) {
        //            operationPressed?(value,sender.tag)
        //        }
        //        answerlabel.text = "0"
    }
    
    
    //        if let text = answerlabel.text, let value = Float(text) {
    //            operationPressed?(value,sender.tag)
    //        }
    //        answerlabel.text = "0"
    
    
    
    
    
    @objc private func numberButtonTapped(_ sender: UIButton) {
        if displaylabel.text == "0" {
            displaylabel.text = sender.title(for: .normal)
        } else if let text = displaylabel.text {
            displaylabel.text = "\(text)\(String(describing: sender.title(for: .normal)))"
        }
    }
    
    func setupConstraints() {
        
    }
    
    
    
    
}
