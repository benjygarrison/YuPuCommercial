//
//  OnboardingViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/12/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
   
    let imageName: String
    let labelText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(imageName: String, labelText: String) {
        self.imageName = imageName
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(imageName, labelText) has not been implemented")
    }
    
    
}

extension OnboardingViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        
       
    }
    
    func layout() {
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            label.trailingAnchor.constraint(equalTo: imageView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

        ])
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

