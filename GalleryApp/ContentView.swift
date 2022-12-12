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
    @State var aboutLink:Bool = false
    
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
            /*
             NavigationLink(destination: AboutPage(), isActive: $aboutLink) {
                EmptyView()
            } */
            
            }
        }
        .navigationBarBackButtonHidden(true)
        /* .navigationBarItems(trailing:
        Button(action:{
            openMenu = true
         print("triggered")
        },
        label:{
            Image(systemName: "chevron.down").font(.title)
        }))
        */
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .topTrailing, content: {
            Button(action:{
                openMenu.toggle()
            }, label: {
                Image(systemName: "chevron.down").font(.largeTitle)
            })
        })
//        .fullScreenCover(isPresented: $openMenu, content: {
        .sheet(isPresented: $openMenu, content: {
            NavigationView {
                ZStack {
                    Color.white.opacity(0).edgesIgnoringSafeArea(.all)
                    VStack(spacing:30) {
                        Text("").padding(30)
                        NavigationLink(destination: AboutPage(), isActive: $aboutLink) {
                            Button("About", action:{
                                aboutLink.toggle()
                                //  openMenu.toggle()
                            }).font(.title)
                        }
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
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            
            .background(BackgroundBlurView()).edgesIgnoringSafeArea(.all)
        })
    }
}

struct AboutPage:View {
    var body: some View {
        HStack (alignment: .top) {
            VStack (alignment: .leading, spacing: 20){
                Text("About App").font(.largeTitle).foregroundColor(.white).padding()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elit justo, pharetra eu ipsum finibus, semper dapibus quam. Donec ut molestie tortor, sed lobortis quam.\n\n Nunc accumsan laoreet justo, et eleifend nisl finibus eget. In rutrum lacus quis felis facilisis consectetur. Aliquam blandit nibh ut porta semper. Praesent at ornare nibh. Quisque quis diam aliquam, porta metus eu, posuere nisi. \n\n In dignissim condimentum purus in dignissim. Aliquam erat volutpat. Donec magna erat, tristique at auctor quis, condimentum in risus. Quisque at.").font(.body).foregroundColor(.gray).multilineTextAlignment(.leading).frame(alignment: .topTrailing).padding()
                Spacer()
            }
        }
    }
}

struct BackgroundBlurView:UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialDark))
        
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
