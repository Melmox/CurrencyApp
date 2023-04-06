//
//  FirebaseManager.swift
//  CurrencyApp
//
//  Created by developer_tmp on 03.04.2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

final class FirebaseManager {
    
    // MARK: - Configure
    func configure() {
        FirebaseApp.configure()
    }
    
    // MARK: - Save Photo
    
    func savePhoto(email: String, uid: String, profileImage: Data, metadata: StorageMetadata, storageProfileRef: StorageReference, userModelDictionary: Dictionary<String, Any>, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        storageProfileRef.putData(profileImage, metadata: metadata , completion: {
            (storageMetaData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL(completion: { (url, error) in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = email
                        changeRequest.commitChanges(completion: { (error) in
                            if let error = error {
                                onError(error.localizedDescription)
                            }
                        })
                    }
                    var tempDictionary = userModelDictionary
                    
                    tempDictionary["profileImageUrl"] = metaImageUrl
                    Database.database().reference().child("users")
                        .child(uid).updateChildValues(tempDictionary, withCompletionBlock: {
                            (error, ref) in
                            if error == nil {
                                onSuccess()
                            }
                            else {
                                onError(error!.localizedDescription)
                            }
                        })
                }
            })
        })
    }
    
    // MARK: - Create account
    
    func createAccount(user: User, password: String, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        let email = user.email
        let password = password
        let name = user.name
        let profileImage = user.profilePhoto
        Auth.auth().createUser(withEmail: email, password: password) {(authDataResult, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                let userModelDictionary: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email ?? "",
                    "name": name,
                    "profileImageUrl": ""
                ]
                let storageRef = Storage.storage().reference(forURL: "gs://currencyapp-2258a.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                let metadata = StorageMetadata()
                metadata.contentType = "image/png"
                if let profileImage = profileImage {
                    self.savePhoto(email: email, uid: authData.user.uid, profileImage: profileImage, metadata: metadata, storageProfileRef: storageProfileRef, userModelDictionary: userModelDictionary, onSuccess: {
                        onSuccess()
                    }, onError: { (errorMessage) in
                        onError(errorMessage)
                    })
                }
            }
        }
    }
    
    // MARK: - Log in into account
    
    func logIn(email: String, password: String, onSuccess: @escaping(_ authDataResult: AuthDataResult) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password){ (authDataResult, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            if authDataResult != nil {
                onSuccess(authDataResult!)
            }
        }
    }
    
    // MARK: - Log out from current account
    
    func signOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            
        }
    }
    
    // MARK: - Reset the password
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    // MARK: - Delete account
    
    func deleteAccount() {
        let user = Auth.auth().currentUser
        user?.delete { error in
            if error == nil {
                self.signOut()
            }
        }
    }
}
