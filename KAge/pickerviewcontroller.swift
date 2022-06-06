//
//  pickerviewcontroller.swift
//  practice
//
//  Created by SayukiYamada on 2022/06/02.
//

import UIKit

class pickerviewcontroller: UIPickerView {
    func showHalfModal(){
        let picker = PHPickerViewController()
        picker.delegate = self
        if let sheet = picker.sheetPresentationController{
            sheet.detents = [.mediam(),.large()]
        }
        present(picker,nimated: true)
    }
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
