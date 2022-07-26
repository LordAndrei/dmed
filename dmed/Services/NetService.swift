//
//  NetService.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import Alamofire
import Foundation

class NetService: ObservableObject {

  // for the sake of argument there are far better ways to encrypt keys and
  // do the hashing for authentication but that seems out of scope of the
  // exercise.
  let apiKey = "bf22c15f7759294ead460ed03d6e4735"
  let ts = "1"
  let magicHashIWouldNeverStoreThisWay = "a4693ceec80fe7e05be72124bae71730"
  let rootURL = "https://gateway.marvel.com/v1/public/comics/70779"

  @Published var returnData: ComicDataWrapper?

  init() {
    load()
  }

  func load() {
//    let headerDict:[String:String] = [
//      "apiKey":apiKey,
//      "ts":ts,
//      "hash":magicHashIWouldNeverStoreThisWay
//    ]

    let params = "?apikey=\(apiKey)&ts=1&hash=\(magicHashIWouldNeverStoreThisWay)"
    let urlString = "\(rootURL)\(params)"
    print(urlString)
    guard let url = URL(string: urlString) else {
      print("Throw an error here.")
      return
    }

    AF.request(url).response { response in
      guard let data = response.data else {
        print("Throw an error here.")
        return
      }
      let decoder = JSONDecoder()
      do {
        self.returnData = try decoder.decode(ComicDataWrapper.self, from: data)
      } catch let error {
        print("Error: \(error); \(error.localizedDescription)")
        print("Throw a big error")
        return
      }
      if self.returnData != nil {
        print("ReturnData: \(self.returnData!)")
      }
    }
  }
}
