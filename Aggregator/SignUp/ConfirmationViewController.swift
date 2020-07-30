//
//  ConfirmationViewController.swift
//  Aggregator
//
//  Created by Владислав on 29.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//
//
// !!!!!!!!!!!!! УБРАТЬ ScrollView из Main.storyboard, закрепить все констраинтами, на айфонах серии Х не выезжает клавиатура.
//
//

import Foundation
import UIKit

class ConfirmationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var buttonPressed: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        buttonPressed.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name:
            UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name:
            UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications () {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView2.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide() {
        scrollView2.contentOffset = CGPoint.zero
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        rightTextField.resignFirstResponder()
        leftTextField.resignFirstResponder()
    }
    

}
