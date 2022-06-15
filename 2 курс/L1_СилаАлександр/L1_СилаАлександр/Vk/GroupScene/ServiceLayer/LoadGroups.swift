//
//  LoadGroups.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 03.06.2022.
//

import Foundation
import WebKit
///Метод, отвечающий за составление и отправку URL запроса на сервер для получения списка групп пользователя.
func loadGroups() {
    ///Переменная-конструктор, содержащая URL адрес запроса.
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.vk.com"
    urlComponents.path = "/method/groups.get"
    urlComponents.queryItems = [
        URLQueryItem(name: "user_id", value: String(Session.instance.userId!)),
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "v", value: "5.131")
    ]
    guard let url = urlComponents.url else { return }
    
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

/// Метод, отвечающий за составление и отправку URL запроса на сервер для получения списка групп по поисковому запросу.
/// - Parameter searchText: Параметр, передающий поисковый запрос.
func loadSearchGroups(_ searchText: String) {
    ///Переменная-конструктор, содержащая URL адрес запроса.
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.vk.com"
    urlComponents.path = "/method/groups.search"
    urlComponents.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "q", value: searchText),
        URLQueryItem(name: "type", value: "group"),
        URLQueryItem(name: "count", value: "20"),
        URLQueryItem(name: "v", value: "5.131")
    ]
    guard let url = urlComponents.url else { return }
    
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
