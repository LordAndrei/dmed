//
//  ContentView.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
  @ObservedObject var netService = NetService()
    var body: some View {
      VStack {
        HStack {
          if let image = netService.returnData?.data?.results?.first?.images?.first?.webImage {
            getImage(for: image)
          } else {
          Image("notfound")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
          }
          getTitle()
        } // HStack
        Form {
          Section {
            getDescription()
          } header: {
            Text("About this comic…")
          } // Section
        } // Form
        let signature = netService.returnData?.attributionText ?? ""
        Text(signature)
          .font(.caption)
          .italic()
          .padding(.bottom)
      } // VStack
      .padding(.top)
    }

  func getImage(for imageURL: URL) -> some View {
      return WebImage(url: imageURL)
        .resizable()
        .placeholder(Image(systemName: "wifi"))
        .aspectRatio(contentMode: .fit)
        .frame(width: 150)
  }

  func getTitle() -> some View{
    let title = netService.returnData?.data?.results?.first?.title ?? "Unable to Load"
    return Text(title)
      .font(.largeTitle)
      .fontWeight(.bold)
      .padding()
  }

  func getDescription() -> some View {
    let description = netService.returnData?.data?.results?.first?.description ?? "Unable to Load"
    return Text(description)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
