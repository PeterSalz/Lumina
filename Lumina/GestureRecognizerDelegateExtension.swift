//
//  GestureRecognizerDelegateExtension.swift
//  Lumina
//
//  Created by Peter Salz on 15.02.18.
//  Copyright © 2018 Peter Salz. All rights reserved.
//

import Foundation

extension LuminaViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool
    {
        if gestureRecognizer.isKind(of: UIPinchGestureRecognizer.self)
        {
            beginZoomScale = currentZoomScale
        }
        
        return true
    }
}
