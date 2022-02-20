//
//  YupuImageView.swift
//  YuPu
//
//  Created by Ben Garrison on 2/15/22.
//

import UIKit

class YupuImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(frame: .zero)
        
        self.image = image
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2).isActive = true
        self.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .horizontal)
        self.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .horizontal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
