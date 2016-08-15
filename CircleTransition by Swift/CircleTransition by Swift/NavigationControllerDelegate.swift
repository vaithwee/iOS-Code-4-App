//
//  NavigationControllerDelegate.swift
//  CircleTransition by Swift
//
//  Created by Vaith on 16/8/15.
//  Copyright © 2016年 Vaith. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate
{
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (operation == .Pop)
        {
            return CircleTransitionPopAnimator();
        }
        else
        {
            return CircleTransitionPushAnimator();
        }
    }

}
