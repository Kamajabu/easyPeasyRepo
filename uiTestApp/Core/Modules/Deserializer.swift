//
//  Deserializer.swift
//  uiTestApp
//
//  Created by Kamil Buczel on 14/02/2018.
//  Copyright © 2018 Kamil Buczel. All rights reserved.
//

import Foundation

protocol DeserializerProtocol {
    func decodeData<T: Decodable>(data: Data, dataType: T.Type,
                                  Completion decoded: @escaping ((T) -> ()))
}

class Deserializer: DeserializerProtocol {
    func decodeData<T: Decodable>(data: Data, dataType: T.Type,
                                  Completion decoded: @escaping ((T) -> ())) {
        do {
            let decodedData = try JSONDecoder().decode(dataType, from: data)
            decoded(decodedData)
        } catch let jsonError {
            print(jsonError)
        }
    }
}
