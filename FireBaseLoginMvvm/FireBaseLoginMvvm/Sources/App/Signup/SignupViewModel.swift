//
//  SignupViewModel.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SignupViewModelDelegate: class {

}

final class SignupViewModel {

    // MARK: - Properties

    private let repository: RepositoryType

    private weak var delegate: SignupViewModelDelegate?


    // MARK: - Initializer

    init(repository: RepositoryType, delegate: SignupViewModelDelegate?) {
          self.repository = repository
          self.delegate = delegate
      }

    // MARK: - Output

    var signupButtonText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        signupButtonText?("Sign up")
        print("viewDidLoad Signup")
    }

    func viewWillAppear() {
        print("viewWillAppear Signup")
    }

}
