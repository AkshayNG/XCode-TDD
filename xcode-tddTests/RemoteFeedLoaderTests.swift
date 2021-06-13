//
//  RemoteFeedLoaderTests.swift
//  xcode-tddTests
//
//  Created by Akshay Gajarlawar on 13/06/21.
//

import XCTest

class RemoteFeedLoader {
    var client: HTTPClient?
    
    func load() {
        client?.requestedURL = "https://apple.com"
    }
}

class HTTPClient {
    var requestedURL: String?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestData() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    /*
    //Three ways of dependency injection:
     
    1. Constructor Injection
    let sut = RemoteFeedLoader(client: client)
     
    2. Property Injection
    sut.client = client
     
    3. Method injection
    sut.load(client: client)
    */
    
    func test_load_requestData() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        sut.client = client
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
