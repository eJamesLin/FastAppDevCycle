//
//  ViewController.swift
//  DemoLLDB
//
//  Created by cjlin on 2019/9/19.
//  Copyright © 2019 cjlin. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {

    var isLoggedIn = false

    @IBAction func didTapButton(_ sender: Any) {
        if isLoggedIn {
            someAction()
        } else {
            requireLogin()
        }
    }

    func requireLogin() {
        print(#function)
    }

    func someAction() {
        print(#function)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    var fibonacci: [Int] = []

    @IBAction func didTapFibonacci(_ sender: Any) {
        fibonacci = FibonacciManager.shared.fibonacci()
        print(fibonacci)
    }
}

public class FibonacciManager {
    public static let shared = FibonacciManager()
    public func fibonacci() -> [Int] {
        return [0, 1, 1, 2, 3, 5, 7] // wrong
    }
}

/*
// Add this into REPL
extension FibonacciManager {
    func correctFibonacci() -> [Int] {
        return [0, 1, 1, 2, 3, 5, 8] // correct
    }
}
 */
