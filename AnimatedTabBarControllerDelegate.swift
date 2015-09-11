//
//  AnimatedTabBarControllerDelegate.swift
//  
//
//  Created by Engin Kurutepe on 11/09/15.
//
//

import UIKit

class AnimatedTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let controllers = tabBarController.viewControllers as? [UIViewController] {
            let fromIndex = find(controllers, fromVC)
            
            let toIndex = find(controllers, toVC)
            
            if fromIndex < toIndex {
                return TabBarAnimator(direction: .Left)
            }
            else {
                return TabBarAnimator(direction: .Right)
            }
        }
        else {
            return nil
        }
        
    }
    
    
   
}
