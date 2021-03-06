//
//  SearchData.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

struct SearchData: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [RepoItem]
}
