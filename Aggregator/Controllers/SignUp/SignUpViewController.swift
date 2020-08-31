//
//  SignUpViewController.swift
//  Aggregator
//
//  Created by Владислав on 27.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController, UITextViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var loginPlaceholder: UITextField!
    @IBOutlet weak var emailPlaceholder: UITextField!
    @IBOutlet weak var passwordPlaceholder: UITextField!
    @IBOutlet weak var iHaveAnAccountAlready: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewLogo: UIScrollView!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        createAccount.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
    }
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
    }
    
    // MARK: - UIKeyboardInsert
    
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
    
    // MARK: - IBActions
    
    @IBAction func createAccount(_ sender: Any) {
        guard let email = emailPlaceholder.text, let password = passwordPlaceholder.text, email != "", password != "" else {
        //warningButton()
        //warningShape()
        //warningLabel(withText: "Заполните поле")
        return
            
        }
            Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] (user, eror) in
                if eror != nil {
                    //self?.warningLabel(withText: "Произошла ошибка")
                    return
                }
                if user != nil {
                    self?.performSegue(withIdentifier: "createAccountDone", sender: nil)
                    return
                }
                //self?.warningLabel(withText: "Несуществующий пользователь")
            })
        }
    
    
    @IBAction func iHaveAnAccountAlready(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
