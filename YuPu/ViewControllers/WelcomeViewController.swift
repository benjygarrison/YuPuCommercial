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
    let dialogLabel = UILabel()
    let dialogImageView = UIImageView()
    
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
    var yupuTrailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    var trailingEdgeOffScreenRight: CGFloat = 1000
    var bottomEdgeOffScreen: CGFloat = -1000
    var yupuBottomEdgeOnScreen: CGFloat = -40
    
    var firstYupuImageTrailingAnchor: NSLayoutConstraint?
    var secondYupuImageTrailingAnchor: NSLayoutConstraint?
    var thirdYupuImageBottomAnchor: NSLayoutConstraint?
    
    var dialogImageViewTrailingAnchor: NSLayoutConstraint?
    var dialogLabelTrailingAnchor: NSLayoutConstraint?
    var dialogImageViewBottomAnchor: NSLayoutConstraint?
    var dialogLabelBottomAnchor: NSLayoutConstraint?

    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateYupuSlideIn()
        animateDialogAppear()
        animationFirstShake()
        //animateDissolve()
        animateYupuAppear()
        animationSecondShake()
        animateSlideOutLeft()
        animateDropIn()
        animateYupuSlideOutRight()
        //animateChangeSize()
    }

    func style() {
        dialogLabel.translatesAutoresizingMaskIntoConstraints = false
        dialogLabel.textAlignment = .center
        dialogLabel.adjustsFontForContentSizeCategory = true
        dialogLabel.numberOfLines = 0
        dialogLabel.text = "Test dialog!"
        dialogLabel.font = UIFont(name: "ChalkboardSE-Bold", size: 20)
        dialogLabel.alpha = 0
        
        dialogImageView.translatesAutoresizingMaskIntoConstraints = false
        dialogImageView.contentMode = .scaleAspectFit
        dialogImageView.image = UIImage(named: "Speech-Bubble")
        dialogImageView.alpha = 0
        
        firstYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        secondYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        secondYupuImageView.alpha = 0
    }
    
    func layout() {
        view.addSubview(dialogImageView)
        view.addSubview(dialogLabel)
        view.addSubview(firstYupuImageView)
        view.addSubview(secondYupuImageView)
        view.addSubview(thirdYupuImageView)
        
        NSLayoutConstraint.activate([
            dialogImageView.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: 8),
            dialogImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            
            dialogLabel.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor),
            dialogLabel.trailingAnchor.constraint(equalTo: dialogImageView.trailingAnchor, constant: -2),
        ])
        
        dialogLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true
        dialogLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.bringSubviewToFront(dialogLabel)
        
        dialogImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dialogImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        NSLayoutConstraint.activate([
            firstYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        firstYupuImageTrailingAnchor = firstYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingEdgeOffScreen)
        firstYupuImageTrailingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            secondYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
        
        secondYupuImageTrailingAnchor = secondYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: yupuTrailingEdgeOnScreen)
        secondYupuImageTrailingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            //thirdYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
//            thirdYupuImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -40)
            thirdYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        
//        thirdYupuImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 1).isActive = true
//        thirdYupuImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 2).isActive = true
        
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
    
//First Yupu/dialog box animations
    
    //Yupu first arrival
    private func animateYupuSlideIn() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageTrailingAnchor?.constant = self.yupuTrailingEdgeOnScreen
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
    }
    
    //Dialog box first appearance
    private func animateDialogAppear() {
        let animationDuration = 0.6
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.dialogLabel.alpha = 1
            self.dialogImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 2.1)
    }
    private func animateYupuSlideOutRight() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreenRight
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 3.5)
        
    }
    
    private func animateDissolve() {
        let animationDuration = 2.0
        
        let animatorTwo = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageView.alpha = 0
            self.view.layoutIfNeeded()
            }
        animatorTwo.startAnimation(afterDelay: 3.0)
    }
    
    private func animateYupuAppear() {
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
            self.thirdYupuImageBottomAnchor?.constant = self.yupuBottomEdgeOnScreen
            
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
