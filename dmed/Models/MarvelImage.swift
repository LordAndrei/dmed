//
//  MarvelImage.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import Foundation

struct MarvelImage: Codable {
  var path: String?       //
  var fileExt: String?    //

  enum CodingKeys: String, CodingKey {
      case path
      case fileExt = "extension" // yeah, that's not nice to Swift
  }

  var webImage: URL? {
    var retURL: URL?
    if path != nil && fileExt != nil {
      retURL = URL(string:"\(path!).\(fileExt!)")
      if retURL != nil {
        let scheme = retURL!.scheme
        if scheme == "http" {
          // We received an insecure URL.
          // Lets try to make it secure
          let path = retURL!.path
          let host = retURL!.host
          if path.count < 1 || host == nil {
            print("throw an error")
          } else {
            retURL = URL(string:"https://\(host!)\(path)")
          }
        }
      }
    }
    return retURL
  }

}
