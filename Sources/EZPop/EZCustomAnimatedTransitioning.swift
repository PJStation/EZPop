//
//  EZCustomAnimatedTransitioning.swift
//  EZPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import Foundation
import UIKit



protocol EZAppearAnimatedTransitioning: EZBaseAnimatedTransitioning {
    /// present视图大小自定义
    var preferredTransitioningSize: CGSize { get set }
}

protocol EZDisAppearAnimatedTransitioning: EZBaseAnimatedTransitioning {

}

protocol EZBaseAnimatedTransitioning: UIViewControllerAnimatedTransitioning {

    /// 动画持续时间，默认0.25
    var duration: TimeInterval { get set }
    /// 动画阻尼系数 取值范围0～1  default is 0.1 usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
    var dampingRatio: CGFloat { get set }
    /// 动画速度系数 取值范围0～1  default is 0.1 initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。
    var velocity: CGFloat { get set }
    /// 动画延迟执行时间  default is 0.0 不延迟
    var delay: CGFloat { get set }
    /// 动画类型 default is UIViewAnimationOptionCurveEaseInOut
    var options: UIView.AnimationOptions { get set }
}






