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
    let dialogImageView = UIImageView()
    let yupuImageView = UIImageView()
   
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
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        
        dialogImageView.translatesAutoresizingMaskIntoConstraints = false
        dialogImageView.contentMode = .scaleAspectFit
        dialogImageView.image = UIImage(named: "Speech-Bubble")
        
        yupuImageView.translatesAutoresizingMaskIntoConstraints = false
        yupuImageView.contentMode = .scaleAspectFit
        yupuImageView.image = UIImage(named: imageName)
        
       
    }
    
    func layout() {
        view.addSubview(yupuImageView)
        view.addSubview(label)
        view.addSubview(dialogImageView)
        
        NSLayoutConstraint.activate([
            dialogImageView.bottomAnchor.constraint(equalTo: yupuImageView.topAnchor, constant: 8),
            dialogImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            
            label.bottomAnchor.constraint(equalTo: yupuImageView.topAnchor),
            label.trailingAnchor.constraint(equalTo: dialogImageView.trailingAnchor, constant: -2),

            yupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            yupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        label.widthAnchor.constraint(equalToConstant: 190).isActive = true
        label.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.bringSubviewToFront(label)
        
        dialogImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dialogImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        yupuImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        yupuImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    }
}

