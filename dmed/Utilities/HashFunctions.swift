//
//  HashFunctions.swift
//  dmed
//
//  Created by zaph on 8/23/15.
// https://stackoverflow.com/questions/32163848/how-can-i-convert-a-string-to-an-md5-hash-in-ios-using-swift
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class DmedUtils {

    static func MD5(string: String) -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
      return digestData.map { String(format: "%02hhx", $0)}.joined()
    }

  static func getHeaders() -> [String: String] {
    let publicKey = "bf22c15f7759294ead460ed03d6e4735"

    // Sssh. Don't tell anyone. I'd normally hide this better
    let privateKey = "a1a3d73c87389672b1ea6373711d9fef9de781e5"

    let ts = String(Date.timeIntervalSinceReferenceDate)
    let hash = MD5(string: "\(ts)\(privateKey)\(publicKey)")

    let retDict = [
      "apikey":publicKey,
      "ts":ts,
      "hash":hash
    ]
    return retDict
  }

}
