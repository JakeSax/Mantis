//
//  CropAuxiliaryIndicatorViewProtocol.swift
//  Mantis
//
//  Created by yingtguo on 12/15/22.
//

import UIKit

enum GridLineNumberType {
    case none
    case crop
    case rotate
    
    func getIndicatorLineNumber() -> Int {
        switch self {
        case .none:
            0
        case .crop:
            2
        case .rotate:
            8
        }
    }
}

protocol CropAuxiliaryIndicatorViewProtocol: UIView {
    var gridLineNumberType: GridLineNumberType { get set }
    var gridHidden: Bool { get set }
    var cropBoxHotAreaUnit: CGFloat { get set }
    
    func handleIndicatorHandleTouched(with tappedEdge: CropViewAuxiliaryIndicatorHandleType)
    func handleEdgeUntouched()
}
