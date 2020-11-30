//
//  Firebase.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import FirebaseAuth
import FirebaseUI

final class Firebase {

    var signUpResult: AuthDataResult? = nil

    struct Authentification {
        static let auth = Auth.auth()
    }

    struct FireStore {
        static let dataBase = Firestore.firestore()
    }

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in

        }
    }

    func signup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            self.signUpResult = result
        }
    }

    func saveUser(data: User, firstName: String, lastName: String ) {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: ["first-name": firstName, "last-name": lastName, "uid": signUpResult!.user.uid]) { (error) in
        }
    }
}
