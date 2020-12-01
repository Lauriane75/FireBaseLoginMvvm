//
//  Screens.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class Screens {

    let storyboard = UIStoryboard(name: "Main",
                                  bundle: Bundle(for: Screens.self))

    private let context: Context

    init(context: Context) {
        self.context = context
    }
}

// MARK: - Login

extension Screens {
    func createLoginViewController(delegate: LoginViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "LoginViewController") as! LoginViewController
        let repository = AuthRepository(context: context)
        let viewModel = LoginViewModel(repository: repository,
                                       delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}


// MARK: - Signup

extension Screens {
    func createSignupViewController(delegate: SignupViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "SignupViewController") as! SignupViewController
        let repository = AuthRepository(context: context)
        let viewModel = SignupViewModel(repository: repository,
                                       delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Home

extension Screens {
    func createHomeViewController(delegate: HomeViewModelDelegate?, userItem: UserItem) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "HomeViewController") as! HomeViewController
        let repository = AuthRepository(context: context)
        let viewModel = HomeViewModel(repository: repository,
                                      delegate: delegate, userItem: userItem)
        viewController.viewModel = viewModel
        return viewController
    }
}
