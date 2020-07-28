//
//  SignUpViewController.swift
//  Aggregator
//
//  Created by Владислав on 27.07.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var whiteMenuRectangle: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 7 // Радиус кнопки
        whiteMenuRectangle.layer.cornerRadius = 7
    }
}
