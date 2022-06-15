//
//  LoadPhotos.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 06.06.2022.
//

import Foundation
import WebKit

/// Метод, отвечающий за составление и отправку URL запроса на сервер для получения фотографий определенного пользователя.
/// - Parameter userId: Параметр, указывающий фотографии какого пользователя мы хотим получить.
func loadPhotos(forUser userId: Int) {
    ///Переменная-конструктор, содержащая URL адрес запроса.
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.vk.com"
    urlComponents.path = "/method/photos.getAll"
    urlComponents.queryItems = [
        URLQueryItem(name: "access_token", value: Session.instance.token),
        URLQueryItem(name: "owner_id", value: String(userId)),
        URLQueryItem(name: "extended", value: "1"),
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
