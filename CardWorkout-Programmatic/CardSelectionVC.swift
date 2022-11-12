//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Marco Duran on 11/10/22.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton      = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }

    //Adding the Subview to the View
    //This is important if you are going to be adding images to your programmatic code.  Not adding this will not allow you to see the view in the app
    func configureCardImageView() {
        view.addSubview(cardImageView) //Always add this
        cardImageView.translatesAutoresizingMaskIntoConstraints = false //This is telling swift to use auto layout
        cardImageView.image = UIImage(named: "AS")
        
        //Adding constraints to our subView
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //Using view.centerXAnchor is centering the card to the center of the view since SubView = View
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
        ])
    }
    
    
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
}
