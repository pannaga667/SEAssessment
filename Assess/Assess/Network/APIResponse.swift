//
//  APIResponse.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation

import Foundation

public typealias JSONDictionarySWFT5 = [String : AnyObject]

public struct APIResponse<Value> {
    let statusCode: Int?
    let data: Value?
    let responseHeaders: [AnyHashable : Any]?
    
    init(statusCode: Int?, data: Value?, responseHeaders: [AnyHashable : Any]?) {
        self.statusCode = statusCode
        self.data = data
        self.responseHeaders = responseHeaders
    }
}
