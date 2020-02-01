//
//  main.swift
//  CodingTestSwift
//
//  Created by BaekSungwook on 10/5/19.
//  Copyright © 2019 BaekSungwook. All rights reserved.
//

import Foundation

enum SolvingProblem: String {
    case bruteForce
    case optimization
}

enum DynamicProgramming: String {
    case memoization
    case tabulation
}

func printTimeElapsedWhenRunningCode(operation:()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0
    print("Time: \(timeElapsed)ms\n")
}

printTimeElapsedWhenRunningCode {
    run01Knapsack(method: .tabulation, profits: [1, 6, 10, 16], weights: [1, 2, 3, 5], capacity: 7)
}

printTimeElapsedWhenRunningCode {
    runSlidingWindow(method: .average(using: .bruteForce), input: [1, 3, 2, 6, -1, 4, 1, 8, 2], k: 5)
}

printTimeElapsedWhenRunningCode {
    runSlidingWindow(method: .average(using: .optimization), input: [1, 3, 2, 6, -1, 4, 1, 8, 2], k: 5)
}

printTimeElapsedWhenRunningCode {
    runSlidingWindow(method: .maximum, input: [2, 1, 5, 1, 3, 2], k: 3)
}

func runSlidingWindowPatterns() {
    runSlidingWindow(method: .average(using: .bruteForce), input: [1, 3, 2, 6, -1, 4, 1, 8, 2], k: 5)
    maxSubArrayOfSizeK(k: 3, arr: [2, 1, 5, 1, 3, 2])
    smallestSubArrayWithGivenSum(s: 7, arr: [2, 1, 5, 2, 3, 2])
    smallestSubArrayWithGivenSum(s: 7, arr: [2, 1, 5, 1, 8])
    longestSubStringWithKDistinct(str: "araaci", k: 2) // 4
    longestSubStringWithKDistinct(str: "araaci", k: 1) // 2
    longestSubStringWithKDistinct(str: "cbbebi", k: 3) // 5
}
runSlidingWindowPatterns()


func averageOfSubarray(k: Int, arr: [Int]) -> Int {
    var windowStartIndex = 0
    var result: [Double] = []
    var windowSum = 0
    var maxSum = 0
    for i in stride(from: 0, to: arr.count, by: 1) {
        print(i)
        windowSum += arr[i]
        if i >= k - 1 {
            print("is \(i) > \(k)")
            result.append(Double(windowSum))
            maxSum = max(maxSum, windowSum)
            windowSum -= arr[windowStartIndex]
            windowStartIndex += 1
        }
        
    }
    print("max Sum is : \(maxSum)")
    return maxSum
}
print("-")
print(averageOfSubarray(k: 2, arr: [2, 3, 4, 1, 5]))
