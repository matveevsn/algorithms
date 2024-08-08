//
//  MergeRange.swift
//  Algorithms
//
//  Created by MatveevSN on 08.08.2024.
//

import Foundation

// Example 1:
//
// Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
// Output: [[1,6],[8,10],[15,18]]
// Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
//
// Example 2:
//
// Input: intervals = [[1,4],[4,5]]
// Output: [[1,5]]
// Explanation: Intervals [1,4] and [4,5] are considered overlapping.
//
// 
//
// Constraints:
//
//    1 <= intervals.length <= 104
//    intervals[i].length == 2
//    0 <= starti <= endi <= 104


class MergeRangeSolution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted(by:{ $0[0] < $1[0] })
        var currentMaxInterval: [Int]?
        var result = [[Int]]()
        for interval in sortedIntervals {
            if let maxInterval = currentMaxInterval {
                if interval[0] <= maxInterval[1] {
                    currentMaxInterval?[1] = max(maxInterval[1], interval[1])
                } else {
                    result.append(maxInterval)
                    currentMaxInterval = interval
                }
            } else {
                currentMaxInterval = interval
            }
        }

        result.append(currentMaxInterval!)

        return result
    }
}
