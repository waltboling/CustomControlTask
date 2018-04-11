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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Trying to set constraints to fix control position issues
        SideBar.updateView() // Moved to after constraints
        SideBar.widthAnchor.constraint(equalToConstant: SideBar.frame.size.width).isActive = true
        SideBar.heightAnchor.constraint(equalToConstant: SideBar.frame.size.height).isActive = true
        SideBar.leftAnchor.constraint(equalTo: SideBar.leftAnchor).isActive = true
        SideBar.rightAnchor.constraint(equalTo: SideBar.rightAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Ensures that the item selected will remain selected when screen is rotated
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animateAlongsideTransition(in: nil, animation: nil, completion: {_ in
            self.SideBar.updateView()
        })
    }
}

