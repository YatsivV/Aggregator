//
//  LaunchScreenViewController.swift
//  Aggregator
//
//  Created by Владислав on 26.08.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var bigOval: UIImageView!
    @IBOutlet weak var upLeftOval: UIImageView!
    @IBOutlet weak var lowLeftOval: UIImageView!
    @IBOutlet weak var smallOval: UIImageView!
    @IBOutlet weak var aggregatorLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var webSite: UILabel!
    @IBOutlet weak var telegram: UIImageView!
    @IBOutlet weak var splash: UIImageView!
    
    
    var firstLabelIsHidden: Bool = true
    var secondLabelIsHidden: Bool = true
    var webSiteIsHidden: Bool = true
    var bigOvalIsHidden: Bool = true
    var upLeftOvalIsHidden: Bool = true
    var lowLeftOvalIsHidden: Bool = true
    var smallOvalIsHidden: Bool = true
    
    static let splashView: UIImage = UIImage(named: "telegram")!
    static let telegramFrame: UIImage = UIImage(named: "telegramframe")!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aggregatorLabel.isHidden = firstLabelIsHidden
        promotionLabel.isHidden = secondLabelIsHidden
        webSite.isHidden = webSiteIsHidden
        bigOval.isHidden = bigOvalIsHidden
        upLeftOval.isHidden = upLeftOvalIsHidden
        lowLeftOval.isHidden = lowLeftOvalIsHidden
        smallOval.isHidden = smallOvalIsHidden
    }

}
