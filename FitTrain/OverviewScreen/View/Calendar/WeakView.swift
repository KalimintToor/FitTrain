//
//  WeakView.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

final class WeakView: BaseView{
    
    private let calendar = Date.calendar
    private let stackView = UIStackView()
    
    
}
    
    
extension WeakView{
    override func addViews() {
        super.addViews()
        
        addViews(stackView)
        
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            //navBar.heightAnchor.constraint(equalToConstant: 113),
            
            
        ])
    }
    override func configureView() {
        super.configureView()
        
        
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
        
        if Date.calendar.firstWeekday == 1{
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
            
        }
            
        weekdays.enumerated().forEach{ index, name in
            
            let view = WeakDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
            
        }
    }
}
