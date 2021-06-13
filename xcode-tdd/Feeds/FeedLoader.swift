//
//  SocialFeedLoader.swift
//  xcode-tdd
//
//  Created by Akshay Gajarlawar on 04/06/21.
//

import Foundation

enum LoadFeedsResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadFeeds(completion:@escaping (LoadFeedsResult) -> Void)
}
