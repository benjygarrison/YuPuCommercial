//
//  YupuColorView.swift
//  YuPu
//
//  Created by Ben Garrison on 2/20/22.
//

import UIKit

class YupuColorView: UIView {
    
    init(color: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

