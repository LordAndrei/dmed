//
//  Comic.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import Foundation

struct Comic: Codable {
  let id: Int?                // The unique ID of the comic resource.
  let title: String?          // The canonical title of the comic.
  let description: String?    // The preferred description of the comic.
  let images: [MarvelImage]?  // A list of promotional images associated with this comic.

}
