//
//  OverViewController.swift
//  FitTrain
//
//  Created by Александр on 9/21/23.
//

import UIKit

struct TraningData {
    struct Data {
        let title: String
        let subtitle: String
        let isDone: Bool
    }

    let date: Date
    let items: [Data]
}

class OverViewController: BaseController {
    
    private let navBar = OverviewNavBar()
    
    private var dataSource: [TraningData] = []
    
    private let collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layot)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    

}

extension OverViewController{
    override func addViews() {
        super.addViews()
        
        view.addSubview(navBar)
        view.addViews(collectionView)
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([

            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //navBar.heightAnchor.constraint(equalToConstant: 113),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
            
        ])
    }
    override func configure() {
        super.configure()
        
        navigationController?.navigationBar.isHidden = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(TraningCellView.self, forCellWithReuseIdentifier: TraningCellView.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = [
                    .init(date: Date(),
                          items: [
                            .init(title: "Разминка кардио", subtitle: "Aльпинист • 10 минут", isDone: true),
                            .init(title: "Кардио высокой интенсивности", subtitle: "Беговая дорожка • 50 минут", isDone: false),
                          ]),
                    .init(date: Date(),
                          items: [
                            .init(title: "Разминка кардио", subtitle: "Aльпинист • 10 минут", isDone: false),
                            .init(title: "Тренировка груди", subtitle: "Жим лежа • 3 подхода • 10 повторений", isDone: false),
                            .init(title: "Тренировка трицепса", subtitle: "Французский жим • 5 подходов • 8 повторений", isDone: false),
                          ]),
                    .init(date: Date(),
                          items: [
                            .init(title: "Кардио высокой интенсивности", subtitle: "Беговая дорожка • 60 минут", isDone: false),
                          ])
                ]
        collectionView.reloadData()
        
    }
}

extension OverViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       dataSource[section].items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TraningCellView.id, for: indexPath
        ) as? TraningCellView else { return UICollectionViewCell() }

        let item = dataSource[indexPath.section].items[indexPath.row]

        let roundedType: CellRoundedType
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .all
        } else if indexPath.row == 0 {
            roundedType = .top
        } else if indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .bottom
        } else {
            roundedType = .notRounded
        }

        cell.configure(with: item.title, subTitle: item.subtitle, isDone: item.isDone, roundedType: roundedType)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath
        ) as? SectionHeaderView else { return UICollectionReusableView() }

        view.configure(with: Date())//dataSource[indexPath.section].date
        return view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}

