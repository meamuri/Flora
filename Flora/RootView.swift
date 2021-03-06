//
//  Rootview.swift
//  Flora
//
//  Created by Rom Dr on 29.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var floraRouter: FloraRouter
    @ObservedObject var httpAuthManager: HttpAuth
    var body: some View {
        VStack {
            if floraRouter.currentPage == .login {
                LoginView(httpAuthManager: httpAuthManager, floraRouter: floraRouter)
            } else if floraRouter.currentPage == .table {
                FloraView(apiClient: ApiClient())
            }
        }
    }
}

struct Rootview_Previews: PreviewProvider {
    static var previews: some View {
        RootView(floraRouter: FloraRouter(), httpAuthManager: HttpAuth())
    }
}
