//
//  Queue.swift
//  DataStructure
//
//  Created by 안상희 on 2022/02/27.
//

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    // queue가 비어있는지 확인
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    // queue의 front (제일 앞의 원소 확인)
    var front: T? {
        return queue.first
    }
    
    // queue의 rear (제일 뒤의 원소 확인)
    var rear: T? {
        return queue.last
    }
    
    // queue의 원소 갯수
    var count: Int {
        return queue.count
    }
    
    // queue의 rear에 원소 추가
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    // queue의 front에서 원소 제거
    mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}


// removeFirst() 사용하지 않는 큐
struct AnotherQueue<T> {
    private var list1: [T] = [] // enqueue를 위한 배열
    private var list2: [T] = [] // dequeue를 위한 배열
    
    var isEmpty: Bool {
        return list1.isEmpty && list2.isEmpty
    }
    
    var count: Int {
        return list1.count + list2.count
    }
    
    var front: T? {
        if list2.isEmpty {
            return list1.first
        } else {
            return list2.last
        }
    }
    
    var rear: T? {
        if list2.isEmpty {
            return list1.last
        } else {
            return list2.first
        }
    }
    
    mutating func enqueue(_ element: T) {
        list1.append(element)
    }
    
    mutating func dequeue() -> T?  {
        // list2가 비어있을 때에만 list1의 요소들을 reversed()로 복사해옴
        if list2.isEmpty {
            list2 = list1.reversed()
            list1.removeAll()
        }
        return list2.popLast()
    }
}


func testQueue() {
    print("😇Queue test start😇")
    var myQueue = Queue<Int>()

    myQueue.enqueue(0)
    myQueue.enqueue(1)
    myQueue.enqueue(2)

    print("front:", myQueue.front!) // 0
    print("rear:", myQueue.rear!) // 2
    print("count:", myQueue.count) // 3

    myQueue.dequeue() // front인 0을 dequeue
    myQueue.dequeue() // front인 1을 dequeue

    print("front:", myQueue.front!) // 2
    print("rear:", myQueue.rear!) // 2

    myQueue.dequeue() // front인 2를 dequeue
    myQueue.dequeue() // nil

    print("count", myQueue.count) // 0
    print("😇Queue test end😇")
}
