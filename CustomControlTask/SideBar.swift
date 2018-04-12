//
//  SideBar.swift
//  CustomControlTask
//
//  Created by Jon Boling on 3/27/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

@IBDesignable
class SideBar: UIView {
    var letters = [UIButton]()
    var selector = [UIView]()
    var selectedLetterIdx = 0
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var buttonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .blue {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    var svBackgroundColor: UIColor = .clear {
        didSet {
            updateView()
        }
    }
    
    func getButtonTitles() -> String{
        return buttonTitles
    }
    
    func updateView() {
        letters.removeAll()
        selector.removeAll()
        subviews.forEach {$0.removeFromSuperview()}
        
        let labelTitles = buttonTitles.components(separatedBy: ",")
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let selectorHeight = self.frame.height / CGFloat(labelTitles.count)
        
        frame.size.height = screenHeight 
        frame.size.width = screenHeight / CGFloat(labelTitles.count)
        
        //create arrays based on user inputs
        for labelTitle in labelTitles {
            let button = UIButton(type: .system)
            button.setTitle(labelTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel!.textAlignment = .right
            button.addTarget(self, action: #selector(buttonTapped(clickedLetter:)), for: .touchUpInside)
            button.backgroundColor = svBackgroundColor
            button.frame.size.width = selectorHeight
            button.frame.size.height = selectorHeight
            letters.append(button)
            
            let selectorHeight = self.frame.height / CGFloat(labelTitles.count)
            let selectorView = UIView(frame: CGRect(x:0, y:0, width: selectorHeight, height: selectorHeight))
            //selectorView.layer.cornerRadius = selectorHeight / 2
            selectorView.backgroundColor = svBackgroundColor
            selectorView.frame.size.width = selectorHeight
            selectorView.frame.size.height = selectorHeight

            selector.append(selectorView)
        }
        
        //set selected index colors
        letters[selectedLetterIdx].setTitleColor(selectorTextColor, for: .normal)
        selector[selectedLetterIdx].backgroundColor = selectorColor
        
        //create selector Stack View
        let selectorStackView = UIStackView(arrangedSubviews: selector)
        selectorStackView.axis = .vertical
        selectorStackView.alignment = .fill
        selectorStackView.distribution = .fillEqually
        selectorStackView.backgroundColor = svBackgroundColor
        addSubview(selectorStackView)
        
        selectorStackView.translatesAutoresizingMaskIntoConstraints = false
        selectorStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        selectorStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        selectorStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        selectorStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        //create letter Stack View
        let sv = UIStackView(arrangedSubviews: letters)
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.backgroundColor = svBackgroundColor
        addSubview(sv)
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTapped(clickedLetter: UIButton) {
        for (letterIndex, currentBtn) in letters.enumerated() {
            currentBtn.setTitleColor(textColor, for: .normal)
            selector[letterIndex].backgroundColor = svBackgroundColor
            if currentBtn == clickedLetter {
                selectedLetterIdx = letterIndex
                currentBtn.setTitleColor(selectorTextColor, for: .normal)
                selector[letterIndex].backgroundColor = selectorColor
            }
        }
    }
}
