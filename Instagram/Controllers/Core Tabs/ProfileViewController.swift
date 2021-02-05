//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var settingsButton: UIBarButtonItem = {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(settingsButtonClicked))
        settingsButton.tintColor = .secondaryLabel
        return settingsButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .secondaryLabel
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = settingsButton
    }
    @objc private func settingsButtonClicked() {
        let vc = SettingsViewController()
//        navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: self)
    }

}
