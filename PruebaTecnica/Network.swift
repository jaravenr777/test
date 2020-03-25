//
//  Network.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation
import Alamofire

func getPopulars(success: ((Movies) -> Void)?, faliure: (() -> Void)?) {
    AF.request(Constants.urlPopular).responseJSON { response in
        if let data = response.data {
            print("Result: \(data)")
            do {
                let result = try JSONDecoder().decode(Movies.self, from: data)
                print(result)
                if let funcionExito = success {
                    funcionExito(result)
                }
            } catch {
                print("error get Populars: \(error).")
                if let funcionFalla = faliure {
                    funcionFalla()
                }
            }
        }
        if let error = response.error {
            print(error.errorDescription!)
            if let funcionFalla = faliure {
                funcionFalla()
            }
        }
    }
}

func getGenero(movie: Movie, completion: @escaping (String) -> Void) {
    AF.request(Constants.urlGeneros).responseJSON { response in
        print("Result: \(response.result)")
        if let data = response.data {
            print("Result: \(data)")
            do {
                let genres = try JSONDecoder().decode(Genres.self, from: data)
                print(genres)
                if let index = genres.list.firstIndex(where: { $0.idGenre == movie.idGenre[0] }) {
                    print("genero=> "+genres.list[index].name)
                    completion(genres.list[index].name)
                }
            } catch {
                print("error: \(error).")
            }
        }
    }

}
