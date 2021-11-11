//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Riccardo on 28/10/21.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseId = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlgiment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAvatarImageView()
         configureUsernameLabel()
        
        
        usernameLabel.text = "Hello world"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    func configureAvatarImageView() {
           addSubview(avatarImageView)
           
           NSLayoutConstraint.activate([
               avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -8),
               avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
               avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
               
               avatarImageView.heightAnchor.constraint(equalToConstant:  contentView.frame.height - 48),
               avatarImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width - 16)
           ])
       }
       
       func configureUsernameLabel() {
           addSubview(usernameLabel)
           
           NSLayoutConstraint.activate([
               usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
               usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
               usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
               usernameLabel.heightAnchor.constraint(equalToConstant: 20)      //according to the font size of 16
           ])
           usernameLabel.textAlignment = .center
       }
}
