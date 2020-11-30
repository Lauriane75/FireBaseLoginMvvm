//
//  Context.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

final class Context {

    let client: HTTPClientType
    let firebase: Firebase

    init(client: HTTPClientType, firebase: Firebase) {
        self.client = client
        self.firebase = firebase
    }
}
