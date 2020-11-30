//
//  LoginCoordinator.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class LoginCoordinator {

    // MARK: - Properties

    private let presenter: UIWindow

    private let navigationController: UINavigationController

    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.screens = Screens(context: context)
        navigationController = UINavigationController()
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = navigationController
        showLoginScreen()
    }

    private func showLoginScreen() {
        let viewController = screens.createLoginViewController(delegate: self)
        navigationController.viewControllers = [viewController]
    }

    private func showSignupView() {
        let viewController = screens.createSignupViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showHomeView() {
           let viewController = screens.createHomeViewController(delegate: self)
           navigationController.pushViewController(viewController, animated: false)
       }

}

extension LoginCoordinator: LoginViewModelDelegate {
    func goToHomeScreen() {
        showHomeView()
    }

    func goToSignupScreen() {
        showSignupView()
    }
}

extension LoginCoordinator: SignupViewModelDelegate {

}

extension LoginCoordinator: HomeViewModelDelegate {

}

