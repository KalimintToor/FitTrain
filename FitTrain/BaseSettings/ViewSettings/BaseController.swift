//
//  BaseController.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

enum NavBarPossition {
    case left
    case right
}
class BaseController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        configure()
    }
}

@objc extension BaseController{
    func addViews(){}
    func layoutViews(){}
    func configure(){
        view.backgroundColor = Resourses.Colors.backGround
    }
    
    func navBarLeftButtonHendler(){
        print("NavBar left button tapped")
    }
    
    func navBarRightButtonHendler(){
        print("NavBar right button tapped")
    }
}

extension BaseController{
    func addNavBarButton(at possition: NavBarPossition, with title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resourses.Colors.active, for: .normal)
        button.setTitleColor(Resourses.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resourses.Fonts.helveticaRegular(with: 17)
        
        switch possition {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHendler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHendler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        
                
        }
    }
    
    func setTitleNavBarButton(_ title: String, at possition: NavBarPossition){
        
        switch possition {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as?
                UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as?
                UIButton)?.setTitle(title, for: .normal)
                
        }
        view.layoutIfNeeded()
    }
}
