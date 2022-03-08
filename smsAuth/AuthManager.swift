//
//  AuthManager.swift
//  smsAuth
//
//  Created by Kirill Drozdov on 08.03.2022.
//

import Foundation
import FirebaseAuth

class AuthManager {
  static let shared = AuthManager()

  private let auth = Auth.auth()

  private var verificationId: String?

  public func startAuth(phoneNumber: String, comletion: @escaping(Bool)->Void){
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verifactionId, error in
      guard let verificationId = verifactionId, error == nil else {
        comletion(false)
        return
      }
      self?.verificationId = verifactionId
      comletion(true)
    }
  }

  public func verifAuth(smsCode: String, comletion: @escaping(Bool)->Void){
    guard let verificationId = verificationId else {
      comletion(false)
      return
    }

    let credenital = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: smsCode)

    auth.signIn(with: credenital) { result, error in
      guard result != nil, error == nil else {
        comletion(false)
        return
      }
      comletion(true)
    }
  }


}
