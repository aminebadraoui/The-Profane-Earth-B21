//
//  ZoomTransitioningDelegate.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-07.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//

import UIKit

@objc
protocol ZoomingViewController {
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView?
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView?
}
enum TransitionState {
    case initial
    case final
}

class ZoomTransitioningDelegate: NSObject
{
    var transitionDuration = 5.0
    var operation: UINavigationControllerOperation = .none
    private var zoomScale = CGFloat(15)
    private var backgroundScale = CGFloat(0.7)
    
    typealias ZoomingViews = (otherView: UIView, imageView: UIView)
    
    func configureViews(for state: TransitionState, containerView: UIView, backgroundViewController: UIViewController, viewsInBackground: ZoomingViews, viewsinForeground: ZoomingViews, snapshotViews: ZoomingViews){
        switch state{
        case.initial:
            backgroundViewController.view.transform = CGAffineTransform.identity
            backgroundViewController.view.alpha = 1
            
            snapshotViews.imageView.frame = containerView.convert(viewsInBackground.imageView.frame, from: viewsInBackground.imageView.superview)
            
            
        case.final:
            backgroundViewController.view.transform = CGAffineTransform(scaleX: backgroundScale, y: backgroundScale) 
            backgroundViewController.view.alpha = 0
            
            snapshotViews.imageView.frame = containerView.convert(viewsinForeground.imageView.frame, from: viewsinForeground.imageView.superview)
           
        }
    }
}

extension ZoomTransitioningDelegate:  UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: transitionContext)
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        var backgroundViewController = fromViewController
        var foregroundViewController = toViewController
        
        if operation == .pop {
            backgroundViewController = toViewController
            foregroundViewController = fromViewController
        }
        
        let maybeBackgroundImageView = (backgroundViewController as? ZoomingViewController)?.zoomingImageView(for: self)
         let maybeForegroundImageView = (foregroundViewController as? ZoomingViewController)?.zoomingImageView(for: self)
        
        assert(maybeBackgroundImageView != nil, "Cannot find imageview in backgroundVC")
         assert(maybeForegroundImageView != nil, "Cannot find imageview in foregroundVC")
        
        let backgroundImageView = maybeBackgroundImageView!
        let foregroundImageView = maybeForegroundImageView!
        
        let imageSnapShot = UIImageView(image: backgroundImageView.image)
        imageSnapShot.contentMode = .scaleAspectFill
        imageSnapShot.layer.masksToBounds = true
        
        backgroundImageView.isHidden = true
        maybeForegroundImageView?.isHidden = true
        let foregroundVCBackgroundColor = foregroundViewController?.view.backgroundColor
        foregroundViewController?.view.backgroundColor = UIColor.clear
        containerView.backgroundColor = UIColor.white
        
        containerView.addSubview((backgroundViewController?.view)!)
        containerView.addSubview((foregroundViewController?.view)!)
        containerView.addSubview(imageSnapShot)
        
        var preTransitionPhase = TransitionState.initial
        var postTransitionPhase = TransitionState.final
        
        if operation == .pop {
            var preTransitionPhase = TransitionState.final
            var postTransitionPhase = TransitionState.initial
        }
        
        configureViews(for: preTransitionPhase, containerView: containerView, backgroundViewController: backgroundViewController!, viewsInBackground: (backgroundImageView,backgroundImageView), viewsinForeground: (foregroundImageView,foregroundImageView), snapshotViews: (imageSnapShot,imageSnapShot))
        
        foregroundViewController?.view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            self.configureViews(for: postTransitionPhase, containerView: containerView, backgroundViewController: backgroundViewController!, viewsInBackground: (backgroundImageView,backgroundImageView), viewsinForeground: (foregroundImageView,foregroundImageView), snapshotViews: (imageSnapShot,imageSnapShot))
            
        }) { (finished) in
            backgroundViewController?.view.transform = CGAffineTransform.identity
            imageSnapShot.removeFromSuperview()
            backgroundImageView.isHidden = false
            foregroundImageView.isHidden = false
            foregroundViewController?.view.backgroundColor = foregroundVCBackgroundColor
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        
        
        
    }
}

extension ZoomTransitioningDelegate: UINavigationControllerDelegate
{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       self.operation = operation
        if fromVC is ZoomingViewController && toVC is ZoomingViewController {
            return self
        }
        else {
            return nil
        }
    }
}

