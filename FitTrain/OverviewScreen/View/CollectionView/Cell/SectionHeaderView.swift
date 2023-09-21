//
//  SectionHeaderView.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView{
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = Resourses.Fonts.helveticaRegular(with: 13)
        lable.textColor = Resourses.Colors.inactive
        lable.textAlignment = .center
        
        return lable
    }()
    
    func configure(with date: Date) {
        let dataFormater = DateFormatter()
        dataFormater.dateFormat = "EEEE, MMMM dd"
        self.title.text = dataFormater.string(from: date).uppercased()
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

private extension SectionHeaderView{
    
        func addViews(){
            addViews(title)
        }

        func layoutViews(){
            

            NSLayoutConstraint.activate([
                title.centerYAnchor.constraint(equalTo: centerYAnchor),
                title.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        }

    func configure() {}
}


