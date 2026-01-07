//
//  FakeCropWorkbenchView.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/3/23.
//

@testable import Mantis
import UIKit

class FakeCropWorkbenchView: UIScrollView, CropWorkbenchViewProtocol {
    var imageContainer: ImageContainerProtocol?
    
    var touchesBegan: () -> Void = { }
    
    var touchesCancelled: () -> Void = { }
    
    var touchesEnded: () -> Void = { }
    
    func checkContentOffset() { }
    
    func updateContentOffset() { }
    
    func updateMinZoomScale() { }
    
    func zoomScaleToBound(animated _: Bool) { }
    
    func shouldScale() -> Bool {
        false
    }
    
    func updateLayout(byNewSize _: CGSize) { }
    
    func reset(by _: CGRect) { }
    
    func resetImageContent(by _: CGRect) { }
}
