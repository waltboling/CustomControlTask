//
//  SideBar.swift
//  CustomControlTask
//
//  Created by Jon Boling on 3/27/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIView {
    var letters = [UIButton]()
    var selector: UIView!
    
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
    var commaSeparatedButtonTitles: String = "" {
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
    
    func updateView() {
        letters.removeAll()
        subviews.forEach {$0.removeFromSuperview()}
        
        let labelTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for labelTitle in labelTitles {
            let button = UIButton(type: .system)
            button.setTitle(labelTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            // button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            letters.append(button)
        }
        
        letters[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(labelTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: selectorWidth))
        selector.layer.cornerRadius = selectorWidth / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let sv = UIStackView(arrangedSubviews: letters)
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}

