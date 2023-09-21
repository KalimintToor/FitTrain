//
//  WAButton.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

public enum WAButtonType{
    case primary
    case secondary
}

final class WAButton: UIButton{
    
    private var type: WAButtonType = .primary
    private var title: String?
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    //private let buttonTitle : WAButtonType
    
    
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        
        addViews()
        layoutViews()
        configure()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
        }

}

private extension WAButton{
    func addViews(){
        addViews(label)
        addViews(iconView)
    }
    func layoutViews(){
        var horisontalOffset: CGFloat {
                    switch type {
                    case .primary: return 0
                    case .secondary: return 10
                    }
                }

                NSLayoutConstraint.activate([
                    iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
                    iconView.heightAnchor.constraint(equalToConstant: 5),
                    iconView.widthAnchor.constraint(equalToConstant: 10),

                    label.centerYAnchor.constraint(equalTo: centerYAnchor),
                    label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
                    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
                ])
    }
    func configure(){
        
        switch type {
        case .primary:
            label.textColor = Resourses.Colors.inactive
            iconView.tintColor = Resourses.Colors.inactive
            label.font = Resourses.Fonts.helveticaRegular(with: 13)
        case .secondary:
            backgroundColor = Resourses.Colors.secondary
            layer.cornerRadius = 14
            label.textColor = Resourses.Colors.active
            label.font = Resourses.Fonts.helveticaRegular(with: 15)
        }
        makeSystem(self)
        

        
        
        label.textAlignment = .center //расположение текста
        label.text = title

        iconView.image = Resourses.Image.Common.allWorcoutsButton?.withRenderingMode(.alwaysTemplate)
        
    }
}
