//
//  APIClient.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/3/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation
import Alamofire

enum URLConstants: String {
    case allCards = "/api/cards"
    case imageOfCard = "/images/cards/"
}

func returnUrl(path: String) -> URL {
    
    let baseUrl = Bundle.main.infoDictionary?[TextsApps.baseURL.rawValue] as! String
    return try! baseUrl.asURL()
}

enum APIRouter: URLRequestConvertible {
    
    case getAllCards
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getAllCards:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getAllCards:
            return URLConstants.allCards.rawValue
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url: URL
        var urlRequest: URLRequest
        
        url = returnUrl(path: path)
        
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}

class APIClient {
    
    static func validateConnectInternet() -> Bool {
        if let network = NetworkReachabilityManager() {
            return network.isReachable
        }
        return false
    }
    
    static func downloadPhoto(idName: String, completion: @escaping(Data?)-> Void) {
        let baseUrl = Bundle.main.infoDictionary?[TextsApps.baseURL.rawValue] as! String
        let urlString = baseUrl + URLConstants.imageOfCard.rawValue + idName + TextsApps.png.rawValue
        AF.request(urlString)
            .response { (defaultDataResponse) -> Void in
                if let imageData = defaultDataResponse.data {
                    completion(imageData)
                } else {
                    completion(nil)
                }
        }
    }
    
    static func getAllCards(completion: @escaping ([CardDecodable]?)->Void) {
        AF.request(APIRouter.getAllCards as URLRequestConvertible)
            .logRequest()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let json = response.value,
                        let data = response.data {
                        print("Success JSON: \(json)")
                        do {
                            let listOfCards = try JSONDecoder().decode([CardDecodable].self, from: data)
                            completion(listOfCards)
                        } catch {
                            print("Error with Decodable: \(error)")
                            completion(nil)
                        }
                    }
                case .failure(let error):
                    print("Error \(error)")
                    completion(nil)
                }
        }
    }
}

extension DataRequest {
    public func logRequest() -> Self {
        self.responseData { response in
            print(self.debugDescription)
        }
        return self
    }
}
