//
//  APITwitterDelegate.swift
//  day04
//
//  Created by Lidia Grigoreva on 23.06.2021.
//

import Foundation

protocol APITwitterDelegate {
    func processTweets(tweet: Tweet)
    func errorOccured(error: NSError)
}
