//
//  Buttons.swift
//  YuPu
//
//  Created by Ben Garrison on 2/21/22.
//

import UIKit

class YesNoButton: UIButton {
    
    init(placeholder: String?) {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        self.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        self.setTitleColor(UIColor.black, for: .normal)
        self.setTitle(placeholder, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 4).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
