//
//  FakeCropAuxiliaryIndicatorView.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/3/23.
//

@testable import Mantis
import UIKit

class FakeCropAuxiliaryIndicatorView: UIView, CropAuxiliaryIndicatorViewProtocol {
    var cropBoxHotAreaUnit: CGFloat = 42
    
    var gridLineNumberType: GridLineNumberType = .none
    
    var gridHidden = false
    
    func setGrid(hidden _: Bool, animated _: Bool) { }
    
    func hideGrid() { }
    
    func handleIndicatorHandleTouched(with _: CropViewAuxiliaryIndicatorHandleType) { }
    
    func handleEdgeUntouched() { }
}
