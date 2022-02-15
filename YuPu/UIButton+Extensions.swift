//
//  UIButton+Extensions.swift
//  YuPu
//
//  Created by Ben Garrison on 2/14/22.
//

import UIKit

extension UIButton {
    
    open override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = false
        }
    }
    
}
