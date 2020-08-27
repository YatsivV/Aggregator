//
//  SplashPresenter.swift
//  Aggregator
//
//  Created by Владислав on 27.08.2020.
//  Copyright © 2020 Yatts. All rights reserved.
//

import UIKit

protocol SplashPresenterDescription: class {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

final class SplashPresenter: SplashPresenterDescription {
    
    // MARK: - Properties
    
    private lazy var animator: SplashAnimatorDescription = SplashAnimator(foregroundSplashWindow: foregroundSplashWindow,
                                                                          backgroundSplashWindow: backgroundSplashWindow)
    
    private lazy var foregroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: false, secondLabelIsHidden: false, webSiteIsHidden: false, bigOvalIsHidden: false, upLeftOvalIsHidden: false, lowLeftOvalIsHidden: false, smallOvalIsHidden: false)
        let splashWindow = self.splashWindow(windowLevel: .normal + 1, rootViewController: splashViewController)
        
        return splashWindow
    }()
    
    private lazy var backgroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: false, secondLabelIsHidden: false, webSiteIsHidden: false, bigOvalIsHidden: false, upLeftOvalIsHidden: false, lowLeftOvalIsHidden: false, smallOvalIsHidden: false)
        let splashWindow = self.splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)
        
        return splashWindow
    }()
    
    
    // MARK: - Helpers
    
    private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashViewController?) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)
        
        splashWindow.windowLevel = windowLevel
        splashWindow.rootViewController = rootViewController
        
        return splashWindow
    }
    
    private func splashViewController(with firstLabelIsHidden: Bool, secondLabelIsHidden: Bool, webSiteIsHidden: Bool, bigOvalIsHidden: Bool, upLeftOvalIsHidden: Bool, lowLeftOvalIsHidden: Bool, smallOvalIsHidden: Bool) -> SplashViewController? {
        
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController")
        let splashViewController = viewController as? SplashViewController
        
        splashViewController?.firstLabelIsHidden = firstLabelIsHidden
        splashViewController?.secondLabelIsHidden = secondLabelIsHidden
        splashViewController?.webSiteIsHidden = webSiteIsHidden
        splashViewController?.upLeftOvalIsHidden = upLeftOvalIsHidden
        splashViewController?.lowLeftOvalIsHidden = lowLeftOvalIsHidden
        splashViewController?.smallOvalIsHidden = smallOvalIsHidden
        splashViewController?.bigOvalIsHidden = bigOvalIsHidden

        return splashViewController
    }
    
    // MARK: - SplashPresenterDescription
    
    func present() {
        animator.animateAppearance()
    }
    
    func dismiss(completion: @escaping () -> Void) {
        animator.animateDisappearance(completion: completion)
    }
    
}

    
