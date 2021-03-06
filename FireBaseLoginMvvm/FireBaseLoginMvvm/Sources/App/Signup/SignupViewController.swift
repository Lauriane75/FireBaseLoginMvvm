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

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    // MARK: - Properties

    var viewModel: SignupViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: SignupViewModel) {
        viewModel.signupButtonText = { [weak self] text in
            guard let self = self else { return }
            self.signupButton.setTitle(text, for: .normal)
        }
        viewModel.errorLabelText = { [weak self] text in
            guard let self = self else { return }
            self.errorLabel.text = text
        }
        viewModel.errorLabelAlpha = { [weak self] alpha in
            guard let self = self else { return }
            self.errorLabel.alpha = CGFloat(alpha)
        }
    }

    private func setUpElements() {
        errorLabel.alpha = 0
        Custom.styleTextField(firstNameTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleTextField(lastNameTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleTextField(emailTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleTextField(passwordTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleButton(signupButton, backgroundColor: UIColor.green, tintColor: UIColor.white)
    }

    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    // MARK: - View actions

    @IBAction func didPressSignupButton(_ sender: Any) {
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        viewModel.didPressSignupButton(firstName: firstName, lastName: lastName, email: email, password: password)
    }
}
