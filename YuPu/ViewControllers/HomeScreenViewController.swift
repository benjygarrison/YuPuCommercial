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

    let yupuButtonVerySoft = YupuButton(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButton(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButton(image: UIImage(named: "Yupu-Regular"))
    let yupuButtonHard = YupuButton(image: UIImage(named: "Yupu-Hard"))
    let yupuButtonHarder = YupuButton(image: UIImage(named: "Yupu-Harder"))
    let yupuButtonVeryHard = YupuButton(image: UIImage(named: "Yupu-Very-Hard"))
    let yupuButtonExtra = YupuButton(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonExtra2 = YupuButton(image: UIImage(named: "Yupu-Regular"))

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
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
            //mainYupuButtonStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            //mainYupuButtonStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        //mainYupuButtonStackview.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}
