//
//  SceneDelegate.swift
//  smsAuth
//
//  Created by Kirill Drozdov on 08.03.2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)

    if Auth.auth().currentUser == nil {
      let vc = PhoneViewController()
      vc.title = "Sign in"
      let navVc = UINavigationController(rootViewController: vc)
      window.rootViewController = navVc
    }else{
      window.rootViewController = AccountViewController()
    }
    window.makeKeyAndVisible()
    self.window = window
  }

  func sceneDidDisconnect(_ scene: UIScene) {
  }
  func sceneDidBecomeActive(_ scene: UIScene) {
  }
  func sceneWillResignActive(_ scene: UIScene) {
  }
  func sceneWillEnterForeground(_ scene: UIScene) {
  }
  func sceneDidEnterBackground(_ scene: UIScene) {
  }
}

