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
    
    fileprivate lazy var detailsLabel: UILabel = {
        let detailsLabel = UILabel(frame: CGRect.zero)
        return detailsLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    var defaultIdentifier: String?
    
    func setup() {
        setupTitleLabel()
        setupDetailsLabel()
        
        self.contentView.layer.borderWidth = 2
    }
    
    //MARK: TitleLabel
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
    
    func setTitleLabel(content: String) {
        self.titleLabel.text = content
    }

    //MARK: DetailsLabel
    func setupDetailsLabel() {
        self.contentView.addSubview(self.detailsLabel)
        positionDetailsLabel()
        stylizeDetailsLabel()
    }
    
    func positionDetailsLabel() {
        self.detailsLabel <- [
            Left(10).to(self.contentView),
            Right(10).to(self.contentView),
            Top(14).to(self.titleLabel)
        ]
    }
    
    func stylizeDetailsLabel() {
        self.detailsLabel.font = UIFont.systemFont(ofSize: 12)
        self.detailsLabel.textColor = .white
    }
    
    func setDetailsLabel(content: String) {
        self.detailsLabel.text = content
    }
    
    //MARK: Other
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
        decorateWithColor(color: color)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIdentifier(row: Int) {
        self.accessibilityIdentifier = "resultsCell_\(row)"
        self.defaultIdentifier = self.accessibilityIdentifier
    }
    
    func decorateWithColor(color: UIColor) {
        //Color could be changed to enum
        self.accessibilityIdentifier = "\(defaultIdentifier ?? "")_\(color.debugDescription)"
        print(self.accessibilityIdentifier ?? "")
    }
}

