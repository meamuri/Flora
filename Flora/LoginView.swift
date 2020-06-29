//
//  ContentView.swift
//  Flora
//
//  Created by Rom Dr on 28.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var httpAuthManager: HttpAuth
    @ObservedObject var floraRouter: FloraRouter
    var body: some View {
        VStack {
            WelcomeLabel()
            UserImage()
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20.0)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20.0)
            Button(action: loginHandler) {
                LoginButtonContent()
            }
        }
        .padding()
    }
    
    private func loginHandler() -> Void {
        self.httpAuthManager.postAuth(username: self.username, password: self.password)
        floraRouter.currentPage = .table
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(httpAuthManager: HttpAuth(), floraRouter: FloraRouter())
    }
}

struct WelcomeLabel: View {
    var body: some View {
        Text("Flora кадастр")
            .fontWeight(.semibold)
            .font(.largeTitle)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("flora_app_welcome")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Войти")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
