//
//  Session.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 30.05.2022.
//

import Foundation

/// Паттерн Singleton для записи Id пользователя и token'а при авторизации
final class Session {
    ///Статическая переменная, которая позволяет получать доступ к единственному экземпляру класса
    static let instance = Session()
    
    private init() {}
    ///Id пользователя
    var userId: Int?
    ///ключ, получаемый при авторизации, дает право доступа к определенным данным
    var token: String?
    
}
