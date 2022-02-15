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
    
    let yupuImageView: UIImageView = {
        let yupuImageView = UIImageView()
      
        yupuImageView.image = UIImage(named: "yupuHappy")

        return yupuImageView
    }()
    
    
//    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }

    func style() {
        yupuImageView.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(yupuImageView)
//        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            yupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            yupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])

        yupuImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        yupuImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    }
}

extension WelcomeViewController {
    
    //MARK: Functions
    
    private func imageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.yupuImageViewTapped))
        yupuImageView.addGestureRecognizer(tapped)
        yupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func yupuButtonTapped() {
        print("yupu tapped!")
    }
    
    @objc func yupuImageViewTapped(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            yupuImageView.image = UIImage(named: "yupuSmile")
            print("yupu image tapped")
        }
    }
    
}
