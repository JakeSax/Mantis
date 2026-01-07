//
//  RotationDial+Touches.swift
//  PufferExample
//
//  Created by Echo on 5/23/19.
//  Copyright © 2019 Echo. All rights reserved.
//

import UIKit

extension RotationDial {
    override func hitTest(_ point: CGPoint, with _: UIEvent?) -> UIView? {
        let newPoint = convert(point, to: self)
        if bounds.contains(newPoint) {
            return self
        }
        
        return nil
    }
    
    private func handle(_ touches: Set<UITouch>) {
        guard touches.count == 1,
              let touch = touches.first
        else {
            return
        }
        
        viewModel.touchPoint = touch.location(in: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        handle(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        handle(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        didFinishRotation()
        viewModel.touchPoint = nil
    }
    
    override internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            return false
        }
        
        return true
    }
}
