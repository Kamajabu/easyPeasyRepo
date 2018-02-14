//
//  GithubRepoItemCell.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class GithubRepoItemCell: UITableViewCell {
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect.zero)
        return titleLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    func setup() {
        setupTitleLabel()
    }
    
    func setupTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        positionTitleLabel()
    }
    
    func positionTitleLabel() {
        self.titleLabel <- [
            Left(10).to(self.contentView),
            Right(10).to(self.contentView),
            Top(14).to(self.contentView)
        ]
    }
    
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func setTitleLabel(content: String) {
        self.titleLabel.text = content
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

