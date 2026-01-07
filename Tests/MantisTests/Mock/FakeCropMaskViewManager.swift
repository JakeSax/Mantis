//
//  FakeCropMaskViewManager.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/3/23.
//

@testable import Mantis
import UIKit

class FakeCropMaskViewManager: CropMaskViewManagerProtocol {
    func setup(in _: UIView, cropRatio _: CGFloat) { }
    
    func removeMaskViews() { }
    
    func showDimmingBackground(animated _: Bool) { }
    
    func showVisualEffectBackground(animated _: Bool) { }
    
    func adaptMaskTo(match _: CGRect, cropRatio _: CGFloat) { }
}
