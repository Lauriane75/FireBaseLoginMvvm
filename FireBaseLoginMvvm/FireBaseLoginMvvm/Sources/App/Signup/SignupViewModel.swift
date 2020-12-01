//
//  SignupViewModel.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SignupViewModelDelegate: class {
    func goToHomeScreen(userItem: UserItem)
}

final class SignupViewModel {

    // MARK: - Properties

    private let repository: AuthRepositoryType

    private weak var delegate: SignupViewModelDelegate?


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: SignupViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var signupButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?


    // MARK: - Input

    func viewDidLoad() {
        signupButtonText?("Sign up")
        print("viewDidLoad Signup")
    }

    func viewWillAppear() {
        print("viewWillAppear Signup")
    }

    func didPressSignupButton(firstName: String, lastName: String, email: String, password: String) {
        let error = self.validateTheFields(firstName: firstName, lastName: lastName, email: email, password: password)
        guard error == nil else {
            errorLabelText?(error!)
            errorLabelAlpha?(1)
            return
        }
        errorLabelAlpha?(0)
        repository.register(email: email, password: password) { (result, error) in
            guard error == nil else {
                self.errorLabelText?("Error creating user")
                self.errorLabelAlpha?(1)
                return
            }
            self.errorLabelAlpha?(0)
            self.repository.saveUser(firstName: firstName, lastName: lastName, result: result) { (Error) in
                guard Error == nil else {
                    self.errorLabelText?("We could't register your account for some reason, please try again")
                    return
                }
            }
            let userItem = UserItem(uid: 1, firstName: "test2", lastName: "test", password: "test")
            self.delegate?.goToHomeScreen(userItem: userItem)
        }
    }

    private func validateTheFields(firstName: String, lastName: String, email: String, password: String) -> String? {
        guard firstName != "" && lastName != "" && email != "" && password != "" else {
            return "Please fill in all fields"
        }
        guard Utilities.isPasswordValid(password) == true else {
            // Password isn't secure enough
            return "Please make sure your passeword is at least 8 characters and contains a special character and numbers"
        }
        return nil
    }
}
