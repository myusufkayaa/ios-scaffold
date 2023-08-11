//
//  ContentView.swift
//  Scaffold
//
//  Created by Muhammed Yusuf Kaya (Dogus Teknoloji) on 11.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "sun.max")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("This is Scaffold!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
