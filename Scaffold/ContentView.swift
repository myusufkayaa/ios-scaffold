//
//  ContentView.swift
//  Scaffold
//
//  Created by Muhammed Yusuf Kaya (Dogus Teknoloji) on 11.08.2023.
//

import Logger
import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "sun.max")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("This is Scaffold!")
    }
    .onAppear {
      DTLog.viewCycle.info("Content View Appeared")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
