//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/8/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .invalidUsername:
            return NSLocalizedString("This username created an invalid request. Please try again.", comment: "Invalid Username")
        case .unableToComplete:
            return NSLocalizedString("Unable to complete your request. Please check your internet connection", comment: "Internet Connection Error")
        case .invalidResponse:
            return NSLocalizedString("Invalid response from the server. Please try again", comment: "Invalid Server Response")
        case .invalidData:
            return NSLocalizedString("The data received from the server was invalid. Please try again", comment: "Invalid Data")
        }
    }
}
