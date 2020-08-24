//
//  ConfirmationViewController.swift
//  Aggregator
//
//  Created by Владислав on 29.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//
//


import Foundation
import UIKit

class ConfirmationViewController: UIViewController, UITextViewDelegate {
    
// MARK: IBOutlets
    
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var buttonPressed: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!
    
// MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        buttonPressed.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
    }
    
// MARK: UIKeyboardInsert
    
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
        let userInfo = notification.userInfo // получаем уведомление чтобы вытащить информацию
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue // узнаем размер клавиатуры
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height) // y: kbFrameSize.height - высота клавиатуры
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        rightTextField.resignFirstResponder()
        leftTextField.resignFirstResponder()
    }
    

}
