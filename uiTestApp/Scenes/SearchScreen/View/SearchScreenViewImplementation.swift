//
//  LoginScreenViewImplementation.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class SearchScreenViewImplementation: UIViewController, SearchScreenView {   
    var configurator = SearchScreenConfiguratorImplementation()
    var presenter: SearchScreenPresenter!
    
    fileprivate lazy var searchReposTextfield: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        return textField
    }()
    
    fileprivate lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        return button
    }()
    
    fileprivate lazy var headerAndTitleBar: UIView = {
        let view = UIView(frame: CGRect.zero)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(searchScreenViewImplementation: self)
        
        self.setup()
    }
    
    fileprivate func setup() {
        self.view.backgroundColor = .white
        
        setupHeaderAndTitleLabel()
        setupSearchReposField()
        setupSearchButton()
    }
    
    //MARK: HeaderAndTitleLabel
    func setupHeaderAndTitleLabel() {
        self.view.addSubview(headerAndTitleBar)
        positionHeaderAndTitleBar()
        
        stylizeHeaderAndTitleBar()
    }
    
    func positionHeaderAndTitleBar() {
        self.headerAndTitleBar <- [
            Leading(0).to(self.view),
            Top(0).to(self.view),
            Width(1).like(self.view),
            Height(*0.08).like(self.view)
        ]
    }
    
    func stylizeHeaderAndTitleBar() {
        self.headerAndTitleBar.backgroundColor = .red
    }
    
    //MARK: SearchReposTextfield
    func setupSearchReposField() {
        self.view.addSubview(self.searchReposTextfield)
        positionUserLoginTextfield()
        
        stylizeTextField(searchReposTextfield)
        searchReposTextfield.placeholder = SearchScreenViewParameters.searchTextFieldPlaceholder
        searchReposTextfield.accessibilityIdentifier = "SearchReposTextfield"
    }
    
    func positionUserLoginTextfield() {
        self.searchReposTextfield <- [
            Height(SearchScreenViewParameters.uiTextFieldHeight),
            Top(SearchScreenViewParameters.searchTextFieldTopDistance).to(self.headerAndTitleBar),
            Left(SearchScreenViewParameters.uiTextFieldBorderDistance).to(self.view),
            Right(SearchScreenViewParameters.uiTextFieldBorderDistance).to(self.view)
        ]
    }
    
    func stylizeTextField(_ textField: UITextField) {
        textField.font = UIFont.systemFont(ofSize: SearchScreenViewParameters.uiTextFieldFontSize)
        textField.backgroundColor = .lightGray
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    }
    
    //MARK: SearchButton
    func setupSearchButton() {
        self.view.addSubview(self.searchButton)
        
        positionSearchButton()
        stylizeSearchButton()
        
        searchButton.accessibilityIdentifier = "SearchButton"
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
    }
    
    func positionSearchButton() {
        self.searchButton <- [
            Height(SearchScreenViewParameters.searchButtonHeight),
            Width(*0.8).like(searchReposTextfield),
            Top(SearchScreenViewParameters.searchButtonTopDistance).to(self.searchReposTextfield),
            CenterX().to(self.searchReposTextfield)
        ]
    }
    
    func stylizeSearchButton() {
        self.searchButton.backgroundColor = .gray
        self.searchButton.setTitle(SearchScreenViewParameters.searchButtonTitle, for: .normal)
    }
    
    @objc func searchButtonAction(sender: UIButton!) {
        presenter.downloadData(inputText: self.searchReposTextfield.text)
    }
    
    func presentResultsScreen(destinationViewController: UIViewController) {
        DispatchQueue.main.async(execute: {
            self.present(destinationViewController, animated: true, completion: nil)
        })
    }
    
}
