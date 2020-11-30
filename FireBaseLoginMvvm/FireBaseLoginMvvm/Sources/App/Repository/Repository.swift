//
//  Repository.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData

protocol RepositoryType: class {

}

final class Repository: RepositoryType {

    // MARK: - Properties

    private let token = Token()
    private let context: Context

    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }

}