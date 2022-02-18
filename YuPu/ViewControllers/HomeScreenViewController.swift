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
    
    let testLabelOne = UILabel()
    let testLabelTwo = UILabel()
    let testLabelThree = UILabel()
    let tl4 = UILabel()
    let tl5 = UILabel()
    let tl6 = UILabel()
    let tl7 = UILabel()
    let tl8 = UILabel()
    let tl9 = UILabel()
    let tl10 = UILabel()
    let tl11 = UILabel()
    let tl12 = UILabel()
    let tl13 = UILabel()
    let tl14 = UILabel()
    let tl15 = UILabel()
    let tl16 = UILabel()
    let tl17 = UILabel()
    let tl18 = UILabel()
    
    
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
        
        firstHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        firstHorizontalButtonStackview.axis = .horizontal
        firstHorizontalButtonStackview.spacing = 8
        
        secondHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        secondHorizontalButtonStackview.axis = .horizontal
        secondHorizontalButtonStackview.spacing = 8
        
        thirdHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        thirdHorizontalButtonStackview.axis = .horizontal
        thirdHorizontalButtonStackview.spacing = 8
        
        fourthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        fourthHorizontalButtonStackview.axis = .horizontal
        fourthHorizontalButtonStackview.spacing = 8
        
        fifthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        fifthHorizontalButtonStackview.axis = .horizontal
        fifthHorizontalButtonStackview.spacing = 8
        
        sixthHorizontalButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        sixthHorizontalButtonStackview.axis = .horizontal
        sixthHorizontalButtonStackview.spacing = 8
        
        
        testLabelOne.translatesAutoresizingMaskIntoConstraints = false
        testLabelOne.text = "001"
        testLabelOne.backgroundColor = .systemGreen
        testLabelOne.numberOfLines = 0
        testLabelOne.font = UIFont.preferredFont(forTextStyle: .title1)
        
        testLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        testLabelTwo.text = "002"
        testLabelTwo.backgroundColor = .systemGreen
        testLabelTwo.numberOfLines = 0
        testLabelTwo.font = UIFont.preferredFont(forTextStyle: .title1)
        
        testLabelThree.translatesAutoresizingMaskIntoConstraints = false
        testLabelThree.text = "003"
        testLabelThree.backgroundColor = .systemGreen
        testLabelThree.numberOfLines = 0
        testLabelThree.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl4.translatesAutoresizingMaskIntoConstraints = false
        tl4.text = "004"
        tl4.backgroundColor = .systemGreen
        tl4.numberOfLines = 0
        tl4.font = UIFont.preferredFont(forTextStyle: .title1)
       
        tl5.translatesAutoresizingMaskIntoConstraints = false
        tl5.text = "005"
        tl5.backgroundColor = .systemGreen
        tl5.numberOfLines = 0
        tl5.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl6.translatesAutoresizingMaskIntoConstraints = false
        tl6.text = "006"
        tl6.backgroundColor = .systemGreen
        tl6.numberOfLines = 0
        tl6.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl7.translatesAutoresizingMaskIntoConstraints = false
        tl7.text = "007"
        tl7.backgroundColor = .systemGreen
        tl7.numberOfLines = 0
        tl7.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl8.translatesAutoresizingMaskIntoConstraints = false
        tl8.text = "008"
        tl8.backgroundColor = .systemGreen
        tl8.numberOfLines = 0
        tl8.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl9.translatesAutoresizingMaskIntoConstraints = false
        tl9.text = "009"
        tl9.backgroundColor = .systemGreen
        tl9.numberOfLines = 0
        tl9.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl10.translatesAutoresizingMaskIntoConstraints = false
        tl10.text = "010"
        tl10.backgroundColor = .systemGreen
        tl10.numberOfLines = 0
        tl10.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl11.translatesAutoresizingMaskIntoConstraints = false
        tl11.text = "011"
        tl11.backgroundColor = .systemGreen
        tl11.numberOfLines = 0
        tl11.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl12.translatesAutoresizingMaskIntoConstraints = false
        tl12.text = "012"
        tl12.backgroundColor = .systemGreen
        tl12.numberOfLines = 0
        tl12.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl13.translatesAutoresizingMaskIntoConstraints = false
        tl13.text = "013"
        tl13.backgroundColor = .systemGreen
        tl13.numberOfLines = 0
        tl13.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl14.translatesAutoresizingMaskIntoConstraints = false
        tl14.text = "014"
        tl14.backgroundColor = .systemGreen
        tl14.numberOfLines = 0
        tl14.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl15.translatesAutoresizingMaskIntoConstraints = false
        tl15.text = "015"
        tl15.backgroundColor = .systemGreen
        tl15.numberOfLines = 0
        tl15.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl16.translatesAutoresizingMaskIntoConstraints = false
        tl16.text = "016"
        tl16.backgroundColor = .systemGreen
        tl16.numberOfLines = 0
        tl16.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl17.translatesAutoresizingMaskIntoConstraints = false
        tl17.text = "017"
        tl17.backgroundColor = .systemGreen
        tl17.numberOfLines = 0
        tl17.font = UIFont.preferredFont(forTextStyle: .title1)
        
        tl18.translatesAutoresizingMaskIntoConstraints = false
        tl18.text = "018"
        tl18.backgroundColor = .systemGreen
        tl18.numberOfLines = 0
        tl18.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
        firstHorizontalButtonStackview.addArrangedSubview(testLabelOne)
        firstHorizontalButtonStackview.addArrangedSubview(testLabelTwo)
        firstHorizontalButtonStackview.addArrangedSubview(testLabelThree)
        
        secondHorizontalButtonStackview.addArrangedSubview(tl4)
        secondHorizontalButtonStackview.addArrangedSubview(tl5)
        secondHorizontalButtonStackview.addArrangedSubview(tl6)
        
        thirdHorizontalButtonStackview.addArrangedSubview(tl7)
        thirdHorizontalButtonStackview.addArrangedSubview(tl8)
        thirdHorizontalButtonStackview.addArrangedSubview(tl9)
        
        fourthHorizontalButtonStackview.addArrangedSubview(tl10)
        fourthHorizontalButtonStackview.addArrangedSubview(tl11)
        fourthHorizontalButtonStackview.addArrangedSubview(tl12)
        
        fifthHorizontalButtonStackview.addArrangedSubview(tl13)
        fifthHorizontalButtonStackview.addArrangedSubview(tl14)
        fifthHorizontalButtonStackview.addArrangedSubview(tl15)
        
        sixthHorizontalButtonStackview.addArrangedSubview(tl16)
        sixthHorizontalButtonStackview.addArrangedSubview(tl17)
        sixthHorizontalButtonStackview.addArrangedSubview(tl18)
        
        mainYupuButtonStackview.addArrangedSubview(firstHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(secondHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(thirdHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(fourthHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(fifthHorizontalButtonStackview)
        mainYupuButtonStackview.addArrangedSubview(sixthHorizontalButtonStackview)
        
        view.addSubview(mainYupuButtonStackview)
        
        NSLayoutConstraint.activate([
            mainYupuButtonStackview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainYupuButtonStackview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
}
