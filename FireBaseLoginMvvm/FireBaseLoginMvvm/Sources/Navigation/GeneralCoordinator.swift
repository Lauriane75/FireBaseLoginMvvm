//
//  GeneralCoordinator.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class GeneralCoordinator {

    // MARK: - Properties

    private var presenter: UIWindow

    private let context: Context

    private var loginCoordinator: LoginCoordinator?

    // MARK: - Initializer

    init(presenter: UIWindow, context: Context) {
        self.presenter = presenter
        self.context = context
    }
}

// MARK: - CoordinatorProtocol

extension GeneralCoordinator {

    // MARK: - Start

    func start() {
        presenter.rootViewController = UIViewController()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        showLogin()
    }

    // MARK: - Create viewControllers

    private func showLogin() {
        loginCoordinator = LoginCoordinator(presenter: presenter, context: context)
        loginCoordinator?.start()
    }
}


