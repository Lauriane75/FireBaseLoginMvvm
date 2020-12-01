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

    private let repository: AuthRepositoryType

    private weak var delegate: HomeViewModelDelegate?

    private var userItem: UserItem


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: HomeViewModelDelegate?, userItem: UserItem) {
          self.repository = repository
          self.delegate = delegate
          self.userItem = userItem
      }

    // MARK: - Output

    var welcomeLabelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        welcomeLabelText?("Welcome \(userItem.firstName)")
    }

    func viewWillAppear() {
    }

    func didPressLogoutButton() {


        
    }

    // MARK: - Private Functions


}
