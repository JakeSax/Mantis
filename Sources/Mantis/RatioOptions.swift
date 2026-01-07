//
//  RatioOptions.swift
//  Mantis
//
//  Created by Echo on 8/8/19.
//

import Foundation

public struct RatioOptions: OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let original = RatioOptions(rawValue: 1 << 0)
    public static let square = RatioOptions(rawValue: 1 << 1)
    public static let extraDefaultRatios = RatioOptions(rawValue: 1 << 2)
    public static let custom = RatioOptions(rawValue: 1 << 3)
    
    public static let all: RatioOptions = [original, square, extraDefaultRatios, custom]
}
