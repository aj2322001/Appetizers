//
//  Alert.swift
//  Appetizers
//
//  Created by Archit  Joshi on 15/02/26.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    static func getAlertItem(err: APError) -> AlertItem {
        var titleString: String = ""
        var messageString: String = ""
        var dismissBtnString: String = ""
        switch err {
        case .invalidData:
            titleString = "Server Error"
            messageString = "The data recieved from server was invalid. Please contact support."
            dismissBtnString = "Ok"
            break
        case .invalidURL:
            titleString = "Server Error"
            messageString = "invalid response from server. Please try again later or contact support."
            dismissBtnString = "Ok"
            break
        case .invalidResponse:
            titleString = "Server Error"
            messageString = "There was an issue connecting to the server. If this persists, please contact support."
            dismissBtnString = "Ok"
            break
        case .unableToComplete:
            titleString = "Server Error"
            messageString = "Unable to complete your request at this time. Please check your internet connection."
            dismissBtnString = "Ok"
            break
        case .invalidForm:
            titleString = "Invalid Form"
            messageString = "please ensure all fields in the form have been filled out."
            dismissBtnString = "Ok"
        case .invalidEmail:
            titleString = "Invalid Email"
            messageString = "please ensure a your email is correct."
            dismissBtnString = "Ok"
        case .userSaveSuccess:
            titleString = "Profile Saved"
            messageString = "Your profile info was sucessfully saved"
            dismissBtnString = "Ok"
        case .invalidUserData:
            titleString = "Profile Error"
            messageString = "There was an error saving or retrieving your profile"
            dismissBtnString = "Ok"
        }
        return AlertItem(title: Text(titleString),
                         message: Text(messageString),
                         dismissButton: .default(Text(dismissBtnString)))
    }
}
