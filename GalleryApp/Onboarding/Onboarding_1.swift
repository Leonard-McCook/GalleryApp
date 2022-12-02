//
//  Onboarding_1.swift
//  GalleryApp
//
//  Created by Leonard McCook-Carr on 11/29/22.
//

import SwiftUI

struct Onboarding_1: View {
    @State var isActive:Bool = false
    
    var body: some View {
        NavigationView{
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
            Spacer()
                Text("Thank you for   joining").foregroundColor(.white).font(.title).multilineTextAlignment(.center)
                
            Spacer()
                NavigationLink(destination:Onboarding_2(),isActive:$isActive){
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
}

struct Onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_1()
    }
}
