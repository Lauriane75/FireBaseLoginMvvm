//
//  LoginViewModel.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class {
    func goToSignupScreen()
    func goToHomeScreen()
}

final class LoginViewModel {

    // MARK: - Properties

    private let repository: RepositoryType

    private weak var delegate: LoginViewModelDelegate?


    // MARK: - Initializer

    init(repository: RepositoryType, delegate: LoginViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var loginButtonText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        loginButtonText?("Login")
    }

    func viewWillAppear() {
    }

    func didPressSigninButton() {
        delegate?.goToSignupScreen()
    }

    func didPressLoginButton() {
        delegate?.goToHomeScreen()
    }

    func validateTheFields(email: String, password: String) -> String? {
        guard email != "" || password != "" else {
            return "Please fill in all fields"
        }
//        if email == "" || password == "" {
//            return "Please fill in all fields"
//        }
        return nil
    }

    // MARK: - Private Functions


}
