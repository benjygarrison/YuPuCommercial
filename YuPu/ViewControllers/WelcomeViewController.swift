//
//  WelcomeViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/14/22.
//

import UIKit

import UIKit

class WelcomeViewController: UIViewController {
    
//MARK: Variables
//    let label = UILabel()
//    let stackView = UIStackView()
    
    let firstYupuImageView: UIImageView = {
        let yupuImageView = YupuImageView(image: UIImage(named: "yupuHappy"))

        return yupuImageView
    }()
    
    let secondYupuImageView: UIImageView = {
        let yupuImageView = YupuImageView(image: UIImage(named: "yupuSmile"))

        return yupuImageView
    }()
    
    
//MARK: Animations
    var trailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    
    var yupuImageTrailingAnchor: NSLayoutConstraint?

    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
        animateDissolve()
    }

    func style() {
        firstYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        secondYupuImageView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 20
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "welcome"
//        label.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
        view.addSubview(firstYupuImageView)
        view.addSubview(secondYupuImageView)

//      view.addSubview(stackView)
//      stackView.addArrangedSubview(label)

//      NSLayoutConstraint.activate([
//          stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//      ])
        
        NSLayoutConstraint.activate([
            firstYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        yupuImageTrailingAnchor = firstYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingEdgeOffScreen)
        yupuImageTrailingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            secondYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            secondYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        
        
        
        
    }
}

extension WelcomeViewController {
    
    //MARK: Functions
    
    private func imageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.yupuImageViewTapped))
        firstYupuImageView.addGestureRecognizer(tapped)
        firstYupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func yupuImageViewTapped(sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            firstYupuImageView.image = UIImage(named: "yupuSmile")
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
        let animationDuration = 2.0
        
        let animatorTwo = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageView.alpha = 0
            self.view.layoutIfNeeded()
            }
        animatorTwo.startAnimation(afterDelay: 3.0)
    }
}
