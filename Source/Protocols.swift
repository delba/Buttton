//
//  Protocols.swift
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

// MARK: - Hashable

extension UIControlState: Hashable {
   public var hashValue: Int { return Int(rawValue) } 
}

// MARK: - AssociatedObject

internal protocol AssociatedObject {}

extension AssociatedObject where Self: AnyObject {
    func associatedObject(inout key: String) -> AnyObject! {
        return objc_getAssociatedObject(self, &key)
    }
    
    func associatedObject(inout key: String, object: AnyObject) {
        objc_setAssociatedObject(self, &key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

// MARK: - Method Swizzling

internal protocol Swizzler {}

extension Swizzler where Self: AnyObject {
    static func swizzle(original: Selector, replacement: Selector) {
        var token: dispatch_once_t = 0
        
        dispatch_once(&token) {
            let originalMethod = class_getInstanceMethod(self, original)
            guard originalMethod != nil else { return }
            
            let swizzledMethod = class_getInstanceMethod(self, replacement)
            guard swizzledMethod != nil else { return }
            
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}