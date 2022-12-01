//
//  Onboarding_1.swift
//  GalleryApp
//
//  Created by Leonard McCook-Carr on 11/29/22.
//

import SwiftUI

struct Onboarding_1: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
            Spacer()
                Text("Thank you for joining.").foregroundColor(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
            Spacer()
                Button(action:{
                    
                }){
                    Image(systemName: "chevron.right").font(.largeTitle).foregroundColor(.white).padding(24)
                }
            Spacer()
            }
        }
    }
}

struct Onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_1()
    }
}
