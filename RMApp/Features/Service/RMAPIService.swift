//
//  RMAPIService.swift
//  RMApp
//
//  Created by macbook pro on 14.04.2023.
//
import Alamofire

enum RMServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRMAPIService {
    func fetchData(completion: @escaping ([Character]?) -> Void)
}

struct RMAPIService: IRMAPIService {
    
    func fetchData(completion: @escaping ([Character]?) -> Void) {
        AF.request(RMServiceEndPoint.characterPath()).responseDecodable(of: Result.self) { model in
            guard let data = model.value else {
                completion(nil)
                return }
            
            completion(data.results)
        }
    }
}
