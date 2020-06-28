//
//  ContentView.swift
//  Flora
//
//  Created by Rom Dr on 28.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView: View {
    var body: some View {
        VStack {
            WelcomeLabel()
            Image("flora_app_welcome")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeLabel: View {
    var body: some View {
        Text("Flora application login")
            .fontWeight(.semibold)
            .font(.largeTitle)
            .padding(.bottom, 20)
    }
}
