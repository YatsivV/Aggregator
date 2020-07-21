//
//  ViewController.swift
//  Aggregator
//
//  Created by Владислав on 11.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dataEmailPlaceholder: UITextField!
    @IBOutlet weak var dataPasswodPlaceholder: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 7 // Радиус кнопки
        // Vlad: dataEmailPlaceholder
        let dataEmailPlace = UITextView.self
        dataEmailPlaceholder.delegate = self as? UITextFieldDelegate
        func dataEmailPlaceholderWasBeginEditing(_ textView: UITextView) {
            if textView.text == "Почта" {
                textView.text = ""
                textView.returnKeyType = .done
                textView.textColor = UIColor.black
            }
        }
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacmentText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
            }
            return true
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            textView.text = "Почта"
            dataEmailPlaceholder.textColor = UIColor.lightGray
        }
        // Vlad: dataPasswordPlaceholder
        let dataPasswordPlaceholder = UITextView.self
    }
}



