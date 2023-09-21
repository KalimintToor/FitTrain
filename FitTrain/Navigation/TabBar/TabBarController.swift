//
//  TabBarController.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

enum Tabs:Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
        
        switchTo(tab: .overview)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
            selectedIndex = tab.rawValue
    }
    
    private func configure(){
        tabBar.tintColor = Resourses.Colors.active
        //tabBar.barTintColor = Resourses.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resourses.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverViewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNav = NavBarController(rootViewController: overviewController)
        let sessionNav = NavBarController(rootViewController: sessionController)
        let progressNav = NavBarController(rootViewController: progressController)
        let settingsNav = NavBarController(rootViewController: settingsController)
        
        overviewNav.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.overview,
                                                     image: Resourses.Image.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNav.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.session,
                                                     image: Resourses.Image.session,
                                                     tag: Tabs.session.rawValue)
        progressNav.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.progress,
                                                     image: Resourses.Image.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNav.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.settings,
                                                     image: Resourses.Image.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNav,
            sessionNav,
            progressNav,
            settingsNav
        ], animated: false)
    }
    

    

}
