//
//  NavBarController.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

final class NavBarController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .white
        navigationBar.isTranslucent = false //чтобы navBar не заканчивался по границе statusBar
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resourses.Colors.titleGray,
            .font: Resourses.Fonts.helveticaRegular(with: 17) //значения и размер текста заголовка
        ]
    }
}
