//
//  ServiceLayer.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 02.06.2022.
//

import Foundation
import WebKit
///Метод, отвечающий за составление и отправку URL запроса на сервер для получения новостной ленты пользователя.
func loadNewsfeed() {
    ///Переменная-конструктор, содержащая URL адрес запроса.
    var urlConstructor = URLComponents()
    urlConstructor.scheme = "http"
    urlConstructor.host = "api.vk.com"
    urlConstructor.path = "/method/newsfeed.get"
    urlConstructor.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "filters", value: "post, photo"),
        URLQueryItem(name: "max_photos", value: "1"),
        URLQueryItem(name: "v", value: "5.131")
    ]
    guard let url = urlConstructor.url else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        guard let data = data, error == nil else { return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print(json)
        } catch {
            print(error)
        }
    }.resume()
}
