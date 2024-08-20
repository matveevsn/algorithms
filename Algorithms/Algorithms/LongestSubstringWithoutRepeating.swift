//
//  LongestSubstringWithoutRepeating.swift
//  Algorithms
//
//  Created by Sergey Matveev on 20.08.2024.
//

import Foundation

//  Example 1:
//
//  Input: s = "abcabcbb"
//  Output: 3
//  Explanation: The answer is "abc", with the length of 3.
//
//  Example 2:
//
//  Input: s = "bbbbb"
//  Output: 1
//  Explanation: The answer is "b", with the length of 1.
//
//  Example 3:
//
//  Input: s = "pwwkew"
//  Output: 3
//  Explanation: The answer is "wke", with the length of 3.
//  Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
//
//
//  Constraints:
//
//    0 <= s.length <= 5 * 104
//    s consists of English letters, digits, symbols and spaces.


class LongestSubstringWithoutRepeatingSolution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLength = Int.min
        var currentLength = 0
        var usedSymbols = [Character: Int]()
        let strSequence = Array(s)
        var j = 0
        for index in 0..<strSequence.count {
            if let nextIndex = usedSymbols[strSequence[index]] {
                j = nextIndex + 1
            }
            usedSymbols[strSequence[index]] = index
            currentLength = index - j + 1
            maxLength = max(currentLength, maxLength)
        }

        return maxLength
    }
}
