//
//  RadioButton.swift
//  LearnComponent
//
//  Created by Nguyen Duc Tin on 6/29/18.
//  Copyright © 2018 Cao Tien. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    // Images
    var checkedImage = UIImage(named: "ic_radio_checked_component")! as UIImage
    var uncheckedImage = UIImage(named: "ic_radio_unchecked_component")! as UIImage
    
    
    
    
    var hintColor : UIColor = UIColor.blue{
        didSet{
            checkedImage = checkedImage.imageWithColor(hintColor)
            uncheckedImage = uncheckedImage.imageWithColor(hintColor)
            updateImage()
            setNeedsDisplay()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        hintColor = UIColor.blue
    }
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            updateImage()
        }
    }
    
    func updateImage(){
        if isChecked == true {
            self.setImage(checkedImage, for: UIControlState.normal)
        } else {
            self.setImage(uncheckedImage, for: UIControlState.normal)
        }
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        
        
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
        
        
        didChangeChecked?(isChecked)
    }
    
    
    var didChangeChecked: ((_ isChecked: Bool)->(Void))? {
        didSet {
            //  setupFinished!(startValue,endValue)
        }
    }
    
    func howotUser(){
        //TODO: Use
        //btnCheckbox.didChangeChecked = {(ischecked) in
        //     print("ischecked: \(ischecked)")
        //}
        //btnCheckbox.hintColor = UIColor.red
        //print("print isChecked = \(isChecked)")
    }
    
}

