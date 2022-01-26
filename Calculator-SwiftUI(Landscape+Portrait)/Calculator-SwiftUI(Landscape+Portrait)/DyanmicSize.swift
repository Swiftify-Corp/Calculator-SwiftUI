//
//  DyanmicSize.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 26/01/22.
//

import SwiftUI

struct DynamicSize {
    static var isPortrait = true
    
    // Use width and height from Dynamic Size in Portrait Mode
    static private let portraitWidth: CGFloat = 320
    static private let portraitHeight: CGFloat = 568

    // Use width and height from Dynamic Size in Landscape Mode
    static private let landscapeWidth: CGFloat = 568
    static private let landscapeHeight: CGFloat = 320
    
    static func getBaseViewHeight() -> CGFloat {
        if isPortrait {
            return portraitHeight
        } else {
            return landscapeHeight
        }
    }
    
    static func getBaseViewWidth() -> CGFloat {
        if isPortrait {
            return portraitWidth
        } else {
            return landscapeWidth
        }
    }

    static func getHeight(_ height: CGFloat) -> CGFloat {
        return (height / getBaseViewHeight()) * UIScreen.main.bounds.height
    }

    static func getWidth(_ width: CGFloat) -> CGFloat {
        return (width / getBaseViewWidth()) * UIScreen.main.bounds.width
    }

    static func getOffsetX(_ x: CGFloat) -> CGFloat {
        return (x / getBaseViewWidth()) * UIScreen.main.bounds.width
    }

    static func getOffsetY(_ y: CGFloat) -> CGFloat {
        return (y / getBaseViewHeight()) * UIScreen.main.bounds.height
    }
}

// --------------------------------------------------------------------------------
// Frame and Offset Helper
// --------------------------------------------------------------------------------
extension View {
    func frame(dynamicWidth: CGFloat? = nil, dynamicHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        frame(
            width: DynamicSize.getWidth(dynamicWidth ?? 0),
            height: DynamicSize.getHeight(dynamicHeight ?? 0),
            alignment: alignment)
    }

    func offset(dynamicX: CGFloat = 0, dynamicY: CGFloat = 0) -> some View {
        offset(x: DynamicSize.getOffsetX(dynamicX), y: DynamicSize.getOffsetY(dynamicY))
    }
}
