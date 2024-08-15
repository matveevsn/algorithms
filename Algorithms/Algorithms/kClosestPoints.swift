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

protocol DistanceValue {
    var value: Int { get }
}

extension Array: DistanceValue where Element == Int {
    var value: Int {
        get {
            return Int(sqrt( pow(Double(self[0]), 2) + pow(Double(self[1]), 2) ))
        }
    }
}

extension Int: DistanceValue {
    var value: Int {
        get {
            return self
        }
    }
}

class MaxHeap<T: DistanceValue> {
    var data = [T]()

    var count: Int {
        return data.count
    }

    init(data: [T] = [T]()) {
        self.data = data
    }

    func insertElement(element: T) {
        data.append(element)
        var index = data.count - 1
        while index > 0 {
            let parentIndex: Int = (index - 1) / 2
            if data[parentIndex].value < data[index].value {
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

            if leftChild < data.count && data[leftChild].value > data[index].value {
                smallestIndex = leftChild
            }
            if rightChild < data.count && data[rightChild].value > data[smallestIndex].value {
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


class MaxHeapClosestPointsSolution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let maxHeap = MaxHeap<[Int]>()
        for point in points {
            maxHeap.insertElement(element: point)
            if maxHeap.count > k {
                maxHeap.deleteTop()
            }
        }
        return maxHeap.data
    }
}

class QuickSortLamuto {
    func sort(data: [Int]) {
        var dataToSort = data
        quickSort(data: &dataToSort, low: 0, high: dataToSort.count - 1, k: 0)
        print("QuickSortLamuto result: \(dataToSort)")
    }
    
    private func quickSort(data: inout [Int], low: Int, high: Int, k: Int) {
        if low < high {
            let pivot = data[high]
            
            var i = low - 1
            for j in low...high {
                if data[j] < pivot {
                    i += 1
                    let buf = data[j]
                    data[j] = data[i]
                    data[i] = buf
                }
            }

            let buf = data[high]
            data[high] = data[i + 1]
            data[i + 1] = buf
            
            quickSort(data: &data, low: 0, high: i, k: k)
            quickSort(data: &data, low: i + 2, high: high, k: k)
        }
    }
}

class QuickSortLamutoSmallest<T: DistanceValue> {
    func sort(data: [T], k: Int) -> [T] {
        var dataToSort: [T] = data
        quickSort(data: &dataToSort, low: 0, high: dataToSort.count - 1, k: k)
        return Array(dataToSort[0..<k])
    }
    
    private func quickSort(data: inout [T], low: Int, high: Int, k: Int) {
            let pivot = data[high].value
            
            var i = low - 1
            for j in low...high {
                if data[j].value < pivot {
                    i += 1
                    let buf = data[j]
                    data[j] = data[i]
                    data[i] = buf
                }
            }

            let buf = data[high]
            data[high] = data[i + 1]
            data[i + 1] = buf
        
            if i + 1 == k {
                return
            }
        
            if i + 1 < k {
                quickSort(data: &data, low: i + 2, high: high, k: k - (i + 1) + low)
            } else if i + 1 > k {
                quickSort(data: &data, low: 0, high: i, k: k)
            }
    }
}

class QuickSort {
    func sort(data: [Int]) {
        var dataToSort = data
        quickSort(data: &dataToSort)
    }

    private func quickSort(data: inout [Int]) {
        var i = 0
        var j = data.count - 1
        let pivot = data[data.count/2]
        print("QuickSort pivot element: \(pivot)")

        repeat {
            while data[i] < pivot {
                i += 1
            }
            while data[j] > pivot {
                j -= 1
            }
            if i <= j {
                let buf = data[i]
                data[i] = data[j]
                data[j] = buf
                i += 1
                j -= 1
            }
        } while (i <= j)

//        if j > 0 {
//            quickSort(data: &data)
//        }

        print("QuickSort data result: \(data)")
        print("QuickSort left array len: \(j + 1)")
        print("QuickSort right array start: \(i)")
    }
}
