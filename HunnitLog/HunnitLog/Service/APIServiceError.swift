//
//  APIServiceError.swift
//  simpleMVVM
//
//  Created by seungwook.jung on 2020/11/07.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
