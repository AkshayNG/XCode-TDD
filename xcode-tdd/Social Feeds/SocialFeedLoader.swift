//
//  SocialFeedLoader.swift
//  xcode-tdd
//
//  Created by Akshay Gajarlawar on 04/06/21.
//

import Foundation

protocol SocialFeedLoader {
    func loadFeeds(completion:@escaping (Result<[SocialFeed], Error>) -> Void)
}
