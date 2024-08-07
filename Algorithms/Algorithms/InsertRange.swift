//
//  InsertRange.swift
//  Algorithms
//
//  Created by Sergey Matveev on 07.08.2024.
//

import Foundation

// Example 1:
//
// Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
// Output: [[1,5],[6,9]]
//
// Example 2:
//
// Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
// Output: [[1,2],[3,10],[12,16]]
// Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
//
// Example 3:
//
// Input: intervals = [[1,2],[3,5],[6,7],[8,10],[14,16]], newInterval = [11,13]
// Output: [[1,2],[3,5],[6,7],[8,10],[11,13],[14,16]]
// Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
//


class InsertRangeSolution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {

       var newIntervalsStart = [[Int]]()
       var newIntervalsEnd = [[Int]]()

       var newStartIndex: Int?
       var newEndIndex: Int?

       var middleIntervalStart: Int?
       var middleIntervalStop: Int?

       for index in 0..<intervals.count {

           if newStartIndex != nil && newEndIndex != nil {
               break
           }

            let leftInterval = intervals[index]
            let rightInterval = intervals[intervals.count - index - 1]

            if newStartIndex == nil {
              if newInterval[0] <= leftInterval[1] {
                 newStartIndex = index
              } else {
                newIntervalsStart.append(leftInterval)

                if intervals.count - 1 == index {
                    middleIntervalStart = newInterval[0]
                }
              }
            }

            if newEndIndex == nil {
              if newInterval[1] >= rightInterval[0] {
                 newEndIndex = intervals.count - index - 1
              } else {
                newIntervalsEnd.insert(rightInterval, at: 0)

                if intervals.count - index - 1 == 0 {
                    middleIntervalStop = newInterval[1]
                }
              }
            }
       }

        if middleIntervalStart == nil {
            middleIntervalStart = min(newInterval[0], intervals[newStartIndex!][0])
        }

        if middleIntervalStop == nil {
            middleIntervalStop = max(newInterval[1], intervals[newEndIndex!][1])
        }

        let middleInterval = [[middleIntervalStart!, middleIntervalStop!]]

        newIntervalsStart.append(contentsOf: middleInterval)
        newIntervalsStart.append(contentsOf: newIntervalsEnd)

        return newIntervalsStart
    }
}
