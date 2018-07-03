//
//  AlertListCustom.swift
//  LearnComponent
//
//  Created by Nguyen Duc Tin on 7/2/18.
//  Copyright © 2018 Cao Tien. All rights reserved.
//

import UIKit

class AlertRadioGroup: UIAlertController {
    
    @objc func buttonEvent(sender: UIButton!) {
        print("Click radio button", sender.tag)
        selected = sender.tag
        for button in buttons {
            button.isSelected = false
        }
        sender.isSelected = true
    }
    
    var didSelectedItem: ((_ item: Int)->(Void))? {
        didSet {
            //  setupFinished!(startValue,endValue)
        }
    }
    
    var buttons = [UIButton]()
    var tableData: Array<String> = []
    var selected = 0
    
    func additem(data: Array<String>){
        tableData = data
        
    }
    
    func setSelected(select:Int){
        self.selected = select
        
        
    }
    func build(){
        print("build")
        
        let margin:CGFloat = 10.0
        let count = tableData.count
        let height = CGFloat(count*30) + CGFloat(2*margin) + 30 //30 sau cung la height cua title
        
        let alertController = self
        
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: height)
        let customView = UIView(frame: rect)
        customView.backgroundColor = .clear
        
        var mHeight = 100
        
        for i in 0...tableData.count-1{
            let y = 40 + i*35
            mHeight += 35
            var buttonn = UIButton()
            buttonn = UIButton(frame: CGRect(x: 10, y: y, width: 30, height: 30))
            buttonn.backgroundColor = .clear
            buttonn.tag = i
            buttonn.setImage(#imageLiteral(resourceName: "ic_radio_unchecked_component.png"), for: UIControlState.normal)
            buttonn.setImage(#imageLiteral(resourceName: "ic_radio_checked_component.png"), for: UIControlState.selected)
            //  buttonn.addTarget(target, action: action, for: .touchUpInside)
            buttonn.addTarget(self, action: #selector(self.buttonEvent), for: .touchUpInside)
            
            buttonn.isSelected = false
            if(i == selected){
                buttonn.isSelected = true
            }
            
            buttons.append(buttonn)
            
            var label = UILabel()
            label = UILabel(frame: CGRect(x: 50, y: y, width: 200, height: 30))
            label.text = tableData[i]
            customView.addSubview(buttonn)
            customView.addSubview(label)
        }
        alertController.view.removeFromSuperview()
        alertController.view.addSubview(customView)
        let cancelAction = UIAlertAction(title: "Choose", style: .cancel, handler: {(alert: UIAlertAction!) in
            self.didSelectedItem?(self.selected)
            
        })
        alertController.addAction(cancelAction)
        
        //let mHeight = 400
        let height1:NSLayoutConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(mHeight))
        alertController.view.addConstraint(height1);
        
        
    }
    
    
}
