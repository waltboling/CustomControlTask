//
//  ViewController.swift
//  CustomControlTask
//
//  Created by Jon Boling on 3/26/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SideBar: SideBar!
    
    var heightConst: NSLayoutConstraint?
    var widthConst: NSLayoutConstraint?
    var leftConst: NSLayoutConstraint?
    var rightConst: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SideBar.updateView()
        heightConst = SideBar.heightAnchor.constraint(equalToConstant: SideBar.frame.size.height)
        heightConst!.isActive = true
        widthConst = SideBar.widthAnchor.constraint(equalToConstant: SideBar.frame.size.width)
        widthConst!.isActive = true
        leftConst = SideBar.leftAnchor.constraint(equalTo: SideBar.leftAnchor)
        leftConst!.isActive = true
        rightConst = SideBar.rightAnchor.constraint(equalTo: SideBar.rightAnchor)
        rightConst!.isActive = true
    }
    
    //Ensures that the item selected will remain selected when screen is rotated
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animateAlongsideTransition(in: nil, animation: nil, completion: {_ in
            //I don't know that this is working how we want but there is also the constraint in the storyboard that effects this.
            self.heightConst!.isActive = false
            self.heightConst = self.SideBar.heightAnchor.constraint(equalToConstant: size.height)
            self.heightConst!.isActive = true
            
            self.SideBar.updateView()
            
            self.widthConst!.isActive = false
            self.widthConst = self.SideBar.widthAnchor.constraint(equalToConstant: self.SideBar.frame.size.height / CGFloat(self.SideBar.getButtonTitles().count) * 2)
            self.widthConst!.isActive = true
        })
    }
}

