//
//  ViewController.swift
//  LearnComponent
//
//  Created by Nguyen Duc Tin on 6/29/18.
//  Copyright © 2018 Cao Tien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCheckbox: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //btnCheckbox.hintColor = UIColor.black
        
        btnCheckbox.didChangeChecked = {(ischecked) in
            print("ischecked: \(ischecked)")
        }
       btnCheckbox.hintColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    

}

