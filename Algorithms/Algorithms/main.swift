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



