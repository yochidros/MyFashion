//
//  ActionSheetViewController.swift
//  MyFashion
//
//  Created by Yoshiki Miyazawa on 2019/08/01.
//  Copyright © 2019 yochidros. All rights reserved.
//

import UIKit

enum ActionItem {
    case normal
    case cancel
}

protocol ActionSheetViewControllerDelegate: class {
    func closeSheet(_ view: ActionSheetViewController)
}
class ActionSheetViewController: UIViewController {

    @IBOutlet weak var overlayView: UIView?
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var buttonStackView: UIStackView?
    @IBOutlet weak var cancelButton: UIButton?
    
    weak var delegate: ActionSheetViewControllerDelegate?
    
    init(delegate: ActionSheetViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: ActionSheetViewController.className, bundle: nil)
        transitioningDelegate = self
        modalPresentationStyle = .overCurrentContext
        definesPresentationContext = true
        providesPresentationContextTransitionStyle = true
        modalPresentationCapturesStatusBarAppearance = true
        self.view.backgroundColor = .clear
    }
    
    deinit {
        print(transitioningDelegate)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCancelView()
    }
    
    private func prepareCancelView() {
        self.overlayView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedCancel(_:))))
        self.cancelButton?.addTarget(self, action: #selector(didTappedCancel(_:)), for: .touchUpInside)
    }
    
    @objc func didTappedCancel(_ sender: UIButton) {
        delegate?.closeSheet(self)
        print(transitioningDelegate)
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }

}
extension ActionSheetViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetDismissAnimator()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetPresentAnimator()
    }
}
