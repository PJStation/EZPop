//
//  EZDismissAnimation.swift
//  EZPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import UIKit

class EZDismissAnimation: EZBaseDisAppearAnimation {
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: delay, options: options) {
//            fromView?.alpha = 0
            containerView.backgroundColor = UIColor.white.withAlphaComponent(0)
            fromView.frame = CGRect(x: fromView.frame.origin.x, y: containerView.bounds.size.height, width: fromView.bounds.size.width, height: fromView.bounds.size.height)
        } completion: { complete in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }


    }

}
