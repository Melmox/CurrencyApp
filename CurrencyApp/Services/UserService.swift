//
//  UserService.swift
//  CurrencyApp
//
//  Created by developer_tmp on 06.04.2023.
//

import Foundation

enum UserState {
    case notLogined, logined
}

final class UserService : UserServiceable {
    
    // MARK: - Properties
    // MARK: Content
    
    private var user: User?
    private var state: UserState?
    private let firebaseManager = FirebaseManager()
    
    // MARK: - Methods
    
    func signIn(user: User, password: String, onSuccess: @escaping (User?) -> Void, onError: @escaping (String) -> Void) {
        firebaseManager.createAccount(user: user, password: password) {
            self.user = User(name: user.name, email: user.email, profilePhoto: user.profilePhoto)
            onSuccess(self.user)
            self.state = .logined
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }
    
    func logIn(email: String, password: String, onSuccess: @escaping (User?) -> Void, onError: @escaping (String) -> Void) {
        firebaseManager.logIn(email: email, password: password) { authDataResult in
            if let name =  authDataResult.user.displayName,
               let email = authDataResult.user.email,
               let profilePhotoURL = authDataResult.user.photoURL {
                self.user = User(name: name, email: email, profilePhotoURL: profilePhotoURL)
                onSuccess(self.user)
                self.state = .logined
            }
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }
    
    func signOut(){
        firebaseManager.signOut()
        state = .notLogined
    }
    
    func sendPasswordReset(withEmail email: String, callback: ((Error?) -> ())?) {
        firebaseManager.sendPasswordReset(withEmail: email){ error in
            callback?(error)
        }
    }
    
    func deleteAccount() {
        firebaseManager.deleteAccount()
        state = .notLogined
    }
    
    func updateUser(with user: User) {
        self.user = user
    }
    
    func updateState(with state: UserState) {
        self.state = state
    }
    
    func getUser() -> User? {
        user
    }
    
    func getState() -> UserState? {
        state
    }
}
