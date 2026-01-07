//
//  FakeImageContainer.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/3/23.
//

@testable import Mantis
import UIKit

class FakeImageContainer: UIView, ImageContainerProtocol {
    func contains(rect _: CGRect, fromView _: UIView, tolerance _: CGFloat) -> Bool {
        false
    }
    
    func getCropRegion(withCropBoxFrame _: CGRect, cropView _: UIView) -> CropRegion {
        CropRegion(topLeft: .zero, topRight: .zero, bottomLeft: .zero, bottomRight: .zero)
    }
}
