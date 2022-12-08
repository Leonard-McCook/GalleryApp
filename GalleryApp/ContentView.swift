//
//  ContentView.swift
//  GalleryApp
//
//  Created by Leonard McCook-Carr on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var openMenu:Bool = false
    
    init() {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
    }
    
    var body: some View {
        GeometryReader {geo in
        ScrollView {
            LazyVGrid(columns: columns){
                    ForEach(1...10, id: \.self){ i in
                        Color.orange.frame(width:geo.size.width/2,
                            height:geo.size.height/2)
                    }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
        Button(action:{
            openMenu = true
         print("triggered")
        },
        label:{
            Image(systemName: "chevron.down").font(.title)
        }))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $openMenu, content: {
            ZStack {
                VStack {
                    Button("About", action:{
                        openMenu.toggle()
                    }).font(.title)
                    Button("App Icon", action:{
                        openMenu.toggle()
                    }).font(.title)
                    Button("License Agreement", action:{
                        openMenu.toggle()
                    }).font(.title)
                    Button("Privacy", action:{
                        openMenu.toggle()
                    }).font(.title)
                    Spacer()
                    Text("App Version 1.0").font(.subheadline).padding()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
