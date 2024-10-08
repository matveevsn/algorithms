//
//  main.swift
//  Algorithms
//
//  Created by Sergey Matveev on 06.08.2024.
//

import Foundation

print("Start Algo")

print("Kadane max sum1: \(SolutionKadane().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))")
print("Kadane max sum2: \(SolutionKadane().maxSubArray([1]))")
print("Kadane max sum3: \(SolutionKadane().maxSubArray([5,4,-1,7,8]))")

print("Kadane max sum1: \(SolutionDefault().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))")
print("Kadane max sum2: \(SolutionDefault().maxSubArray([1]))")
print("Kadane max sum3: \(SolutionDefault().maxSubArray([5,4,-1,7,8]))")

print("Result range1: \(InsertRangeSolution().insert([[1,3],[6,9]], [2,5]))")
print("Result range2: \(InsertRangeSolution().insert([[1,2],[3,5],[6,7],[8,10],[14,16]], [11,13]))")
print("Result range3: \(InsertRangeSolution().insert([[3,5],[6,7],[8,10],[14,16]], [1,2]))")
print("Result range4: \(InsertRangeSolution().insert([[3,5],[6,7],[8,10],[14,16]], [1,2]))")
print("Result range5: \(InsertRangeSolution().insert([[3,5],[6,7],[8,10],[14,16]], [19,20]))")
print("Result range6: \(InsertRangeSolution().insert([[1,3],[4,5],[10,12]], [7,8]))")

print("Result range1: \(InsertRangeSolutionDefault().insert([[1,3],[6,9]], [2,5]))")
print("Result range2: \(InsertRangeSolutionDefault().insert([[1,2],[3,5],[6,7],[8,10],[14,16]], [11,13]))")
print("Result range3: \(InsertRangeSolutionDefault().insert([[3,5],[6,7],[8,10],[14,16]], [1,2]))")
print("Result range4: \(InsertRangeSolutionDefault().insert([[3,5],[6,7],[8,10],[14,16]], [1,2]))")
print("Result range5: \(InsertRangeSolutionDefault().insert([[3,5],[6,7],[8,10],[14,16]], [19,20]))")
print("Result range6: \(InsertRangeSolutionDefault().insert([[1,3],[4,5],[10,12]], [7,8]))")

print("Result merge range1: \(MergeRangeSolution().merge([[1,3],[2,6],[8,10],[15,18]]))")
print("Result merge range2: \(MergeRangeSolution().merge([[1,4],[4,5]]))")

print("Result closest points1: \(kClosestPointsSolution().kClosest([[1,3],[-2,2]], 1))")
print("Result closest points2: \(kClosestPointsSolution().kClosest([[3,3],[5,-1],[-2,4]], 2))")

print("Result maxHeap closest points1: \(MaxHeapClosestPointsSolution().kClosest([[1,3],[-2,2]], 1))")
print("Result maxHeap closest points2: \(MaxHeapClosestPointsSolution().kClosest([[3,3],[5,-1],[-2,4]], 2))")

print("QuickSortLamutoSmallest \(QuickSortLamutoSmallest().sort(data: [[1,3],[-2,2]], k: 1))")
print("QuickSortLamutoSmallest \(QuickSortLamutoSmallest().sort(data:  [[3,3],[5,-1],[-2,4]], k: 2))")

print("Word break solution \(WordBreakSolution().wordBreak("leetcode", ["leet","code"]))")
print("Word break solution \(WordBreakSolution().wordBreak("applepenapple", ["apple","pen"]))")
print("Word break solution \(WordBreakSolution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]))")

print("Word break recursive solution \(WordBreakRecursiveSolution().wordBreak("leetcode", ["leet","code"]))")
print("Word break recursive solution \(WordBreakRecursiveSolution().wordBreak("applepenapple", ["apple","pen"]))")
print("Word break recursive solution \(WordBreakRecursiveSolution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]))")

print("Word break recursive solution \(WordBreakDynamicSolution().wordBreak("leetcode", ["leet","code"]))")
print("Word break recursive solution \(WordBreakDynamicSolution().wordBreak("applepenapple", ["apple","pen"]))")
print("Word break recursive solution \(WordBreakDynamicSolution().wordBreak("catsandog", ["cats","dog","sand","and","cat"]))")

print("Longest substring without repeating \(LongestSubstringWithoutRepeatingSolution().lengthOfLongestSubstring("abcabcbb"))")
print("Longest substring without repeating \(LongestSubstringWithoutRepeatingSolution().lengthOfLongestSubstring("bbbbb"))")
print("Longest substring without repeating \(LongestSubstringWithoutRepeatingSolution().lengthOfLongestSubstring("pwwkew"))")



