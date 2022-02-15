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
        self.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
