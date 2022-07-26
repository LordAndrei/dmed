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
    var retValue: URL?
    if path != nil && fileExt != nil {
      retValue = URL(string:"\(path!).\(fileExt!)")
    }
    return retValue
  }

}
