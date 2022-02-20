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

    let yupuButtonVerySoft = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButtonImageView(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    let yupuButtonHard = YupuButtonImageView(image: UIImage(named: "Yupu-Hard"))
    let yupuButtonHarder = YupuButtonImageView(image: UIImage(named: "Yupu-Harder"))
    let yupuButtonVeryHard = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Hard"))
    let yupuButtonExtra = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonExtra2 = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    
    let tappedBorderColor = UIColor.systemRed.cgColor
    let untappedBorderColer = UIColor.black.cgColor

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        yupuButtonTapped()
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

    }
    
    func layout() {
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonVerySoft)
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonSofter)
        firstHorizontalButtonStackview.addArrangedSubview(yupuButtonSoft)
        
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonNormal)
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonHard)
        secondHorizontalButtonStackview.addArrangedSubview(yupuButtonHarder)

        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonVeryHard)
        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonExtra)
        thirdHorizontalButtonStackview.addArrangedSubview(yupuButtonExtra2)

        mainYupuButtonStackview.addArrangedSubview(firstHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(secondHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(thirdHorizontalButtonStackview)

        view.addSubview(mainYupuButtonStackview)
        
        NSLayoutConstraint.activate([
            mainYupuButtonStackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainYupuButtonStackview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
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
        let extraTapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.extraButtonTapped))
            yupuButtonExtra.addGestureRecognizer(extraTapped)
            yupuButtonExtra.isUserInteractionEnabled = true
        let extra2Tapped = UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.extra2ButtonTapped))
            yupuButtonExtra2.addGestureRecognizer(extra2Tapped)
            yupuButtonExtra2.isUserInteractionEnabled = true
    }
                                                    
    @objc func anyButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
        print("any button tapped")
        }
    }

    @objc func verySoftButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            yupuButtonVerySoft.layer.borderColor = tappedBorderColor
            print("very soft tapped!")
        }
    }
    
    @objc func softerButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            yupuButtonSofter.layer.borderColor = tappedBorderColor
            print("softer tapped!")
        }
    }
    
    @objc func softButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("soft tapped!")
        }
    }
    
    @objc func normalButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("normal tapped!")
        }
    }
    @objc func hardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("hard tapped!")
        }
    }
    
    @objc func harderButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("harder tapped!")
        }
    }
    
    @objc func veryHardButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("very hard tapped!")
        }
    }
    
    @objc func extraButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("extra tapped!")
        }
    }
    
    @objc func extra2ButtonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("extra 2 tapped!")
        }
    }
    
}



