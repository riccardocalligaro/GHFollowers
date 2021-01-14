//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Riccardo on 14/01/21.
//

import UIKit

class GFAlertVC: UIViewController {

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlgiment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlgiment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    let padding: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // semi-trasparent black
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
        configureDismissGesture()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
    
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.centerX(inView: view)
        containerView.centerY(inView: view)
        containerView.setHeight(200)
        containerView.setWidth(280)
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        
        titleLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: padding, paddingLeft: padding, paddingRight: padding)
    }
    
    func configureBodyLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Generic error message"
        messageLabel.numberOfLines = 4
        
        messageLabel.anchor(top: titleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: actionButton.topAnchor, right: containerView.rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 12, paddingRight: 20)
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        
        actionButton.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        actionButton.setHeight(44)
    }
    
    func configureDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        
        tapGesture.delegate = self

        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissVC() {
        print("Dismiss")
        dismiss(animated: true)
    }

}

extension GFAlertVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                shouldReceive touch: UITouch) -> Bool {
           return (touch.view !== self.containerView)
    }
}
