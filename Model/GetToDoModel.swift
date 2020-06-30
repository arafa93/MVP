//
//  GetToDoModel.swift
//  Zoom-MVP
//
//  Created by Mohamed Arafa on 6/30/20.
//  Copyright © 2020 SolxFy. All rights reserved.
//

import Foundation

// MARK: - GetToDoElement
struct GetToDo: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
