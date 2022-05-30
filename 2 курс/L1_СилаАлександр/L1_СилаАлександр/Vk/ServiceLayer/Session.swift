//
//  Session.swift
//  VKproject_СилаАлександр
//
//  Created by Александр Сила on 30.05.2022.
//

import Foundation

final class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var userId: Int?
    var token: String?
    
}
