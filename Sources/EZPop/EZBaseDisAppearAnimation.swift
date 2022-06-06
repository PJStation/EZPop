//
//  EZBaseDisAppearAnimation.swift
//  PJPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import UIKit

class EZBaseDisAppearAnimation: NSObject, EZDisAppearAnimatedTransitioning{
    
    var duration: TimeInterval = 0.35
    
    var dampingRatio: CGFloat = 1.0
    
    var velocity: CGFloat = 0.1
    
    var delay: CGFloat = 0.0
    
    var options: UIView.AnimationOptions = [UIView.AnimationOptions.curveEaseInOut]
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

    }
    

}
