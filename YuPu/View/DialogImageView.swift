//
//  DialogView.swift
//  YuPu
//
//  Created by Ben Garrison on 2/16/22.
//

import UIKit

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

    
    

