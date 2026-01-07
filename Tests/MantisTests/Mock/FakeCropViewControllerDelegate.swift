//
//  FakeCropViewControllerDelegate.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/2/23.
//

@testable import Mantis
import UIKit

class FakeCropViewControllerDelegate: CropViewControllerDelegate {
    var didCrop = false
    var didFailedToCrop = false
    var didCancel = false
    var didBeginResize = false
    var didEndResize = false
    var didImageTransformed = false
    
    func cropViewControllerDidCrop(
        _: CropViewController,
        cropped _: UIImage,
        transformation _: Transformation,
        cropInfo _: CropInfo
    ) {
        didCrop = true
    }
    
    func cropViewControllerDidFailToCrop(_: CropViewController, original _: UIImage) {
        didFailedToCrop = true
    }
    
    func cropViewControllerDidCancel(_: CropViewController, original _: UIImage) {
        didCancel = true
    }
    
    func cropViewControllerDidBeginResize(_: CropViewController) {
        didBeginResize = true
    }
    
    func cropViewControllerDidEndResize(_: CropViewController, original _: UIImage, cropInfo _: CropInfo) {
        didEndResize = true
    }
    
    func cropViewControllerDidImageTransformed(_: CropViewController, transformation _: Transformation) {
        didImageTransformed = true
    }
}
