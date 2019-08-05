//
//  TextsApps.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

enum TextsApps: String {
    
    //MARK: initial view
    case titleInitial = "Clash of Clans Preview"
    case listCards = "List of cards"
    
    //MARK: alerts
    case cancel = "Cancel"
    case accept = "Accept"
    
    //MARK: constants
    case baseURL = "Base Url"
    case png = ".png"
    
    //MARK: errors
    case withoutInternetTitle = "Without connection"
    case withoutInternetMessage = "Please, review your connection to internet"
    case errorWithDownloadTitle = "Something wrong happened"
    case errorWithDownloadMessage = "Your request cann't be processed, try again"
    
    //MARK: objects in the app
    case progressView = "ProgressView"
    case cardCell = "CardCell"
    case identifierCardCell = "cardCell"
}
