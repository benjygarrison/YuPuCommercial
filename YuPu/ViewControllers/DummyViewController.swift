//
//  DummyViewController.swift
//  YuPu
//
//  Created by Ben Garrison on 2/20/22.
//

import UIKit

class DummyViewController: UIViewController {
    
    let scrollview = UIScrollView()
    let stackView = UIStackView()
    
    let yupuButtonVerySoft = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Soft"))
    let yupuButtonSofter = YupuButtonImageView(image: UIImage(named: "Yupu-Softer"))
    let yupuButtonSoft = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonNormal = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    let yupuButtonHard = YupuButtonImageView(image: UIImage(named: "Yupu-Hard"))
    let yupuButtonHarder = YupuButtonImageView(image: UIImage(named: "Yupu-Harder"))
    let yupuButtonVeryHard = YupuButtonImageView(image: UIImage(named: "Yupu-Very-Hard"))
    let yupuButtonExtra = YupuButtonImageView(image: UIImage(named: "Yupu-Soft"))
    let yupuButtonExtra2 = YupuButtonImageView(image: UIImage(named: "Yupu-Regular"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 8
        
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
        view.addSubview(scrollview)
        scrollview.addSubview(stackView)
        stackView.addArrangedSubview(yupuButtonVerySoft)
        stackView.addArrangedSubview(yupuButtonSofter)
        stackView.addArrangedSubview(yupuButtonSoft)
        stackView.addArrangedSubview(yupuButtonNormal)
        stackView.addArrangedSubview(yupuButtonHard)
        stackView.addArrangedSubview(yupuButtonHarder)
        stackView.addArrangedSubview(yupuButtonVeryHard)


        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            scrollview.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollview.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollview.leftAnchor)
          ])
    
        
    }
}
