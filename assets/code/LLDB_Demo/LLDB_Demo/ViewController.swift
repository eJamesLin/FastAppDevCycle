//
//  ViewController.swift
//  LLDB_Demo
//
//  Created by JJ Lin on 2019/9/19.
//  Copyright © 2019 CJ Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    var fibonacci: [Int] = []

    @IBAction func didTapFibonacci(_ sender: Any) {
        fibonacci = getFibonacci()
        print(fibonacci)
    }

    // wrong
    func getFibonacci() -> [Int] {
        return [0, 1, 1, 2, 3, 5, 7]
    }

    // correct
    /*
    func getFibonacci1() -> [Int] {
        return [0, 1, 1, 2, 3, 5, 8]
    }
     */

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
