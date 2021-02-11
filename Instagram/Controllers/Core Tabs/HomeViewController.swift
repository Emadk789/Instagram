//
//  HomeViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit
import FirebaseAuth

struct HorizontalCollectionViewModel {
    let image: UIImage?
    let color: UIColor?
    let handler: ()-> Void
}

class HomeViewController: UIViewController {

    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 60,
                                          height: 60)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private var horizontalCollectionViewData = [HorizontalCollectionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = UIColor.label
        
        addSubViews()
        configurHorizantalCollectionViewAnchors()
        
        configurHorizontalCollectionViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handelNotAuthenticated()
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
    }
    private func addSubViews() {
        view.addSubview(horizontalCollectionView)
    }
    private func configurHorizantalCollectionViewAnchors() {
        horizontalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        horizontalCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func configurHorizontalCollectionViewModel() {
        for _ in 0...10 {
        let model = HorizontalCollectionViewModel(image: nil,
                                                  color: .systemGreen,
                                                  handler: handeldidSelectHorizontalCollectionViewCell)
        horizontalCollectionViewData.append(model)
        }
    }
    private func handeldidSelectHorizontalCollectionViewCell() {
        print("Yes")
    }
    
    private func handelNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show login
            let loginViewContoller = LoginViewController()
            loginViewContoller.modalPresentationStyle = .fullScreen
            present(loginViewContoller, animated: false, completion: nil)
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        horizontalCollectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = horizontalCollectionViewData[indexPath.item].color
        cell.layer.cornerRadius = cell.width/2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        horizontalCollectionViewData[indexPath.item].handler()
    }
    
}
