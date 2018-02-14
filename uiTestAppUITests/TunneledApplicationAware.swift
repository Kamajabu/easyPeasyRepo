//
//  TunneledApplicationAware.swift
//  uiTestAppUITests
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import SBTUITestTunnel

protocol TunneledApplicationAware {
    var app: SBTUITunneledApplication { get }
}

extension TunneledApplicationAware {
    var app: SBTUITunneledApplication {
        return SBTUITunneledApplication()
    }
}

func jsonFileLoad(forBundle: Bundle, fileName: String) -> Any? {
    let json = forBundle.url(forResource: fileName, withExtension: "json")
    let jsonData = try! Data(contentsOf: json!)
    return try! JSONSerialization.jsonObject(with: jsonData, options: [])
}

func loadDocument(bundle: AnyClass,document: String , extenstion: String) -> Data {
    let bundle = Bundle(for: bundle)
    let fileURL = bundle.url(forResource: document, withExtension: extenstion)
    return try! Data(contentsOf: fileURL!)
}
