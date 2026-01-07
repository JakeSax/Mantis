//
//  ToolbarButtonOptions.swift
//  Mantis
//
//  Created by Echo on 5/30/20.
//

import Foundation

public struct ToolbarButtonOptions: OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let counterclockwiseRotate = ToolbarButtonOptions(rawValue: 1 << 0)
    public static let clockwiseRotate = ToolbarButtonOptions(rawValue: 1 << 1)
    public static let reset = ToolbarButtonOptions(rawValue: 1 << 2)
    public static let ratio = ToolbarButtonOptions(rawValue: 1 << 3)
    public static let alterCropper90Degree = ToolbarButtonOptions(rawValue: 1 << 4)
    public static let horizontallyFlip = ToolbarButtonOptions(rawValue: 1 << 5)
    public static let verticallyFlip = ToolbarButtonOptions(rawValue: 1 << 6)
    public static let autoAdjust = ToolbarButtonOptions(rawValue: 1 << 7)
    
    public static let `default`: ToolbarButtonOptions = [
        counterclockwiseRotate,
        reset,
        ratio
    ]
    
    public static let all: ToolbarButtonOptions = [
        counterclockwiseRotate,
        clockwiseRotate,
        reset,
        ratio,
        alterCropper90Degree,
        horizontallyFlip,
        verticallyFlip
    ]
}
