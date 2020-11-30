//
//  ViewController.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    // MARK: - Properties

    var viewModel: LoginViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()

        
        bind(to: viewModel!)

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: LoginViewModel) {
        viewModel.loginButtonText = { [weak self] text in
            guard let self = self else { return }
            self.loginButton.setTitle(text, for: .normal)
        }
    }

    private func setUpElements() {
        errorLabel.alpha = 0
        Custom.styleTextField(emailTextField, backgroundColor: UIColor.orange.cgColor)
        Custom.styleTextField(emailTextField, backgroundColor: UIColor.orange.cgColor)
        Custom.styleButton(signupButton, backgroundColor: UIColor.orange, tintColor: UIColor.white)
        Custom.styleButton(loginButton, backgroundColor: UIColor.green, tintColor: UIColor.white)
    }

    // MARK: - View actions

    @IBAction func didPressLoginButton(_ sender: Any) {
        viewModel.didPressLoginButton()
    }

    @IBAction func didPressSigninButton(_ sender: Any) {
        viewModel.didPressSigninButton()
    }

}

