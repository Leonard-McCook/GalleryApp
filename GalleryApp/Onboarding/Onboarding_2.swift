//
//  Onboarding_2.swift
//  GalleryApp
//
//  Created by Leonard McCook-Carr on 11/29/22.
//

import SwiftUI

struct Onboarding_2: View {
    @State var isActive:Bool = false
    
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
            Spacer()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.").foregroundColor(.white).font(.title).multilineTextAlignment(.center)
                
            Spacer()
                NavigationLink(destination:ContentView(), isActive: $isActive ){
                    Button(action:{
                        isActive = true
                    }){
                        Image(systemName: "chevron.right").font(.largeTitle).foregroundColor(.white).padding(24)
                    }
                }
                
            Spacer()
            }
        }
        .navigationBarHidden(true)
        
        
    }
}

struct Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_2()
    }
}
