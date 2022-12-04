//
//  ContentView.swift
//  GalleryApp
//
//  Created by Leonard McCook-Carr on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
    }
    
    var body: some View {
        ScrollView {
            
        }
        HStack {
            VStack {
                Text("Lorem ipsum dolor sit amet").foregroundColor(.white).font(.title2)
                Text("See what's coming in the next update").foregroundColor(.white)
                Link("Let's connect on LinkedIn >", destination: URL(string:"https://www.linkedin.com/in/leonard-mccook/")!)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
