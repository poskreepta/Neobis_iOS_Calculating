//
//  ViewController.swift
//  CalculatorApp
//
//  Created by poskreepta on 18.05.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel: CalculatorViewModelType
    
    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 100)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    private let buttons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    init(viewModel: CalculatorViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(displayLabel)
        displayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        var previousRowButtons: [UIButton] = []
        
        for row in buttons {
            var rowButtons: [UIButton] = []
            var previousButton: UIButton?
            
            for calculatorButton in row {
                let button = UIButton()
                button.setTitle(calculatorButton.title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 33)
                button.layer.cornerRadius = vAdapted(to: 40)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                button.tag = calculatorButton.rawValue
                view.addSubview(button)
                rowButtons.append(button)
                    switch calculatorButton {
                    case .clear, .plusMinus, .percent:
                        button.layer.backgroundColor = UIColor(hexString: "#C8C8CA").cgColor
                        button.setTitleColor(.black, for: .normal)
                    case .add, .subtract, .multiply, .divide, .equal:
                        button.layer.backgroundColor = UIColor(hexString: "#F9B900").cgColor
                    default:
                        button.layer.backgroundColor = UIColor(hexString: "#201b17").cgColor
                    }
                
                button.snp.makeConstraints { make in
                    make.height.equalTo(vAdapted(to: 80))
                    if calculatorButton == .zero {
                        make.width.equalToSuperview().multipliedBy(0.5).offset(-15)
                    } else {
                        make.width.equalToSuperview().multipliedBy(0.25).offset(-17)
                    }
                    
                    if let previousButton = previousButton {
                        make.leading.equalTo(previousButton.snp.trailing).offset(13)
                    } else {
                        make.leading.equalToSuperview().offset(17)
                    }
                    
                    if previousRowButtons.isEmpty {
                        make.top.equalTo(displayLabel.snp.bottom).offset(17)
                    } else {
                        make.top.equalTo(previousRowButtons.last!.snp.bottom).offset(13)
                    }
                    if row == buttons.last {
                        make.bottom.equalTo(view.snp.bottom).offset(-35)
                    }
                }
                previousButton = button
            }
            previousRowButtons = rowButtons
        }
        
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let button = CalculatorButton(rawValue: sender.tag) else {
            return
        }
        viewModel.buttonTapped(button)
        displayLabel.text = viewModel.displayText
    }
    
    
}

