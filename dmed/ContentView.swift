//
//  ContentView.swift
//  dmed
//
//  Created by Andrei Freeman on 7/25/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var netService = NetService()
    var body: some View {
      VStack {
        HStack {
          Image("notfound")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
          Text("Hello, world!")
            .font(.largeTitle)
            .padding()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
