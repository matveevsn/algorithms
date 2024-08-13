//
//  kClosestPoints.swift
//  Algorithms
//
//  Created by MatveevSN on 09.08.2024.
//

import Foundation

// Example 1:
//
// Input: points = [[1,3],[-2,2]], k = 1
// Output: [[-2,2]]
// Explanation:
// The distance between (1, 3) and the origin is sqrt(10).
// The distance between (-2, 2) and the origin is sqrt(8).
// Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
// We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].
//
// Example 2:
//
// Input: points = [[3,3],[5,-1],[-2,4]], k = 2
// Output: [[3,3],[-2,4]]
// Explanation: The answer [[-2,4],[3,3]] would also be accepted.
//
// 
//
// Constraints:
//
//    1 <= k <= points.length <= 104
//    -104 <= xi, yi <= 104


class kClosestPointsSolution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        //let sortedPoints = points.sorted(by: { sqrt( pow($0[0], 2) + pow($0[1], 2) ) < sqrt( pow($1[0], 2) + pow($1[1], 2) ) } )
        let sortedPoints = points.sorted { left, right in
            let leftSqrt = sqrt( pow(Double(left[0]), 2) + pow(Double(left[1]), 2) )
            let rightSqrt = sqrt( pow(Double(right[0]), 2) + pow(Double(right[1]), 2) )
            return leftSqrt < rightSqrt
        }
        return Array(sortedPoints[..<k])
    }
}

class MinHeap {
    var data = [Int]()

    var count: Int {
        return data.count
    }

    init(data: [Int] = [Int]()) {
        self.data = data
    }

    func insertElement(element: Int) {
        data.append(element)
        var index = data.count - 1
        while index > 0 {
            let parentIndex: Int = (index - 1) / 2
            if data[parentIndex] > data[index] {
                let parentData = data[parentIndex]
                data[parentIndex] = data[index]
                data[index] = parentData
            } else {
                break
            }
            index = parentIndex
        }
    }

    func deleteTop() {
        guard let lastElement = data.last else { return }
        data[0] = lastElement
        data.removeLast()
        heapify(heapifyFromindex: 0)
    }

    func printHeap() {
        print("Data \(data)")
    }

    private func heapify(heapifyFromindex: Int) {

        var index = heapifyFromindex
        while index <= data.count {
            let leftChild = 2*index + 1
            let rightChild = 2*index + 2
            var smallestIndex = index

            if leftChild < data.count && data[leftChild] < data[index] {
                smallestIndex = leftChild
            }
            if rightChild < data.count && data[rightChild] < data[smallestIndex] {
                smallestIndex = rightChild
            }

            if index != smallestIndex {
                let indexData = data[index]
                data[index] = data[smallestIndex]
                data[smallestIndex] = indexData
            } else {
                break
            }
            index = smallestIndex
        }
    }
}


class MinHeapClosestPointsSolution {
//    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
//        return [[Int]()]
//    }

    func kClosest(_ points: [Int], _ k: Int) -> [Int] {
        let minHeap = MinHeap()
        for point in points {
            minHeap.insertElement(element: point)
            if minHeap.count > k {
                minHeap.deleteTop()
            }
        }
        return minHeap.data
    }
}
