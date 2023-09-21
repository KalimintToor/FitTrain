//
//  WeakDayView.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

extension WeakView{
    final class WeakDayView: BaseView{
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String){
            let startOfWeak = Date().startOfWeek
            let currentDay = startOfWeak.agoForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)
            
            let isTooDay = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isTooDay ? Resourses.Colors.active : Resourses.Colors.backGround
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isTooDay ? .white : Resourses.Colors.inactive
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isTooDay ? .white : Resourses.Colors.inactive
        }
    }
}
    
extension WeakView.WeakDayView{
    override func addViews() {
        super.addViews()
        
        addViews(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([

            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
        ])
    }
    override func configureView() {
        super.configureView()
        
        
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resourses.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resourses.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}

