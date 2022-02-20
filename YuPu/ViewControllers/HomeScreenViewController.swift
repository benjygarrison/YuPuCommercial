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
    let fourthHorizontalButtonStackview = UIStackView()
    let fifthHorizontalButtonStackview = UIStackView()
    let sixthHorizontalButtonStackview = UIStackView()
    
    let yupuButtonVerySoft = YupuButton(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButton(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonHard = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonHarder = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonVeryHard = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonExtra = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonExtra2 = YupuButton(image: UIImage(named: "Yupu-Soft"))
    
//    let testLabelOne = UILabel()
//    let testLabelTwo = UILabel()
//    let testLabelThree = UILabel()
    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension HomeScreenViewController {
    func style() {
        mainYupuButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        mainYupuButtonStackview.axis = .vertical
        mainYupuButtonStackview.spacing = 8
        mainYupuButtonStackview.distribution = .fillEqually
        
        firstHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        firstHorizontalButtonStackview.axis = .horizontal
        firstHorizontalButtonStackview.spacing = 8
        //firstHorizontalButtonStackview.distribution = .fillEqually
        
        secondHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        secondHorizontalButtonStackview.axis = .horizontal
        secondHorizontalButtonStackview.spacing = 8
        //secondHorizontalButtonStackview.distribution = .fillEqually
        
        thirdHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        thirdHorizontalButtonStackview.axis = .horizontal
        thirdHorizontalButtonStackview.spacing = 8
        //thirdHorizontalButtonStackview.distribution = .fillEqually
        
//        fourthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
//        fourthHorizontalButtonStackview.axis = .horizontal
//        fourthHorizontalButtonStackview.spacing = 8
//        //fourthHorizontalButtonStackview.distribution = .fillEqually
//
//        fifthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
//        fifthHorizontalButtonStackview.axis = .horizontal
//        fifthHorizontalButtonStackview.spacing = 8
//        //fifthHorizontalButtonStackview.distribution = .fillEqually
//
//        sixthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
//        sixthHorizontalButtonStackview.axis = .horizontal
//        sixthHorizontalButtonStackview.spacing = 8
//        //sixthHorizontalButtonStackview.distribution = .fillEqually
        
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
        
//        fourthHorizontalButtonStackview.addArrangedSubview(tl10)
//        fourthHorizontalButtonStackview.addArrangedSubview(tl11)
//        fourthHorizontalButtonStackview.addArrangedSubview(tl12)
//
//        fifthHorizontalButtonStackview.addArrangedSubview(tl13)
//        fifthHorizontalButtonStackview.addArrangedSubview(tl14)
//        fifthHorizontalButtonStackview.addArrangedSubview(tl15)
//
//        sixthHorizontalButtonStackview.addArrangedSubview(tl16)
//        sixthHorizontalButtonStackview.addArrangedSubview(tl17)
//        sixthHorizontalButtonStackview.addArrangedSubview(tl18)
        
        mainYupuButtonStackview.addArrangedSubview(firstHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(secondHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(thirdHorizontalButtonStackview)
//        mainYupuButtonStackview.addArrangedSubview(fourthHorizontalButtonStackview)
//        mainYupuButtonStackview.addArrangedSubview(fifthHorizontalButtonStackview)
//        mainYupuButtonStackview.addArrangedSubview(sixthHorizontalButtonStackview)
        
        view.addSubview(mainYupuButtonStackview)
        
        NSLayoutConstraint.activate([
            mainYupuButtonStackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainYupuButtonStackview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
//            mainYupuButtonStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//            mainYupuButtonStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        //mainYupuButtonStackview.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
}
