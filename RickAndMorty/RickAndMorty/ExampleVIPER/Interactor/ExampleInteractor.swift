//
//  ExampleInteractor.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//


import Foundation

final class ExampleInteractor: ExampleProvider {
    
    weak var output: ExampleOutput?
    
    func fetchData(){
        fetchExternal()
//        guard let jsonData = loadJSONData(filename: "items") else {return}
//        do {
//            let items = try? JSONDecoder().decode(Car.self, from: jsonData)
//            output?.showData(out: items)
//        }
    }
    
    private func loadJSONData(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    
    func fetchExternal(){
        let urlString = "https://rickandmortyapi.com/api/character"
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared

        session.dataTask(with: request) {data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let data = data{
                if let respString = String(data: data, encoding: String.Encoding.utf8){
                    print(respString)
                }
                DispatchQueue.main.async {
                    do{
                        let result = try JSONDecoder().decode(InfoAndPagination.self, from: data)
                        self.output?.showData(out: result)
                    }catch let error{
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
