//
//  EZPresentAnimatedTransitioning.swift
//  EZPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import UIKit

class EZPresentAnimation: EZBaseAppearAnimation {
    
//    override var delay: CGFloat { return 0.2 }
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {        
        let containerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return  }
        containerView.addSubview(toView)
        containerView.backgroundColor = UIColor.white.withAlphaComponent(0)

        toView.frame = CGRect(x: screenWidth/2 - preferredTransitioningSize.width/2, y: containerView.bounds.size.height, width: preferredTransitioningSize.width, height: preferredTransitioningSize.height)

//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: delay, options: options) {
//            containerView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
//            toView.frame = CGRect(x: toView.frame.origin.x, y: containerView.bounds.size.height-self.preferredTransitioningSize.height, width: toView.frame.size.width, height: toView.frame.size.height)
//        } completion: { complete in
//            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        }

        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: options) {
//            containerView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            toView.frame = CGRect(x: toView.frame.origin.x, y: containerView.bounds.size.height-self.preferredTransitioningSize.height, width: toView.frame.size.width, height: toView.frame.size.height)
        } completion: { complete in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }

    }
}
