//
//  DownloadStartRequest.swift
//  flutter_inappwebview
//
//  Created by Lorenzo Pichilli on 17/04/22.
//

import Foundation

public class DownloadStartRequest: NSObject {
    var url: String
    var userAgent: String?
    var contentDisposition: String?
    var mimeType: String?
    var contentLength: Int64
    var suggestedFilename: String?
    var textEncodingName: String?
    
    public init(url: String, userAgent: String?, contentDisposition: String?,
                mimeType: String?, contentLength: Int64,
                suggestedFilename: String?, textEncodingName: String?) {
        self.url = url
        self.userAgent = userAgent
        self.contentDisposition = contentDisposition
        self.mimeType = mimeType
        self.contentLength = contentLength
        self.suggestedFilename = suggestedFilename
        self.textEncodingName = textEncodingName
    }
    
    public func toMap () -> [String:Any?] {
        return [
            "url": url,
            "userAgent": userAgent,
            "contentDisposition": contentDisposition,
            "mimeType": mimeType,
            "contentLength": contentLength,
            "suggestedFilename": suggestedFilename,
            "textEncodingName": textEncodingName
        ]
    }
}


public class DownloadStartResponse: NSObject {
  var handled: Bool
  var resultFilePath: String?
  
  public init(handled: Bool, resultFilePath: String?) {
    self.handled = handled
    self.resultFilePath = resultFilePath
  }
  
  public func toMap () -> [String:Any?] {
    return [
      "handled": handled,
      "resultFilePath": resultFilePath
    ]
  }
  
  public static func fromMap(map: [String:Any?]?) -> DownloadStartResponse? {
    guard let map = map else {
      return nil
    }
    let handled = map["handled"] as! Bool
    let resultFilePath = map["resultFilePath"] as! String?
    return DownloadStartResponse(handled: handled, resultFilePath: resultFilePath)
  }
}
