//
//  HomeViewModel.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {

}

final class HomeViewModel {

    // MARK: - Properties

    private let repository: HomeRepositoryType

    private weak var delegate: HomeViewModelDelegate?


    // MARK: - Initializer

    init(repository: HomeRepositoryType, delegate: HomeViewModelDelegate?) {
          self.repository = repository
          self.delegate = delegate
      }

    // MARK: - Output

    var welcomeLabelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        welcomeLabelText?("Welcome")
    }

    func viewWillAppear() {
    }

}
