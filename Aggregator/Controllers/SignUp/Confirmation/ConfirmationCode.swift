//
//  ConfirmationCode.swift
//  Aggregator
//
//  Created by Владислав on 02.08.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import Foundation
import UIKit

class ConfirmationCode: UIViewController, UITextViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var buttonPressed: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var wrongCodeLabel: UILabel!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        buttonPressed.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
        wrongCodeLabel.isHidden = true

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
    
    // MARK: Рабочие функции проверки
    
    func codeIsTrue () {
        buttonPressed.backgroundColor = .black
        buttonPressed.setTitleColor(.white, for: .normal) // .normal - состояние кнопки
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
}

    
    

