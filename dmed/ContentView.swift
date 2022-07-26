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
            WebImage(url: image)
              .resizable()
              .placeholder(Image(systemName: "wifi"))
              .aspectRatio(contentMode: .fit)
              .frame(width: 150)
          } else {
          Image("notfound")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
          }
          let title = netService.returnData?.data?.results?.first?.title ?? "Unable to Load"
          Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
        } // HStack
        Form {
          Section {
            let description = netService.returnData?.data?.results?.first?.description ?? "Unable to Load"
            Text(description)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
