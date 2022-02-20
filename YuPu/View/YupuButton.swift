//
//  YupuButtons.swift
//  YuPu
//
//  Created by Ben Garrison on 2/19/22.
//

import UIKit

class YupuButton: UIButton {
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        
        self.setBackgroundImage(image, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
