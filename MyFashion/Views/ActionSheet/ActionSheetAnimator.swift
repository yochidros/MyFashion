//
//  ActionSheetAnimator.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/08/01.
//  Copyright © 2019 yochidros. All rights reserved.
//

import Foundation
import UIKit


class ActionSheetPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) as? ActionSheetViewController else {
            transitionContext.cancelInteractiveTransition()
            return
        }

        let containerView = transitionContext.containerView
        let modalFrame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        toViewController.view.frame = modalFrame
        toViewController.overlayView?.alpha = 0.0
        print(containerView.subviews)
        containerView.addSubview(toViewController.view)
        toViewController.view.setNeedsLayout()
        toViewController.view.layoutIfNeeded()
        
        let mainViewHight = toViewController.contentView?.frame.height ?? containerView.frame.height
        toViewController.contentView?.transform = CGAffineTransform(translationX: 0, y: mainViewHight)
        
        let duration = transitionDuration(using: transitionContext)
        
        let animations: () -> Void = { [toViewController] in
            toViewController.overlayView?.alpha = 0.65
            toViewController.contentView?.transform = CGAffineTransform.identity
        }
        
        let completion: (Bool) -> Void = { [transitionContext, toViewController] finished in
           transitionContext.completeTransition(finished)
            toViewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        UIView.animate(withDuration: duration, animations: animations, completion: completion)
    }
}

class ActionSheetDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from) as? ActionSheetViewController,
            let toViewController = transitionContext.viewController(forKey: .to) else {
                transitionContext.cancelInteractiveTransition()
                return
        }
        
        let containerView = transitionContext.containerView
        let mainViewHeight = fromViewController.contentView?.frame.height ?? containerView.frame.height
        let transform = CGAffineTransform(translationX: 0, y: mainViewHeight)
        
        let duration = transitionDuration(using: transitionContext)
        
        let animations: () -> Void = {[fromViewController, transform] in
            fromViewController.overlayView?.alpha = 0
            fromViewController.contentView?.transform = transform
        }
        
        let completion: (Bool) -> Void = { [transitionContext, toViewController] finished in
            transitionContext.completeTransition(finished)
            toViewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        UIView.animate(withDuration: duration, animations: animations, completion: completion)
    }
}
