//
//  SignupViewController.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Properties

    var viewModel: SignupViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

    // MARK: - View actions


    // MARK: - Private Functions

    private func bind(to viewModel: SignupViewModel) {
//        viewModel.signupButtonText = { [weak self] text in
//            guard let self = self else { return }
//            self.appNameLabel.text = text
//        }
    }


    


}
