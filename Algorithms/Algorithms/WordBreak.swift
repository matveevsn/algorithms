//
//  WordBreak.swift
//  Algorithms
//
//  Created by Sergey Matveev on 19.08.2024.
//

import Foundation

//Example 1:
//
//Input: s = "leetcode", wordDict = ["leet","code"]
//Output: true
//Explanation: Return true because "leetcode" can be segmented as "leet code".
//
//Example 2:
//
//Input: s = "applepenapple", wordDict = ["apple","pen"]
//Output: true
//Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
//Note that you are allowed to reuse a dictionary word.
//
//Example 3:
//
//Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
//Output: false


class WordBreakSolution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var ranges = [Range<String.Index>]()
        for word in wordDict {
            if let range = s.range(of:word) {
                ranges.append(range)
            }
        }
        let sortedRanges = ranges.sorted(by: { $0.lowerBound < $1.lowerBound })
        var continious = true
        var previous: Range<String.Index>?
        for currentRange in sortedRanges {
            if let previousRange = previous {
                if previousRange.upperBound !=  currentRange.lowerBound {
                    continious = false
                }

            } else {
                previous = currentRange
            }
        }
        return continious
    }
}

class WordBreakRecursiveSolution {
    //var memo: [String: Bool] = [:]

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        if let res = memo[s] {
//            return res
//        }

        if s.count == 0 {
            return true
        }

        for i in 0..<wordDict.count {
            if s.hasPrefix(wordDict[i]) {
                let next = String(s.dropFirst(wordDict[i].count))
                if wordBreak(next, wordDict) {
//                    memo[next] = true
                    return true
                }
            }
        }
//        memo[s] = false
        return false
    }
}

class WordBreakDynamicSolution {
    // - Complexity:
    //   - time: O(n ^ 2), where n is the length of s.
    //   - space: O(n), where n is the length of s.

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count+1)
        dp[0] = true

        let chars = Array(s)
        let wordSet = Set(wordDict)

        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(chars[j..<i])) else { continue }
                dp[i] = true
                break
            }
        }

        return dp[s.count]
    }

}
