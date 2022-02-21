//
//  HomeScreenViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/9/22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
//MARK: UI variables
    //StackViews
    let mainYupuButtonStackview = UIStackView()
    
    let firstHorizontalButtonStackview = UIStackView()
    let secondHorizontalButtonStackview = UIStackView()
    let thirdHorizontalButtonStackview = UIStackView()
    
    let buttonStackView = UIStackView()

    //Shape imageviews
    let yupuButtonVerySoft = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButtonImageView(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    let yupuButtonHard = YupuButtonImageView(image: UIImage(named: "Yupu-Hard"))
    let yupuButtonHarder = YupuButtonImageView(image: UIImage(named: "Yupu-Harder"))
    let yupuButtonExtra = YupuEmptyButtonImageView()
    let yupuButtonVeryHard = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Hard"))
    let yupuButtonExtra2 = YupuEmptyButtonImageView()
    
    //Color views
    let yupuBlack = YupuColorView(color: .black)
    let yupuDarkBrown = YupuColorView(color: UIColor(red: 82/255, green: 50/255, blue: 47/255, alpha: 1.00))
    let yupuBrown = YupuColorView(color: UIColor(red: 135/255, green: 77/255, blue: 73/255, alpha: 1.00))
    let yupuLightBrown = YupuColorView(color: UIColor(red: 161/255, green: 99/255, blue: 95/255, alpha: 1.00))
    let yupuOrange = YupuColorView(color: UIColor(red: 161/255, green: 93/255, blue: 45/255, alpha: 1.00))
    let yupuYellow = YupuColorView(color: UIColor(red: 161/255, green: 122/255, blue: 45/255, alpha: 1.00))
    let yupuGreen = YupuColorView(color: UIColor(red: 130/255, green: 161/255, blue: 45/255, alpha: 1.00))
    let yupuGrey = YupuColorView(color: UIColor(red: 162/255, green: 171/255, blue: 137/255, alpha: 1.00))
    let yupuWhite = YupuColorView(color: UIColor(red: 218/255, green: 222/255, blue: 206/255, alpha: 1.00))
    
    //Labels
    let yupuResultLabel = YupuLabel(placeholder: "placeholder")
    let yupuConfirmLabel = YupuLabel(placeholder: "Confirm choice?")
    
    //Yes/No buttons
    let yesButton: UIButton = {
        let button = YesNoButton(placeholder: "Yes")
        button.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //TODO: Subclass these buttons!
    let noButton: UIButton = {
        let button = YesNoButton(placeholder: "No")
        button.addTarget(self, action: #selector(noButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //Haptic feedback variable
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        yupuButtonTapped()
        //yesButtonTapped()
        hapticFeedback.prepare()
    }
    
//MARK: Style/Layout
    func style() {
        
        //Main stackview
        mainYupuButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        mainYupuButtonStackview.axis = .vertical
        mainYupuButtonStackview.spacing = 8
        mainYupuButtonStackview.distribution = .fillEqually
        
        //Inner stackviews
        firstHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        firstHorizontalButtonStackview.axis = .horizontal
        firstHorizontalButtonStackview.spacing = 8
        firstHorizontalButtonStackview.distribution = .fillEqually
        
        secondHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        secondHorizontalButtonStackview.axis = .horizontal
        secondHorizontalButtonStackview.spacing = 8
        secondHorizontalButtonStackview.distribution = .fillEqually
        
        thirdHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        thirdHorizontalButtonStackview.axis = .horizontal
        thirdHorizontalButtonStackview.spacing = 8
        thirdHorizontalButtonStackview.distribution = .fillEqually
        
        //Button stackview
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        buttonStackView.distribution = .fillProportionally
        
        //ImageViews
        yupuButtonSoft.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonSofter.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonSoft.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonNormal.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonHard.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonHarder.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonVeryHard.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonExtra.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonExtra2.translatesAutoresizingMaskIntoConstraints = false
        
        //Views
        yupuBlack.translatesAutoresizingMaskIntoConstraints = false
        yupuDarkBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuLightBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuOrange.translatesAutoresizingMaskIntoConstraints = false
        yupuYellow.translatesAutoresizingMaskIntoConstraints = false
        yupuGreen.translatesAutoresizingMaskIntoConstraints = false
        yupuGrey.translatesAutoresizingMaskIntoConstraints = false
        yupuWhite.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Labels
        yupuResultLabel.translatesAutoresizingMaskIntoConstraints = false
        yupuResultLabel.isHidden = true
        yupuConfirmLabel.translatesAutoresizingMaskIntoConstraints = false
        yupuConfirmLabel.isHidden = true
        
        //Buttons
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.translatesAutoresizingMaskIntoConstraints = false
        yesButton.isHidden = true
        noButton.isHidden = true
    }
    
    func layout() {
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonVerySoft)
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonSofter)
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonSoft)
        
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonNormal)
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonHard)
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonHarder)

        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonExtra)
        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonVeryHard)
        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonExtra2)

        mainYupuButtonStackview.addArrangedSubview(firstHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(secondHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(thirdHorizontalButtonStackview)
        
        buttonStackView.addArrangedSubview(yesButton)
        buttonStackView.addArrangedSubview(noButton)

        view.addSubview(mainYupuButtonStackview)
        view.addSubview(yupuResultLabel)
        view.addSubview(yupuConfirmLabel)
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            mainYupuButtonStackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainYupuButtonStackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            yupuResultLabel.topAnchor.constraint(equalTo: mainYupuButtonStackview.bottomAnchor, constant: 8),
            yupuResultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            yupuResultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            yupuConfirmLabel.topAnchor.constraint(equalTo: yupuResultLabel.bottomAnchor, constant: 16),
            yupuConfirmLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            yupuConfirmLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: yupuConfirmLabel.bottomAnchor, constant: 8),
            buttonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
}

//MARK: Selectors
extension HomeScreenViewController {
    
//Button view selectors
    private func notHidden() {
        yesButton.isHidden = false
        noButton.isHidden = false
        yupuConfirmLabel.isHidden = false
        yupuResultLabel.isHidden = false
    }
    
    private func yupuButtonTapped() {
        let verySoftTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.verySoftButtonTapped))
            yupuButtonVerySoft.addGestureRecognizer(verySoftTapped)
            yupuButtonVerySoft.isUserInteractionEnabled = true
        let softerTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.softerButtonTapped))
            yupuButtonSofter.addGestureRecognizer(softerTapped)
            yupuButtonSofter.isUserInteractionEnabled = true
        let softTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.softButtonTapped))
            yupuButtonSoft.addGestureRecognizer(softTapped)
            yupuButtonSoft.isUserInteractionEnabled = true
        let regularTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.normalButtonTapped))
            yupuButtonNormal.addGestureRecognizer(regularTapped)
            yupuButtonNormal.isUserInteractionEnabled = true
        let hardTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.hardButtonTapped))
            yupuButtonHard.addGestureRecognizer(hardTapped)
            yupuButtonHard.isUserInteractionEnabled = true
        let harderTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.harderButtonTapped))
            yupuButtonHarder.addGestureRecognizer(harderTapped)
            yupuButtonHarder.isUserInteractionEnabled = true
        let veryHardTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.veryHardButtonTapped))
            yupuButtonVeryHard.addGestureRecognizer(veryHardTapped)
            yupuButtonVeryHard.isUserInteractionEnabled = true
    }
    
    private func animateShrinkButton(_ imageView: UIImageView, transform: CGAffineTransform) {
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            imageView.transform = transform
                }, completion: nil)
        }
    
    private func animateUnshrinkButton(_ imageView: UIImageView, transform: CGAffineTransform) {
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            imageView.transform = transform
                }, completion: nil)
        }
    

    @objc func verySoftButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonVerySoft, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonVerySoft, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Very Soft!"
            notHidden()
        }
    }
    
    @objc func softerButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonSofter, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonSofter, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Pretty Soft"
           notHidden()
        }
    }
    
    @objc func softButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonSoft, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonSoft, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "A Little Soft"
            notHidden()
        }
    }
    
    @objc func normalButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonNormal, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonNormal, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Just Right"
            notHidden()
        }
    }
    @objc func hardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonHard, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonHard, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "A Little Hard"
            notHidden()
        }
    }
    
    @objc func harderButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonHarder, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonHarder, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Pretty Hard"
            notHidden()
        }
    }
    
    @objc func veryHardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonVeryHard, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonVeryHard, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Very Hard!"
            notHidden()
        }
    }
    
//YES/NO button selectors
    
    @objc func yesButtonTapped() {
        view.backgroundColor = .red
    }
    
    @objc func noButtonTapped() {
        view.backgroundColor = .blue
    }

}




