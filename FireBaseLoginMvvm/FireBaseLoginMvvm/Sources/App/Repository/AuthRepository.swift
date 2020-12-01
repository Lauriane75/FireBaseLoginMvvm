//
//  Repository.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData
import FirebaseAuth
import FirebaseUI

protocol AuthRepositoryType: class {
    func logIn(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
    func register(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
    func getCurrentUser() -> String
    func logOut(completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void))
    func saveUser(firstName: String, lastName: String, result: AuthDataResult?, completion: @escaping((_ error: Error?) -> Void))
}

final class AuthRepository: AuthRepositoryType {

    // MARK: - Properties

    private let token = Token()
    private let context: Context

    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }

    func logIn(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }

    func register(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(authResult, error)
        }
    }

    func getCurrentUser() -> String {
        return Auth.auth().currentUser?.email ?? ""
    }

    func logOut(completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void)){
        do {
            try Auth.auth().signOut()
            completion()
        } catch {
            failure(error.localizedDescription)
        }
    }

    func saveUser(firstName: String, lastName: String, result: AuthDataResult?, completion: @escaping((_ error: Error?) -> Void))  {
        let dataBase = Firestore.firestore()
        dataBase.collection("users").addDocument(data: [
            "first-name": firstName,
            "last-name": lastName,
            "uid":  result!.user.uid
        ]) { (Error) in
            completion(Error)
        }
    }

}
