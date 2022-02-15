//
//  WelcomeViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/14/22.
//

import UIKit

import UIKit

class WelcomeViewController: UIViewController {
    
//    let stackView = UIStackView()
//    let imageView = UIImageView()
//    let label = UILabel()
      let yupuButton: UIButton = {
          let buttonImage = UIImage(named: "yupuHappy") as UIImage?
          
          let yupuButton = UIButton(type: .custom)
          yupuButton.setImage(buttonImage, for: .normal)
          //yupuButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
          return yupuButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    func style() {
        
        yupuButton.translatesAutoresizingMaskIntoConstraints = false
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 20
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "welcome"
//        label.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
//        stackView.addArrangedSubview(label)
        view.addSubview(yupuButton)
//        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yupuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            yupuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        
        yupuButton.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        yupuButton.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    }
}
