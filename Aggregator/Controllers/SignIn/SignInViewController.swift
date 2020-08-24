//
//  ViewController.swift
//  Aggregator
//
//  Created by Владислав on 11.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dataEmailPlaceholder: UITextField!
    @IBOutlet weak var dataPasswodPlaceholder: UITextField!
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewLogo: UIScrollView!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        loginButton.layer.cornerRadius = 7 // Радиус кнопки
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
        scrollViewLogo.contentOffset = CGPoint(x:0, y: kbFrameSize.height/2.5)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
        scrollViewLogo.contentOffset = CGPoint.zero
    }
    

    
    @IBAction func buttonPressed(_ sender: Any) {
    }
}


