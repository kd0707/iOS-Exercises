//
//  ApiHandler.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 17/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
typealias JSON = [String: Any]
enum ServiceError: Error {
    case noInternetConnection
    case customError(String)
    case other
}


extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .customError( _):
            return "Error will be fixed soon"
        }
    }
}


extension ServiceError {
    init(json: JSON) {
        if let message =  json["status_message"] as? String {
            self = .customError(message)
        } else {
            self = .other
        }
    }
}


class  ApiHandler {
    
    class func dataFromApi(urlString: String, completion: @escaping ((Any?, Error?)->())){
        guard let url = URL(string: urlString) else{
            debugPrint("unable to connect: wrong url or API Path");
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let sessionTask = session.dataTask(with: request) { (responseData, response, err) in
            var object: Any? = nil
            if let data = responseData {
                object = try? JSONSerialization.jsonObject(with: data, options: [])
            }
            if let httpResponse = response as? HTTPURLResponse, (200...300) ~= httpResponse.statusCode {
                completion(object, nil)
            }else{
                let error = (object as? JSON).flatMap(ServiceError.init) ??
                    ServiceError.other
                completion(nil, error)
                
            }
            
        }
        sessionTask.resume()
    }
}
