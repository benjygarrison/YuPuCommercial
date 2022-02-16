//
//  WelcomeViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/14/22.
//

import UIKit

import UIKit

class WelcomeViewController: UIViewController {
    
//MARK: UI Variables
    let dialogLabel: UILabel = {
        let dialogLabel = DialogLabel(placeholder: "Click me!")
        return dialogLabel
    }()
    
    let dialogImageView: UIImageView = {
        let dialogImageView = DialogImageView()
        return dialogImageView
    }()
    
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
    
//MARK: Animation Variables
    var yupuTrailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    var trailingEdgeOffScreenRight: CGFloat = 1000
    var bottomEdgeOffScreen: CGFloat = -1000
    var yupuBottomEdgeOnScreen: CGFloat = -40
    
    var dialogImageViewTrailingEdgeOnScreen: CGFloat = -180
    var dialogLabelTrailingEdgeOnScreen: CGFloat = -2
    
    var firstYupuImageTrailingAnchor: NSLayoutConstraint?
    var secondYupuImageTrailingAnchor: NSLayoutConstraint?
    var thirdYupuImageBottomAnchor: NSLayoutConstraint?
    
    var dialogImageViewTrailingAnchor: NSLayoutConstraint?
    var dialogLabelTrailingAnchor: NSLayoutConstraint?
    var dialogImageViewBottomAnchor: NSLayoutConstraint?
    var dialogLabelBottomAnchor: NSLayoutConstraint?

    
//MARK: ViewDidLoad/ViewDidAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        imageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateYupuSlideIn()
        animateFirstDialogAppearance()
        animationFirstShake()
//      animateDialogDissolve()
        
//      animateYupuDissolve()
//      animateYupuAppear()
//      animationSecondShake()
//      animateSlideOutLeft()
//      animateDropIn()
//      animateYupuSlideOutRight()
//      animateChangeSize()
    }

//MARK: Style/Layout
    func style() {
        dialogLabel.translatesAutoresizingMaskIntoConstraints = false
        dialogLabel.alpha = 0
        
        dialogImageView.translatesAutoresizingMaskIntoConstraints = false
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
        
        
        //Dialog box layout
        NSLayoutConstraint.activate([
            dialogImageView.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: 8),
            dialogLabel.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: -4),
        ])
        
        dialogImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dialogImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        dialogImageViewTrailingAnchor = dialogImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: dialogImageViewTrailingEdgeOnScreen)
        dialogImageViewTrailingAnchor?.isActive = true
        
        dialogLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true
        dialogLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.bringSubviewToFront(dialogLabel)
        
        dialogLabelTrailingAnchor = dialogLabel.trailingAnchor.constraint(equalTo: dialogImageView.trailingAnchor, constant: dialogLabelTrailingEdgeOnScreen)
        dialogLabelTrailingAnchor?.isActive = true
        
        //Yupu layout
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
            thirdYupuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
        ])
        
        thirdYupuImageBottomAnchor = thirdYupuImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomEdgeOffScreen)
        thirdYupuImageBottomAnchor?.isActive = true
    }
}

//MARK: Interaction Functions
extension WelcomeViewController {
    private func imageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.yupuImageViewTapped))
        firstYupuImageView.addGestureRecognizer(tapped)
        firstYupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func yupuImageViewTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            animateYupuSlideOutRight()
            animateDialogDissolve()
            animateYupuAppear()
            print("yupu image tapped")
        }
    }
    
}

//MARK: Animation functions
extension WelcomeViewController {

    //MARK: Animations for arrival to first Yupu imageView tap
    
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
    private func animateFirstDialogAppearance() {
        let animationDuration = 0.6
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.dialogLabel.alpha = 1
            self.dialogImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 2.1)
    }
    
    //Yupu first shake, before exit
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
    
    //Yupu first exit
    private func animateYupuSlideOutRight() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreenRight
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 0.1)
        
    }
    //Dialog first fade out
    private func animateDialogDissolve() {
        let animationDuration = 1.9

        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.dialogImageView.alpha = 0
            self.dialogLabel.alpha = 0
            self.view.layoutIfNeeded()
            }
        animator.startAnimation()
    }
    
    //Yupu second appearance
    private func animateYupuAppear() {
        let animationDuration = 3.0
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 2.1)
    }
    
    
//    TODO: update functions (adjust delay times from 200.0)
    
    private func animateSlideOutLeft() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreen
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 200.0)
        
    }

    private func animationSecondShake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        animation.beginTime = CACurrentMediaTime() + 200.0
        
        secondYupuImageView.layer.add(animation, forKey: "shake")
    }
    
    private func animateDropIn() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.thirdYupuImageBottomAnchor?.constant = self.yupuBottomEdgeOnScreen
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 200.0)
    }
    private func animateChangeSize() {
        UIView.animate(withDuration: 5.0, delay: 200.0, animations: {
            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       })
    }
    
    private func animateYupuDissolve() {
        let animationDuration = 2.0
        
        let animatorTwo = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.thirdYupuImageView.alpha = 0
            self.view.layoutIfNeeded()
            }
        animatorTwo.startAnimation(afterDelay: 200)
    }
    
    //MARK: add squash animation
//    private func animateChangeSize() {
//        UIView.animate(withDuration: 2.0, delay: 12.0, options: [.repeat, .autoreverse], animations: {
//            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 1, y: 0.5)
//       })
//    }
//
}
