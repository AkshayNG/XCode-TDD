//
//  RemoteFeedLoader.swift
//  xcode-tdd
//
//  Created by Akshay Gajarlawar on 14/06/21.
//

import Foundation

public final class RemoteFeedLoader {
    
    var url: URL
    var client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        self.client.get(from: url)
    }
}

public protocol HTTPClient {
    func get(from url: URL)
}
