//
//  TraningCellView.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TraningCellView: UICollectionViewCell{
    static let id = "TraningCellView"
    
    private let checkmartView: UIImageView = {
        let view = UIImageView()
        view.image = Resourses.Image.Overview.checked
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        
        return view
    }()
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 17)
        lable.textColor = Resourses.Colors.titleGray
        
        return lable
    }()
    
    private let subTitle: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 13)
        lable.textColor = Resourses.Colors.inactive
        
        return lable
    }()
    
    private let rightArrowView: UIImageView = {
        let image = UIImageView()
        image.image = Resourses.Image.Overview.rightArrow
        
        return image
    }()
    
    func configure(with title: String, subTitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title.uppercased()
        self.subTitle.text = subTitle
        
        checkmartView.image = isDone ? Resourses.Image.Overview.checked : Resourses.Image.Overview.oval
        
        switch roundedType {
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}

private extension TraningCellView{
    
        func addViews(){
            addViews(checkmartView)
            addViews(title)
            addViews(stackView)
            stackView.addArrangedSubview(title)
            stackView.addArrangedSubview(subTitle)
            addViews(rightArrowView)
            
        }

        func layoutViews(){
            

            NSLayoutConstraint.activate([
                
                checkmartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                checkmartView.centerYAnchor.constraint(equalTo: centerYAnchor),
                checkmartView.heightAnchor.constraint(equalToConstant: 28),
                checkmartView.widthAnchor.constraint(equalTo: checkmartView.heightAnchor),

                            stackView.leadingAnchor.constraint(equalTo: checkmartView.trailingAnchor, constant: 15),
                            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),

                            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
                            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
                            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
            ])
        }

    func configure() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Resourses.Colors.separator.cgColor
    }
}

