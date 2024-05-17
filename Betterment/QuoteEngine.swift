//
//  QuoteEngine.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-17.
//

import Foundation

class QuoteEngine {

    var inspirationalQuotes = ["The only way to do great work is to love what you do - Steve Jobs", "Don't let yesterday take up too much of today - Will Rogers", "The harder the conflic, the greater the triumph. - George Washington"]
    
    
    func displayQuote() -> String {
        let randomInt = Int.random(in: 0...2)
        var randomQuote = inspirationalQuotes[randomInt]
        return randomQuote
    }
    
}
