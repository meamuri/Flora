//
//  FloraRouter.swift
//  Flora
//
//  Created by Rom Dr on 29.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import Combine
import SwiftUI

class FloraRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<FloraRouter, Never>()
    var currentPage = FloraPages.login {
        didSet {
            objectWillChange.send(self)
        }
    }
}

enum FloraPages {
    case login
    case table
}
