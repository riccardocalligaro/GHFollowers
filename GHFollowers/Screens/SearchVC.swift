//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Riccardo on 13/01/21.
//

import UIKit

protocol SearchVCDelegate: AnyObject {
    func didChangeCurrentUser()
}

class SearchVC: UIViewController {
        
    // MARK: - Views
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get followers")

    // MARK: - Computed variables
    
    var isUsernameValid: Bool {
        let usernameFormat = "^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)*$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameFormat)
        
        return !usernameTextField.text!.isEmpty && usernamePredicate.evaluate(with: usernameTextField.text)
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // if we called this on view did load the nav bar
        // wouldn't be hidden when the back button is pressed
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    // MARK: - Logic
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        
        guard isUsernameValid else {
            presentGFAlertOnMainThread(title: "Error", message: "Error", buttonTitle: "Error")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        followerListVC.searchVCDelegate = self
        
        navigationController?.pushViewController(followerListVC, animated: true)
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
        usernameTextField.delegate = self
        
        usernameTextField.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 48, paddingLeft: 50, paddingRight: 50)
        usernameTextField.setHeight(50)
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        callToActionButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        
        callToActionButton.setHeight(50)
    }

}

// MARK: - Text field delegate

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}

extension SearchVC: SearchVCDelegate {
    func didChangeCurrentUser() {
        usernameTextField.text = ""
    }
    
    
}
