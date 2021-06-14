//
//  RemoteFeedLoader.swift
//  xcode-tdd
//
//  Created by Akshay Gajarlawar on 14/06/21.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion:@escaping (Error?, HTTPURLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    
    var url: URL
    var client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity, invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        self.client.get(from: url) { (error, response) in
            if(response != nil) {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}


