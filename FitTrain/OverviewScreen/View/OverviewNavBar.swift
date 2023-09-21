//
//  OverviewNavBar.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

final class OverviewNavBar: BaseView{
    
    private let titleLabel = UILabel()
    private let allWokoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(Resourses.Strings.Overview.allWorcoutsButton)
        return button
    }()
    private let addButton = UIButton()
    private let weakView = WeakView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resourses.Colors.separator, height: 1)
    }
    
    func addAllWorkoutsAction(_ action: Selector, with target: Any?){
        allWokoutsButton.addTarget(target, action: action, for: .touchUpInside)
        
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?){
        allWokoutsButton.addTarget(target, action: action, for: .touchUpInside)
        
    }
}

extension OverviewNavBar{
    override func addViews() {
        super.addViews()
        
        addViews(titleLabel)
        addViews(allWokoutsButton)
        addViews(addButton)
        addViews(weakView)
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWokoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWokoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWokoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWokoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWokoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWokoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weakView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weakView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weakView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weakView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    override func configureView() {
        super.configureView()
        
        backgroundColor = .white
        
        
        

        titleLabel.text = Resourses.Strings.NavBar.overview
        titleLabel.textColor = Resourses.Colors.titleGray
        titleLabel.font = Resourses.Fonts.helveticaRegular(with: 22)
    

        
        
        addButton.setImage(Resourses.Image.AddButtom.addBotton, for: .normal)
        
        weakView.translatesAutoresizingMaskIntoConstraints = false
         
        
    }
}
