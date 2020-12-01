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
    func goToHomeScreen(userItem: UserItem)
}

final class LoginViewModel {

    // MARK: - Properties

    private let repository: AuthRepositoryType

    private weak var delegate: LoginViewModelDelegate?


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: LoginViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var loginButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        loginButtonText?("Login")
    }

    func viewWillAppear() {
    }

    func didPressSignupButton() {
        delegate?.goToSignupScreen()
    }

    func didPressLoginButton(email: String, password: String) {
        let error = self.validateTheFields(email: email, password: password)
        guard error == nil else {
            self.errorLabelText?(error!)
            self.errorLabelAlpha?(1)
            return
        }
        repository.logIn(email: email, password: password) { (result, Error) in
            guard Error == nil else {
                self.errorLabelText?(Error!.localizedDescription)
                self.errorLabelAlpha?(1)
                return
            }
            let userItem = UserItem(uid: 1, firstName: "test", lastName: "test", password: "test")
            self.delegate?.goToHomeScreen(userItem: userItem)
        }
    }

    // MARK: - Private Functions

    func validateTheFields(email: String, password: String) -> String? {
        guard email != "" && password != "" else {
            return "Please fill in all fields"
        }
        return nil
    }

}
