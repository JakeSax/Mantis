//
//  FakeRotationDialView.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/3/23.
//

@testable import Mantis
import UIKit

class FakeRotationDialView: UIView, RotationDialProtocol {
    var isAttachedToCropView = true
    
    var pointerHeight: CGFloat = 0
    
    var spanBetweenDialPlateAndPointer: CGFloat = 0
    
    var pointerWidth: CGFloat = 0
    
    var didUpdateRotationValue: (Angle) -> Void = { _ in }
    
    var didFinishRotation: () -> Void = { }
    
    func setupUI(withAllowableFrame _: CGRect) { }
    
    func updateRotationValue(by _: Angle) -> Bool {
        false
    }
    
    func rotateDialPlate(to _: Angle, animated _: Bool) { }
    
    func getRotationAngle() -> Angle {
        .init(degrees: 0)
    }
    
    func setRotationCenter(by _: CGPoint, of _: UIView) { }
    
    func reset() { }
    
    func getTotalRotationValue() -> CGFloat {
        0
    }
}
