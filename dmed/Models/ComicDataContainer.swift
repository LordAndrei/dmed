//
//  ComicDataContainer.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import Foundation

struct ComicDataContainer: Codable {
  let offset: Int       // The requested offset (number of skipped results) of the call.
  let limit: Int        // The requested result limit.
  let total: Int        // The total number of resources available given the current filter set.
  let count: Int        // The total number of results returned by this call.
  let results:[Comic]?  //The list of comics returned by the call
}
