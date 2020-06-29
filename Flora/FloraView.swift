//
//  FloraView.swift
//  Flora
//
//  Created by Rom Dr on 29.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

struct FloraView: View {
    @ObservedObject var apiClient: ApiClient
    
    var body: some View {        
        VStack {
            List(self.apiClient.records) { e in
                Text(e.name)
            }
        }
    }
}

struct FloraView_Previews: PreviewProvider {
    static var previews: some View {
        FloraView(apiClient: ApiClient())
    }
}
