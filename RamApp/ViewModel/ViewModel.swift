//
//  ViewModel.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import Foundation

class ViewModel{
    func getData(setURL: String, completion: @escaping (Any?) -> Void) {
         if let url = URL(string: setURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in

                if error != nil{
                    print("ocurrio un error")

                }
               if let data = data {
                   do {
                       let res = try JSONDecoder().decode(ResponseModel.self, from: data)
                     print(res.info.next!)
                    completion(res)
                   } catch {
                     do {
                         let res = try JSONDecoder().decode(errorModel.self, from: data)
                         DispatchQueue.main.async {
                            completion(res.error)
                         }
                     }
                     catch{
                         print(error)
                     }
                   }
                }
            }.resume()
         }
     }
    
    func getCharacter(id: Int, completion: @escaping (Any?) -> Void) {
        if let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") {
            print(url)
           URLSession.shared.dataTask(with: url) { data, response, error in

              if let data = data {
                  do {
                      let res = try JSONDecoder().decode(Model.self, from: data)
                   completion(res)
                  } catch {
                    do {
                        let res = try JSONDecoder().decode(errorModel.self, from: data)
                        DispatchQueue.main.async {
                           completion(res.error)
                        }
                    }
                    catch{
                        print(error)
                    }
                  }
               }
           }.resume()
        }
    }
}
