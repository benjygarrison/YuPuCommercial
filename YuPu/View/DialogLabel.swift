//
//  DialogLabel.swift
//  YuPu
//
//  Created by Ben Garrison on 2/16/22.
//

import UIKit

class DialogLabel: UILabel {
    
    init(placeholder: String?) {
        super.init(frame: .zero)
        
        self.text = placeholder
        self.textAlignment = .center
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
        self.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        self.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        self.widthAnchor.constraint(lessThanOrEqualToConstant: 190).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
