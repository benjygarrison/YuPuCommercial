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
    
    //MARK: Animations
    var trailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    
    var yupuImageTrailingAnchor: NSLayoutConstraint?
    
//    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
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
        view.addSubview(yupuImageView)

//      view.addSubview(stackView)
//      stackView.addArrangedSubview(label)

//      NSLayoutConstraint.activate([
//          stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//      ])
        
        NSLayoutConstraint.activate([
            yupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            //yupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])

        yupuImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        yupuImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        
        yupuImageTrailingAnchor = yupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingEdgeOffScreen)
        yupuImageTrailingAnchor?.isActive = true
        
    }
}

extension WelcomeViewController {
    
    //MARK: Functions
    
    private func imageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.yupuImageViewTapped))
        yupuImageView.addGestureRecognizer(tapped)
        yupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func yupuImageViewTapped(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            yupuImageView.image = UIImage(named: "yupuSmile")
            animateDissolve()
            print("yupu image tapped")
        }
    }
    
}

//MARK: Animation functions
extension WelcomeViewController {
    
    private func animate() {
        let animationDuration = 1.9
        
        let animatorOne = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.yupuImageTrailingAnchor?.constant = self.trailingEdgeOnScreen
            
            self.view.layoutIfNeeded()
        }
        animatorOne.startAnimation()
    }
    
    private func animateDissolve() {
        let animationDuration = 1.5
        
        let animatorTwo = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.yupuImageView.alpha = 0
            self.view.layoutIfNeeded()
            }
        animatorTwo.startAnimation(afterDelay: 0.1)
    }
}
