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
    
    let firstYupuImageView: UIImageView = {
        let yupuImageView = YupuImageView(image: UIImage(named: "yupuHappy"))

        return yupuImageView
    }()
    
    let secondYupuImageView: UIImageView = {
        let yupuImageView = YupuImageView(image: UIImage(named: "yupuSmile"))

        return yupuImageView
    }()
    
    let thirdYupuImageView: UIImageView = {
        let yupuImageView = YupuImageView(image: UIImage(named: "yupuHappy"))

        return yupuImageView
    }()
    
//MARK: Animations
    var trailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    var trailingEdgeOffScreenRight: CGFloat = 1000
    var bottomEdgeOffScreen: CGFloat = -1000
    var bottomEdgeOnScreen: CGFloat = -40
    
    var firstYupuImageTrailingAnchor: NSLayoutConstraint?
    var secondYupuImageTrailingAnchor: NSLayoutConstraint?
    var thirdYupuImageBottomAnchor: NSLayoutConstraint?

    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateSlideIn()
        animationFirstShake()
        //animateDissolve()
        animateAppear()
        animationSecondShake()
        animateSlideOutLeft()
        animateDropIn()
        animateSlideOutRight()
        animateChangeSize()
    }

    func style() {
        firstYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        secondYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        secondYupuImageView.alpha = 0
    }
    
    func layout() {
        view.addSubview(firstYupuImageView)
        view.addSubview(secondYupuImageView)
        view.addSubview(thirdYupuImageView)
        
        NSLayoutConstraint.activate([
            firstYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        firstYupuImageTrailingAnchor = firstYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingEdgeOffScreen)
        firstYupuImageTrailingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            secondYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        secondYupuImageTrailingAnchor = secondYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingEdgeOnScreen)
        secondYupuImageTrailingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            thirdYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        
        thirdYupuImageBottomAnchor = thirdYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomEdgeOffScreen)
        thirdYupuImageBottomAnchor?.isActive = true
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
    
    private func animateSlideIn() {
        let animationDuration = 1.9
        
        let animatorOne = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageTrailingAnchor?.constant = self.trailingEdgeOnScreen
            
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
    
    private func animateAppear() {
        let animationDuration = 3.0
        
        let animatorThree = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animatorThree.startAnimation(afterDelay: 4.7)
    }
    
    private func animateSlideOutLeft() {
        let animationDuration = 1.9
        
        let animatorFour = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreen
            
            self.view.layoutIfNeeded()
        }
        animatorFour.startAnimation(afterDelay: 8.0)
        
    }
    
    private func animateSlideOutRight() {
        let animationDuration = 1.9
        
        let animatorSix = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreenRight
            
            self.view.layoutIfNeeded()
        }
        animatorSix.startAnimation(afterDelay: 3.5)
        
    }
    
    private func animationFirstShake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.5
        animation.isAdditive = true
        animation.beginTime = CACurrentMediaTime() + 1.8
        
        firstYupuImageView.layer.add(animation, forKey: "shake")
    }
    
    private func animationSecondShake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        animation.beginTime = CACurrentMediaTime() + 7.6
        
        secondYupuImageView.layer.add(animation, forKey: "shake")
    }
    
    private func animateDropIn() {
        let animationDuration = 1.9
        
        let animatorFive = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.thirdYupuImageBottomAnchor?.constant = self.bottomEdgeOnScreen
            
            self.view.layoutIfNeeded()
        }
        animatorFive.startAnimation(afterDelay: 9.5)
    }
    private func animateChangeSize() {
        UIView.animate(withDuration: 5.0, delay: 12.0, animations: {
            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       })
    }
    
    //MARK: add squash animation
//    private func animateChangeSize() {
//        UIView.animate(withDuration: 2.0, delay: 12.0, options: [.repeat, .autoreverse], animations: {
//            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 1, y: 0.5)
//       })
//    }
//
}
