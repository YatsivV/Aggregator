//
//  ViewController.swift
//  Aggregator
//
//  Created by Владислав on 11.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController, UITextViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dataEmailPlaceholder: UITextField!
    @IBOutlet weak var dataPasswordPlaceholder: UITextField!
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewLogo: UIScrollView!
    @IBOutlet weak var warningButtonFirst: UIButton!
    @IBOutlet weak var redShapeFirst: UIImageView!
    @IBOutlet weak var warningLabelFirst: UILabel!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var warningButtonSecond: UIButton!
    @IBOutlet weak var redShapeSecond: UIImageView!
    @IBOutlet weak var warningLabelSecond: UILabel!
    
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        loginButton.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
        
        warningButtonFirst.isHidden = true; warningButtonSecond.isHidden = true; redShapeFirst.isHidden = true; redShapeSecond.isHidden = true; warningLabelFirst.isHidden = true; warningLabelSecond.isHidden = true; showPasswordButton.isHidden = true
    }
    
    // MARK: viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
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
    
    // MARK: - Animation
    
    func warningLabel(withText text: String) {
        warningLabelFirst.isHidden = false
        warningLabelFirst.text = text
        warningLabelFirst.alpha = 0
        UIView.animate(withDuration: 0.6, delay: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.warningLabelFirst.alpha = 1
            }, completion: {_ in print("bla")
        }
        )}
    
    func warningButton() {
        warningButtonFirst.isHidden = false
        warningButtonFirst.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
        self?.warningButtonFirst.alpha = 1
        }) { _ in print("Animation Done") }
    }
    
    func warningShape() {
        redShapeFirst.isHidden = false
        redShapeFirst.alpha = 0
        redShapeFirst.center.x += 15
        UIView.animate(withDuration: 1, delay: 0.7, options: .curveEaseInOut, animations: { [weak self] in
            self?.redShapeFirst.center.x -= 15
            self?.redShapeFirst.alpha = 1
        }) {completion in
            print ("Animation done")}
    }
    
    func closeWarning() {
        redShapeFirst.isHidden = true
        warningButtonFirst.isHidden = true
        warningLabelFirst.isHidden = true
    }
    
    // MARK: IBActions
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let email = dataEmailPlaceholder.text, let password = dataPasswordPlaceholder.text, email != "", password != "" else {
            warningButton()
            warningShape()
            warningLabel(withText: "Заполните поле")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (user, eror) in
            if eror != nil {
                self?.warningLabel(withText: "Произошла ошибка")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "mainMenuSegue", sender: nil)
                return
            }
            self?.warningLabel(withText: "Несуществующий пользователь")
        })
    }

    
}

    // MARK: Расширение для кастомного NavigationBar

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage ()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    // Расширение используется для всех viewControllers
}


