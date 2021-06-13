//
//  RemoteFeedLoaderTests.swift
//  xcode-tddTests
//
//  Created by Akshay Gajarlawar on 13/06/21.
//

import XCTest
import xcode_tdd

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let (_ , client) = makeSUT()
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
   
    
    func test_load_requestData() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        sut.client = client
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
    */
    
    /*
    //Singleton
    func test_load_requestData() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
    */
    
    func test_load_requestsDataFromURL() {
        let url = URL.init(string: "https://some-url.com")!
        let (sut , client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    private func makeSUT(url: URL = URL.init(string: "https://default-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader.init(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
    }
    
}
