//
//  EZBaseAppearAnimation.swift
//  PJPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import UIKit

class EZBaseAppearAnimation: NSObject, EZAppearAnimatedTransitioning{
    
    

    /** present视图大小自定义*/
    var preferredTransitioningSize: CGSize = CGSize(width: screenWidth, height: 250)
    /** 动画持续时间，默认0.25*/
    var duration: TimeInterval = 0.4
    /** 动画阻尼系数 取值范围0～1  default is 0.1 usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。*/
    var dampingRatio: CGFloat = 0.8
    /** 动画速度系数 取值范围0～1  default is 0.1 initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。*/
    var velocity: CGFloat = 0.9
    /** 动画延迟执行时间  default is 0.0 不延迟*/
    var delay: CGFloat = 0.0
    /** 动画类型 default is UIViewAnimationOptionCurveEaseInOut*/
    var options: UIView.AnimationOptions = [UIView.AnimationOptions.curveEaseIn]
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

    }
    

}
