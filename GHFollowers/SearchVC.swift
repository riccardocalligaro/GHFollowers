//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Riccardo on 13/01/21.
//

import UIKit

class SearchVC: UIViewController {
    
    
    // MARK: - Views
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get followers")

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // if we called this on view did load the nav bar
        // wouldn't be hidden when the back button is pressed
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
    }
    
    // MARK: - Views configuration
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 80)
        logoImageView.centerX(inView: view)
        logoImageView.setHeight(200)
        logoImageView.setWidth(200)
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        usernameTextField.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 48, paddingLeft: 50, paddingRight: 50)
        usernameTextField.setHeight(50)
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        
        callToActionButton.setHeight(50)
    }
}
