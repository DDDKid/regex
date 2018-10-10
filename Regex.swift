//
//  Regex.swift
//  CommandLine
//
//  Created by DDDKid on 2018/10/9.
//  Copyright © 2018 DDDKid. All rights reserved.
//

import Foundation

struct Regex: ExpressibleByStringLiteral {
    private var expression: NSRegularExpression
    
    init(stringLiteral value: String) {
        do {
            self.expression = try NSRegularExpression(pattern: value, options: [])
        } catch {
            preconditionFailure("expression initialize failure, reason: \(error)")
        }
    }
    
    private func match(_ value: String) -> Bool {
        var index = 0
        var counter = 0
        outer: while case 0..<value.count = index {
            let shouldPattern = expression.numberOfMatches(
                in: value,
                options: [],
                range: NSRange(index..<value.count)
            )
            if shouldPattern == 0 {
                break outer
            } else {
                index += 1
                counter += 1
            }
        }
        if counter == value.count {
            return true
        } else {
            return false
        }
    }
}

infix operator -->
extension Regex: Equatable {
    static func ~= (pattern: Regex, value: String) -> Bool {
        return pattern.match(value)
    }
    
    static func == (lhs: String, rhs: Regex) -> Bool {
        return rhs.match(lhs)
    }
    
    static func == (lhs: Regex, rhs: String) -> Bool {
        return lhs.match(rhs)
    }
    
    static func --> (lhs: Regex, rhs: String) -> Bool {
        return lhs.match(rhs)
    }
    
    static func --> (lhs: String, rhs: Regex) -> Bool {
        return rhs.match(lhs)
    }
}
