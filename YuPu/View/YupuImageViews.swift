//
//  YupuImageView.swift
//  YuPu
//
//  Created by Ben Garrison on 2/15/22.
//

import UIKit

//MARK: Main Yupu image view
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

//MARK: Image view for Yupu buttons
class YupuButtonImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(frame: .zero)
        
        self.image = image
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Image view for dialog box
class DialogImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        
        self.image = UIImage(named: "Speech-Bubble")
        self.contentMode = .scaleAspectFit
        self.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
