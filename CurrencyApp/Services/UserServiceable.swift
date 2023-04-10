//
//  UserServiceable.swift
//  CurrencyApp
//
//  Created by developer_tmp on 06.04.2023.
//

import Foundation

protocol UserServiceable {
    func signIn(user: User, password: String, onSuccess: @escaping(_ user: User?) -> Void, onError: @escaping (_ errorMessage: String) -> Void)

    func logIn(email: String, password: String, onSuccess: @escaping(_ user: User?) -> Void, onError: @escaping (_ errorMessage: String) -> Void)
    
    func signOut()
    
    func sendPasswordReset(withEmail email: String, callback: ((Error?) -> ())?)
    
    func deleteAccount()
    
    func getUser() -> User?
    
    func getState() -> UserState?
    
    func updateUser(with user: User)
    
    func updateState(with state: UserState)
}
