//
//  Supercarrequest.swift
//  carAPI
//
//  Created by Red Nguyen on 10/2/21.
//

import Foundation

struct supercarRequest {
    let resourceURL: URL
    
    init(){
        let resource = "http://127.0.0.1:3000/root"
        guard let link = URL(string: resource) else {fatalError()}
        self.resourceURL = link
    }
    
    func getSuperCar(completion: @escaping (Result<[carModel], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                return
            }
            do{
                print(jsonData)
                let decoder = JSONDecoder()
                let carResponse = try decoder.decode(superCarModel.self, from: jsonData)
                let carModel = carResponse.supercarmodel
                print(carModel.count)
                completion(.success(carModel))
            } catch {
                return
            }
        }
        dataTask.resume()
    }
}
