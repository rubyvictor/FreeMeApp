//
//  NLNavControllerDelegate.swift
//  Objective
//
//  Created by Kale on 24/1/16.
//  Copyright © 2016 Niveum Labs. All rights reserved.
//

import UIKit

class NLNavControllerDelegate: NSObject, UINavigationControllerDelegate {

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let transition = PushTransition()
        transition.navigationControllerOperation = operation
        
        return transition
    }
}

class PushTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var navigationControllerOperation: UINavigationControllerOperation = UINavigationControllerOperation.None
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView()
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let fromView = fromVC?.view
        let toView = toVC?.view
        
        let containerWidth = container!.frame.size.width
        
        var toInitialFrame = container?.frame
        var fromDestinationFrame = fromView?.frame
        
        if (navigationControllerOperation == UINavigationControllerOperation.Push) {
            
            toInitialFrame?.origin.x = containerWidth
            toView?.frame = toInitialFrame!
            fromDestinationFrame?.origin.x = -containerWidth
        }
        else if (navigationControllerOperation == UINavigationControllerOperation.Pop) {
            
            toInitialFrame?.origin.x = -containerWidth
            toView?.frame = toInitialFrame!
            fromDestinationFrame?.origin.x = containerWidth
        }

        container?.addSubview(toView!)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 1000, initialSpringVelocity: 1, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            toView?.frame = container!.frame
            fromView?.frame = fromDestinationFrame!
            
            }) { (finished) -> Void in

                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
                
        }
    }
}
