//
//  HomeScreenViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/9/22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
//MARK: UI variables
    let mainYupuButtonStackview = UIStackView()
    let firstHorizontalButtonStackview = UIStackView()
    let secondHorizontalButtonStackview = UIStackView()
    let thirdHorizontalButtonStackview = UIStackView()

    //Shape buttons
    let yupuButtonVerySoft = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButtonImageView(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    let yupuButtonHard = YupuButtonImageView(image: UIImage(named: "Yupu-Hard"))
    let yupuButtonHarder = YupuButtonImageView(image: UIImage(named: "Yupu-Harder"))
    let yupuButtonExtra = YupuEmptyButtonImageView()
    let yupuButtonVeryHard = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Hard"))
    let yupuButtonExtra2 = YupuEmptyButtonImageView()
    
    //Color buttons
    let yupuBlack = YupuColorView(color: .black)
    let yupuDarkBrown = YupuColorView(color: UIColor(red: 82.00, green: 50.00, blue: 47.00, alpha: 1.00))
    let yupuBrown = YupuColorView(color: UIColor(red: 135.00, green: 77.00, blue: 73.00, alpha: 1.00))
    let yupuLightBrown = YupuColorView(color: UIColor(red: 161.00, green: 99.00, blue: 95.00, alpha: 1.00))
    let yupuOrange = YupuColorView(color: UIColor(red: 161.00, green: 93.00, blue: 45.00, alpha: 1.00))
    let yupuYellow = YupuColorView(color: UIColor(red: 161.00, green: 122.00, blue: 45.00, alpha: 1.00))
    let yupuGreen = YupuColorView(color: UIColor(red: 130.00, green: 161.00, blue: 45.00, alpha: 1.00))
    let yupuGrey = YupuColorView(color: UIColor(red: 162.00, green: 171.00, blue: 137.00, alpha: 1.00))
    let yupuWhite = YupuColorView(color: UIColor(red: 218.00, green: 222.00, blue: 206.00, alpha: 1.00))
    
    //Label
    let yupuResultLabel = YupuResultLabel(placeholder: "")
    
    //Yes/No button
    //TODO: subclass this button
    
    //Haptic feedback variable
    private let hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        yupuButtonTapped()
        hapticFeedback.prepare()
    }
    
//MARK: Style/Layout
    func style() {
        
        //main stackview
        mainYupuButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        mainYupuButtonStackview.axis = .vertical
        mainYupuButtonStackview.spacing = 8
        mainYupuButtonStackview.distribution = .fillEqually
        
        //inner stackviews
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
        
        //buttons
        yupuButtonSoft.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonSofter.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonSoft.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonNormal.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonHard.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonHarder.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonVeryHard.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonExtra.translatesAutoresizingMaskIntoConstraints = false
        yupuButtonExtra2.translatesAutoresizingMaskIntoConstraints = false
        
        yupuBlack.translatesAutoresizingMaskIntoConstraints = false
        yupuDarkBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuLightBrown.translatesAutoresizingMaskIntoConstraints = false
        yupuOrange.translatesAutoresizingMaskIntoConstraints = false
        yupuYellow.translatesAutoresizingMaskIntoConstraints = false
        yupuGreen.translatesAutoresizingMaskIntoConstraints = false
        yupuGrey.translatesAutoresizingMaskIntoConstraints = false
        yupuWhite.translatesAutoresizingMaskIntoConstraints = false
        
        
        //label
        yupuResultLabel.translatesAutoresizingMaskIntoConstraints = false

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

        view.addSubview(mainYupuButtonStackview)
        view.addSubview(yupuResultLabel)
        
        NSLayoutConstraint.activate([
            mainYupuButtonStackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainYupuButtonStackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            yupuResultLabel.topAnchor.constraint(equalTo: mainYupuButtonStackview.bottomAnchor, constant: 8),
            yupuResultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            yupuResultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
        ])
        
    }
}

//MARK: Selectors
extension HomeScreenViewController {
    
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
        }
    }
    
    @objc func softerButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonSofter, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonSofter, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Pretty Soft"
        }
    }
    
    @objc func softButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonSoft, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonSoft, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "A Little Soft"
        }
    }
    
    @objc func normalButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonNormal, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonNormal, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Just Right"
        }
    }
    @objc func hardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonHard, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonHard, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "A Little Hard"
        }
    }
    
    @objc func harderButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonHarder, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonHarder, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Pretty Hard"
        }
    }
    
    @objc func veryHardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            hapticFeedback.impactOccurred()
            animateShrinkButton(yupuButtonVeryHard, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
            animateUnshrinkButton(yupuButtonVeryHard, transform: CGAffineTransform.identity.scaledBy(x: 1, y: 1))
            yupuResultLabel.text = "Very Hard!"
        }
    }

}




