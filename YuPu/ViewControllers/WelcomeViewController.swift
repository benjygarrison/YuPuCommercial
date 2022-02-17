//
//  WelcomeViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/14/22.
//

import UIKit

//MARK: Protocol to register hasOnboarded state
protocol WelcomeViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class WelcomeViewController: UIViewController {
    
    //delegate for hasOnboarded:
    weak var delegate: WelcomeViewControllerDelegate?
    
//MARK: UI Variables
    let firstDialogLabel = DialogLabel(placeholder: "Click YuPu and see what happens!")
    let secondDialogLabel = DialogLabel(placeholder: "Great job! Click me again!")
    let thirdDialogLabel = DialogLabel(placeholder: "You got it! One more time!!")
    
    let firstDialogImageView = DialogImageView()
    let secondDialogImageView = DialogImageView()
    let thirdDialogImageView = DialogImageView()
    
    let firstYupuImageView = YupuImageView(image: UIImage(named: "yupuHappy"))
    let secondYupuImageView = YupuImageView(image: UIImage(named: "yupuSmile"))
    let thirdYupuImageView = YupuImageView(image: UIImage(named: "yupuHappy"))
    
//MARK: Animation Variables
    var yupuTrailingEdgeOnScreen: CGFloat = -4
    var trailingEdgeOffScreen: CGFloat = -1000
    var trailingEdgeOffScreenRight: CGFloat = 1000
    var bottomEdgeOffScreen: CGFloat = -1000
    var yupuBottomEdgeOnScreen: CGFloat = -40
    
    var firstYupuImageTrailingAnchor: NSLayoutConstraint?
    var secondYupuImageTrailingAnchor: NSLayoutConstraint?
    var thirdYupuImageBottomAnchor: NSLayoutConstraint?
    
//MARK: ViewDidLoad/ViewDidAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        firstImageViewTapped()
        secondImageViewTapped()
        thirdImageViewTapped()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateYupuSlideIn()
        animateFirstDialogAppearance()
        animationFirstShake()
    }

//MARK: Style/Layout
    func style() {
        firstDialogLabel.translatesAutoresizingMaskIntoConstraints = false
        firstDialogLabel.alpha = 0
        secondDialogLabel.translatesAutoresizingMaskIntoConstraints = false
        secondDialogLabel.alpha = 0
        thirdDialogLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdDialogLabel.alpha = 0
        
        firstDialogImageView.translatesAutoresizingMaskIntoConstraints = false
        firstDialogImageView.alpha = 0
        secondDialogImageView.translatesAutoresizingMaskIntoConstraints = false
        secondDialogImageView.alpha = 0
        thirdDialogImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdDialogImageView.alpha = 0
        
        firstYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        secondYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdYupuImageView.translatesAutoresizingMaskIntoConstraints = false
        secondYupuImageView.alpha = 0
    }
    
    func layout() {
        view.addSubview(firstDialogImageView)
        view.addSubview(secondDialogImageView)
        view.addSubview(thirdDialogImageView)
        view.addSubview(firstDialogLabel)
        view.addSubview(secondDialogLabel)
        view.addSubview(thirdDialogLabel)
        view.addSubview(firstYupuImageView)
        view.addSubview(secondYupuImageView)
        view.addSubview(thirdYupuImageView)
        
        
        //Dialog box layout
        NSLayoutConstraint.activate([
            firstDialogImageView.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: 8),
            firstDialogImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            firstDialogLabel.topAnchor.constraint(equalTo: firstDialogImageView.topAnchor, constant: 40),
            firstDialogLabel.centerXAnchor.constraint(equalTo: firstDialogImageView.trailingAnchor, constant: -100),
            
            secondDialogImageView.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: 8),
            secondDialogImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            secondDialogLabel.topAnchor.constraint(equalTo: firstDialogImageView.topAnchor, constant: 40),
            secondDialogLabel.centerXAnchor.constraint(equalTo: firstDialogImageView.trailingAnchor, constant: -100),
            
            thirdDialogImageView.bottomAnchor.constraint(equalTo: firstYupuImageView.topAnchor, constant: 8),
            thirdDialogImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            thirdDialogLabel.topAnchor.constraint(equalTo: firstDialogImageView.topAnchor, constant: 40),
            thirdDialogLabel.centerXAnchor.constraint(equalTo: firstDialogImageView.trailingAnchor, constant: -100),
        ])
        
        view.bringSubviewToFront(firstDialogLabel)
        view.bringSubviewToFront(secondDialogLabel)
        view.bringSubviewToFront(thirdDialogLabel)
        
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

//MARK: Selectors
extension WelcomeViewController {
    //First yupu image view tapped
    private func firstImageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.firstYupuImageViewTapped))
        firstYupuImageView.addGestureRecognizer(tapped)
        firstYupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func firstYupuImageViewTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            animateYupuSlideOutRight()
            animateFirstDialogDissolve()
            animateYupuAppear()
            print("first yupu image tapped")
        }
    }
    
    //Second yupu image view tapped
    private func secondImageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.secondYupuImageViewTapped))
        secondYupuImageView.addGestureRecognizer(tapped)
        secondYupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func secondYupuImageViewTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            animationSecondShake()
            animateSlideOutLeft()
            animateSecondDialogDissolve()
            animateDropIn()
            animateThirdDialogAppearance()
            print("second yupu image tapped")
        }
    }
    //Third yupu image view tapped
    private func thirdImageViewTapped() {
        let tapped = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.thirdYupuImageViewTapped))
        thirdYupuImageView.addGestureRecognizer(tapped)
        thirdYupuImageView.isUserInteractionEnabled = true
    }
    
    @objc func thirdYupuImageViewTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            delegate?.didFinishOnboarding()
            print("third yupu image tapped")
        }
    }
}

//MARK: Animation functions
extension WelcomeViewController {

//MARK: Animations from viewDidAppear to first Yupu imageView tap
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
            self.firstDialogLabel.alpha = 1
            self.firstDialogImageView.alpha = 1
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
    private func animateFirstDialogDissolve() {
        let animationDuration = 1.9

        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.firstDialogImageView.alpha = 0
            self.firstDialogLabel.alpha = 0
            self.view.layoutIfNeeded()
            }
        animator.startAnimation()
    }
    
    //Yupu second appearance
    private func animateYupuAppear() {
        let animationDuration = 3.0
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageView.alpha = 1
            self.secondDialogImageView.alpha = 1
            self.secondDialogLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 2.1)
    }
    
    
//MARK: Animations for second yupu image view tap
    //Second YuPu shake
    private func animationSecondShake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        animation.beginTime = CACurrentMediaTime()
        
        secondYupuImageView.layer.add(animation, forKey: "shake")
    }
    
    //Second YuPu slide out
    private func animateSlideOutLeft() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondYupuImageTrailingAnchor?.constant = self.trailingEdgeOffScreen
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 0.4)
        
    }
    //Second dialog disappear
    private func animateSecondDialogDissolve() {
        let animationDuration = 1.9

        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.secondDialogImageView.alpha = 0
            self.secondDialogLabel.alpha = 0
            self.view.layoutIfNeeded()
            }
        animator.startAnimation(afterDelay: 0.4)
    }
    //Third YuPu image view drop in from top
    private func animateDropIn() {
        let animationDuration = 1.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.thirdYupuImageBottomAnchor?.constant = self.yupuBottomEdgeOnScreen
            
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 2.0)
    }
    
    //Third dialog appearance
    private func animateThirdDialogAppearance() {
        let animationDuration = 0.9
        
        let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
            self.thirdDialogLabel.alpha = 1
            self.thirdDialogImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator.startAnimation(afterDelay: 3.7)
    }
    
    //TODO: third YuPu image view tapped animations
//    private func animateChangeSize() {
//        UIView.animate(withDuration: 5.0, delay: 200.0, animations: {
//            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//       })
//    }
//
//    private func animateYupuDissolve() {
//        let animationDuration = 2.0
//
//        let animatorTwo = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut) {
//            self.thirdYupuImageView.alpha = 0
//            self.view.layoutIfNeeded()
//            }
//        animatorTwo.startAnimation(afterDelay: 200)
//    }
//
    //MARK: add squash animation
//    private func animateChangeSize() {
//        UIView.animate(withDuration: 2.0, delay: 12.0, options: [.repeat, .autoreverse], animations: {
//            self.thirdYupuImageView.transform = CGAffineTransform(scaleX: 1, y: 0.5)
//       })
//    }
//
}
