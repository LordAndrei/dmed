//
//  ComicDataWrapper.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import Foundation

struct ComicDataWrapper: Codable {
  let code: Int?                // The HTTP status code of the returned result.
  let status: String?           // A string description of the call status.
  let copyright: String?        // The copyright notice for the returned result.
  let attributionText: String?  // The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.
  let attributionHTML: String?  // An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.
  let data: ComicDataContainer? // The results returned by the call.
  let etag: String?              // A digest value of the content returned by the call.
}


