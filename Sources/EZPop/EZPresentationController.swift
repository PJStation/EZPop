//
//  EZPresentationController.swift
//  EZPoPView
//
//  Created by 孙鹏举 on 2022/6/2.
//

import UIKit

public class EZPresentationController: UIPresentationController {
    /** 弹窗最终停留位置 default is bottom*/
    public var position: EZPopViewStopPosition = .bottom
    /** present视图大小，默认是屏幕宽度，高度400*/
    public var preferredPresentedViewSize:CGSize = CGSize(width: screenWidth, height: 400) {
        didSet {
            appearTransitioning.preferredTransitioningSize = preferredPresentedViewSize;
        }
    }
    /** 是否需要背景模糊磨砂毛玻璃效果，default is NO*/
    public var hudBlurEffect = false
    /** 是否可以点击背景关闭，default is YES*/
    public var fastClose = true

    /** 圆角设置: 例如左上、右上 rectCorners = UIRectCornerTopLeft | UIRectCornerTopRight 默认为UIRectCornerAllCorners*/
    public var rectCorners: UIRectCorner = .allCorners
    /** 圆角值 default is 0.0*/
    public var cornerRadius = 0
    /** 背景色 default is @"000000"*/
    public var backgroundColor = UIColor.gray
    /** 背景透明度 default is 0.4*/
//    var alpha =

    
    private lazy var visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.isUserInteractionEnabled = true
        visualEffectView.addGestureRecognizer(tapGestureRecognizer)
        return visualEffectView
    }()
    
    /** present动画效果，default is EZPresentAnimation*/
    private lazy var appearTransitioning: EZAppearAnimatedTransitioning = {
        let transitioning = EZPresentAnimation()
        return transitioning
    }()
    /** dismiss动画效果，default is EZDismissAnimation*/
    private lazy var disAppearTransitioning: EZDisAppearAnimatedTransitioning = {
        let transitioning = EZDismissAnimation()
        return transitioning
    }()
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gesture_dismiss))
        return tapGestureRecognizer
    }()
    

    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
//        containerView?.backgroundColor = .white
        presentedViewController.modalPresentationStyle = .custom
        presentingViewController?.transitioningDelegate = self
        presentedViewController.transitioningDelegate = self

    }
    
    @objc private func gesture_dismiss(){
        presentedViewController.dismiss(animated: true)
    }
    



    public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.preferredContentSizeDidChange(forChildContentContainer: container)
//        let presentedContainer = presentedViewController as UIContentContainer
//        if container == presentedContainer {
            containerView?.setNeedsLayout()
//        }
    }

    
    public override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return container.preferredContentSize
    }
    
    
    public override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        if hudBlurEffect {
            visualEffectView.frame = containerView?.bounds ?? .zero
        }

        let maskPath = UIBezierPath(roundedRect: presentedView?.bounds ?? .zero, byRoundingCorners: rectCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = presentedView?.bounds ?? .zero
        maskLayer.path = maskPath.cgPath
        presentedView?.layer.mask = maskLayer
        
    }
    
//    public override func containerViewDidLayoutSubviews() {
//        super.containerViewDidLayoutSubviews()
//        self.presentedView?.frame = self.frameOfPresentedViewInContainerView;
//    }

    public override var shouldPresentInFullscreen: Bool {
        return false
    }
    
    public override var preferredContentSize: CGSize {
        return preferredPresentedViewSize
    }
    
    public override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: (screenWidth-preferredContentSize.width)/2, y: screenHeight-preferredContentSize.height, width: preferredContentSize.width, height: preferredContentSize.height)
    }

    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
//        presentedView?.frame = frameOfPresentedViewInContainerView

        containerView?.addGestureRecognizer(tapGestureRecognizer)
        if hudBlurEffect {
            containerView?.addSubview(visualEffectView)
        }
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { context in
            self.containerView?.backgroundColor = self.backgroundColor
        }, completion: nil)
    }
    

    public override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        if completed {
//            visualEffectView.removeFromSuperview()
        }
        
    }


    public override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { context in
//            self.visualEffectView.alpha = 0
        }, completion: nil)
    }

    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        
    }

}

extension EZPresentationController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return appearTransitioning
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return disAppearTransitioning
    }
    
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    }
//    
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
//
//    }

    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return self
    }
}

