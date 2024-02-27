//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import XCTest
@testable import RickAndMorty

// MARK: RickAndMortyTests
final class RickAndMortyTests: XCTestCase {
    
    var networkMain : ExampleInteractor = ExampleInteractor()
    var networkCharacter: CharacterInteractor = CharacterInteractor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacters() throws {
        let expectation = self.expectation(description: "Fetch Characters")
        guard let urlCreated : URL = URL(string: APIHandler.urlStringCharacters) else {return}
        let request = URLRequest(url: urlCreated)
        networkMain.apiHandler.getCharacters(request: request) { data, error in
            let result: InfoAndPagination? = self.networkMain.parseHandler.parseCharacters(data: data)
            if let result = result{
                XCTAssertEqual(result.results?.first?.name , "Rick Sanchez")
                XCTAssertEqual(result.info.next, "https://rickandmortyapi.com/api/character?page=2")
            }
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCharactersByPage() throws {
        let expectation = self.expectation(description: "Fetch Characters by page")
        guard let urlCreated : URL = URL(string: "https://rickandmortyapi.com/api/character?page=2") else {return}
        let request = URLRequest(url: urlCreated)
        networkMain.apiHandler.getCharacters(request: request) { data, error in
            let result: InfoAndPagination? = self.networkMain.parseHandler.parseCharacters(data: data)
            if let result = result{
                XCTAssertEqual(result.results?.first?.name , "Aqua Morty")
            }
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    func testCharacterByID() throws {
        let expectation = self.expectation(description: "Fetch Character by ID")
        let url : String = APIHandler.urlStringCharacters+"/\(1)"
        guard let urlCreated : URL = URL(string: url) else {return}
        let request = URLRequest(url: urlCreated)
        networkCharacter.apiHandler.getCharacters(request: request) { data, error in
            let result: InfoAndPagination? = self.networkMain.parseHandler.parseCharacters(data: data)
            if let result = result{
                XCTAssertEqual(result.results?.first?.name , "Rick Sanchez")
                XCTAssertEqual(result.info.next, "https://rickandmortyapi.com/api/character?page=2")
            }
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    override class func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

}
