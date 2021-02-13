//
//  APIResource.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation

public enum RequestMethod: String {
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case get = "GET"
}

public enum RequestContentType {
    case json
    case urlEncoded
    case multipart
}



struct APIResource {
    let urlString: String
    let method: RequestMethod
    let contentType: RequestContentType
    let parameter: [String:Any]?
    let customHeader: [String:Any]?
    let responseKeyPath: String?
    let formData: FormData?
    var shouldReturnSessionExpiry: Bool = false
    
    
    init(URLString url: String, method: RequestMethod = .get,
         parameters: [String:Any]? = nil, headers: [String:Any]? = nil,
         contentType: RequestContentType = .urlEncoded, formData: FormData? = nil,  responseKey: String? = nil) {
        
        self.urlString = url
        self.method = method
        self.contentType = contentType
        self.parameter = parameters
        self.customHeader = headers
        self.responseKeyPath = responseKey
        self.formData = formData
        
    }
    
    
    struct FormData {
        struct FileAttachment {
            let data: Data?
            let keyName: String
            let fileName: String?
            let mimeType: String?
        }
        let fileAttachments: [FileAttachment]?
        let otherParameter: [String : Data]
    }
    
}
