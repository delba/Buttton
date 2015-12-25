//
//  Buttton.swift
//
// Copyright (c) 2015 Damien (http://delba.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

extension UIButton {
    /**
     Returns the background color used for a state.
     
     - parameter state: The state that uses the background color.
     
     - returns: The background color for the specified state.
     */
    public func backgroundColorForState(state: UIControlState) -> UIColor? {
        return backgroundColors[state.rawValue]
    }
    
    /**
     Sets the background color to use for the specified state.
     
     - parameter color: The color of the background to use for the specified state.
     - parameter state: The state that uses the specified color.
     */
    public func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
        backgroundColors[state.rawValue] = color
    }
    
    /**
     Returns the corner radius used for a state.
     
     - parameter state: The state that uses the corner radius.
     
     - returns: The corner radius for the specified state.
     */
    public func cornerRadiusForState(state: UIControlState) -> CGFloat? {
        return cornerRadiuses[state.rawValue]
    }
    
    /**
     Sets the corner radius to use for the specified state.
     
     - parameter radius: The corner radius to use for the specified state.
     - parameter state:  The state that uses the specified corner radius.
     */
    public func setCornerRadius(radius: CGFloat, forState state: UIControlState) {
        cornerRadiuses[state.rawValue] = radius
    }
    
    /**
     Returns the border width used for a state.
     
     - parameter state: The state that uses the border width.
     
     - returns: The border width for the specified state.
     */
    public func borderWidthForState(state: UIControlState) -> CGFloat? {
        return borderWidths[state.rawValue]
    }
    
    /**
     Sets the border width to use for the specified state.
     
     - parameter width: The border width to use for the specified state.
     - parameter state: The state that uses the specified border width.
     */
    public func setBorderWidth(width: CGFloat?, forState state: UIControlState) {
        borderWidths[state.rawValue] = width
    }
    
    /**
     Returns the border color used for a state.
     
     - parameter state: The state that uses the border color.
     
     - returns: The border color for the specified state.
     */
    public func borderColorForState(state: UIControlState) -> UIColor? {
        return borderColors[state.rawValue]
    }
    
    /**
     Sets the border color to use for the specified state.
     
     - parameter color: The border color to use for the specified state.
     - parameter state: The state that uses the specified border color.
     */
    public func setBorderColor(color: UIColor?, forState state: UIControlState) {
        borderColors[state.rawValue] = color
    }
}

extension UIButton: Swizzler {
    public override class func initialize() {
        swizzle("layoutSubviews", replacement: "buttton_layoutSubviews")
    }
    
    public func buttton_layoutSubviews() {
        buttton_layoutSubviews()
        
        if let color = backgroundColorForState(state) {
            backgroundColor = color
        }
        
        if let radius = cornerRadiusForState(state) {
            layer.cornerRadius = radius
        }
        
        if let width = borderWidthForState(state) {
            layer.borderWidth = width
        }
        
        if let color = borderColorForState(state) {
            layer.borderColor = color.CGColor
        }
    }
}

extension UIButton: AssociatedObject {
    private var backgroundColors: [UInt: UIColor] {
        get { return associatedObject(&.backgroundColors) as? [UInt: UIColor] ?? [:] }
        set { associatedObject(&.backgroundColors, object: newValue) }
    }
    
    private var cornerRadiuses: [UInt: CGFloat] {
        get { return associatedObject(&.cornerRadiuses) as? [UInt: CGFloat] ?? [:] }
        set { associatedObject(&.cornerRadiuses, object: newValue) }
    }
    
    private var borderWidths: [UInt: CGFloat] {
        get { return associatedObject(&.borderWidths) as? [UInt: CGFloat] ?? [:] }
        set { associatedObject(&.borderWidths, object: newValue) }
    }
    
    private var borderColors: [UInt: UIColor] {
        get { return associatedObject(&.borderColors) as? [UInt: UIColor] ?? [:] }
        set { associatedObject(&.borderColors, object: newValue) }
    }
}

private extension String {
    static var backgroundColors = "buttton_backgroundColors"
    static var cornerRadiuses   = "buttton_cornerRadiuses"
    static var borderWidths     = "buttton_borderWidths"
    static var borderColors     = "buttton_borderColors"
}