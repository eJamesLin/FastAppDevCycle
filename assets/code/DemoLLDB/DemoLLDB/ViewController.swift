//
//  ViewController.swift
//  DemoLLDB
//
//  Created by cjlin on 2019/9/19.
//  Copyright © 2019 cjlin. All rights reserved.
//

import UIKit

// MARK: - Example 1
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

    var sessions: [SessionInfo]?
    @IBAction func didTapDownload(_ sender: Any) {
        //TODO: fetch session titles with view model
    }
}

// MARK: - Example 2

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


// MARK: - Example 3

struct SessionResponse: Codable {
    let sessions: [SessionInfo]
}

struct SessionInfo: Codable {
    let title: String
    let presenter: String
}

// Execute at LLDB
// e $ViewModel().download { self.sessions = $0 }
// v self.sessions

// Add at LLDB
/*
import Foundation
class $ViewModel {
    let url = URL(string: "https://raw.githubusercontent.com/iplayground/SessionData/master/sessions.json")!
    func download(completion: @escaping ([SessionInfo]) -> Void) {
        let rl = CFRunLoopGetCurrent() // async task in lldb, remove later
        URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, response, error in
                let response = try! JSONDecoder().decode(SessionResponse.self, from: data!)
                completion(response.sessions)
                CFRunLoopStop(rl)
        }).resume()
        CFRunLoopRun()
    }
}
*/
