//
//  TabBarAnimator.swift
//  
//
//  Created by Engin Kurutepe on 11/09/15.
//
//

import UIKit

enum AnimationDirection {
    case Left
    case Right
}

class TabBarAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var direction: AnimationDirection
    
    init(direction: AnimationDirection) {
        self.direction = direction
        super.init()
    }
    
    
    let duration = 0.5
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let inView = transitionContext.containerView()
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let fromView = fromVC?.view
        let toView = toVC?.view
        

        let centerRect = transitionContext.finalFrameForViewController(toVC!)
        
        let gap = CGFloat(20.0)

        let offset: CGFloat
        if direction == .Left {
            offset = CGRectGetWidth(centerRect)+gap
        }
        else {
            offset = -(CGRectGetWidth(centerRect)+gap)
        }
        
        let leadingRect = CGRectOffset(centerRect, -offset, 0);
        let trailingRect = CGRectOffset(centerRect, offset, 0);

        toView?.frame = trailingRect
        inView.addSubview(toView!)
        
        UIView.animateWithDuration(duration, delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.5,
            options: UIViewAnimationOptions.allZeros,
            animations: { () -> Void in
                toView?.frame = centerRect
                fromView?.frame = leadingRect;
            }, completion: { finished in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(finished)
            })

    }
   
}
