//
//  DyanmicSize.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 26/01/22.
//

import SwiftUI

struct DynamicSize {
    static private let baseViewWidth: CGFloat = 568.0
    static private let baseViewHeight: CGFloat = 320.0

    static func getHeight(_ height: CGFloat) -> CGFloat {
        return (height / baseViewHeight) * UIScreen.main.bounds.height
    }

    static func getWidth(_ width: CGFloat) -> CGFloat {
        return (width / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetX(_ x: CGFloat) -> CGFloat {
        return (x / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetY(_ y: CGFloat) -> CGFloat {
        return (y / baseViewHeight) * UIScreen.main.bounds.height
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

// --------------------------------------------------------------------------------
// SwiftUI View Extension
// --------------------------------------------------------------------------------
extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
