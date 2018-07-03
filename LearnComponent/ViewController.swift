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

    @objc func dailyScheduleChange(sender: UIButton!) {
        print("Main Button tapped", sender.tag)
      //  alertDailySchedule.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressClickMe(_ sender: Any) {
        
        let mAlertRadio = AlertRadioGroup(title: "title", message: nil, preferredStyle: .alert)
        
        mAlertRadio.additem(data: ["5-1-1 Scheduling", "Daily Scheduling", "Daily Scheduling", "Daily Scheduling", "Daily Scheduling"])
        mAlertRadio.setSelected(select: 1)        
        mAlertRadio.didSelectedItem =  { (item) in
            print("Select radio button \(item)")
        }
   
         mAlertRadio.build()
        self.present(mAlertRadio, animated: true)
        
    }
    
    @objc func buttonAction1(sender: UIButton!) {
        print("Main aaa Button tapped", sender.tag)
        //alert1.dismiss(animated: true, completion: nil)
    }
    
    

}

