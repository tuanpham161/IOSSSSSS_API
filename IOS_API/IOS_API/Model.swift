//
//  Model.swift
//  IOS_API
//
//  Created by tuan.anhpham on 9/1/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import Foundation

struct PersonData: Codable {
    var data: [Person]
}
struct Person: Codable {
    let userName: String
    let image: String
    let location: String
    let age: Int
    let gender: String
}
