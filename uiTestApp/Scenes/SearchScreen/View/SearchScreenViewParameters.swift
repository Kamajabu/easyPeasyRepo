//
//  LoginScreenConfiguration.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation
import EasyPeasy

struct SearchScreenViewParameters {
    //Disclimer: Every mark aside of general is optional because only that one will be reused. Others can be viewed as duplicated data (breaking K.I.S.S). Exception here
    // are Strings, configuration file is good place for assigning localized strings
    
    // MARK: General text fields
    static let uiTextFieldHeight: CGFloat = 32
    static let uiTextFieldBorderDistance: CGFloat = 48
    
    static let uiTextFieldFontSize: CGFloat = 16
    
    // MARK: Search text field
    static let searchTextFieldTopDistance: CGFloat = 112
    static let searchTextFieldPlaceholder: String = "Enter text here" //could be changed to localized string
    
    // MARK: Search button
    static let searchButtonHeight: CGFloat = 32
    static let searchButtonTopDistance: CGFloat = 64
    static let searchButtonTitle: String = "Search"
}
