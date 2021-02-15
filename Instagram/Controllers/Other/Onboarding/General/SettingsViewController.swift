//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Emad Albarnawi on 13/01/2021.
//

import UIKit

struct SettingsCellModel {
    let title: String
    let handler: () -> Void
}

final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var data = [[SettingsCellModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setTableViewAnchors()
        configureModel()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTableViewAnchors() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func configureModel() {


        data.append([
            SettingsCellModel(title: "Edit Profile") {
                [weak self] in
            },
            SettingsCellModel(title: "Invite Friends") {
                [weak self] in
            },
            SettingsCellModel(title: "Save Original Posts") {
                [weak self] in
            }
        ])
        data.append([
            SettingsCellModel(title: "Terms of Service") {
                [weak self] in
            },
            SettingsCellModel(title: "Privacy Policy") {
                [weak self] in
            },
            SettingsCellModel(title: "Help & Feedback") {
                [weak self] in
            }
        ])
        
        let section = [
            SettingsCellModel(title: "Log Out") {
                [weak self] in
                let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want Sign Out?", preferredStyle: .actionSheet)
                let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive, handler: { (action) in
                    self?.logOutClicked()
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addAction(signOutAction)
                alert.addAction(cancelAction)
                
                self?.present(alert, animated: true)
            },
        ]
        
        data.append(section)
    }
    @objc private func logOutClicked() {
        AuthManager.shared.logOut { (loggedOut) in
            DispatchQueue.main.async {
                if loggedOut {
                    let vc = LoginViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true) {
//                        Uncomment when ready!!
//                        self.navigationController?.popToRootViewController(animated: false)
//                        self.tabBarController?.selectedIndex = 0
                    }
                }
                else {
                    
                }
            }
        }
    }

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
