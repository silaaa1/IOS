//
//  WKLoginViewController.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 31.05.2022.
//

import UIKit
import WebKit

/// Сцена авторизации пользователя, реализованная через WKWebView.
final class WKLoginViewController: UIViewController {
    ///Экземпляр класса WKWebView, связанный с Storyboard.
    @IBOutlet weak var webView1: WKWebView! {
        didSet {
            webView1.navigationDelegate = self
        }
    }
    
    // MARK: Жизненный цикл
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadAuth()
        }
}

// MARK: Расширения
private extension WKLoginViewController {
    ///Метод, отвечающий за составление и отправку URL запроса для авторизации на сервер.
    func loadAuth() {
        ///Переменная-конструктор, содержащая URL адрес запроса.
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8181532"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups, wall"),
            URLQueryItem(name: "revoke", value: "0"),
            URLQueryItem(name: "response_type", value: "token")
        ]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        webView1.load(request)
    }
}

extension WKLoginViewController: WKNavigationDelegate {
    ///Метод, принимающий ответ с сервера и в зависимости от него осуществляет дальнейший переход. Также в методе обрабатывается ответ и передаются token и userId в Session.
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"], let userId = params["user_id"] {
            Session.instance.token = token
            Session.instance.userId = Int(userId)
            print(token)
            print(userId)
            decisionHandler(.cancel)
            performSegue(withIdentifier: "login", sender: self)
        }
    }
}
