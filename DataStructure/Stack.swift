//
//  Stack.swift
//  DataStructure
//
//  Created by 안상희 on 2022/02/27.
//

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    // stack이 비어있는지 여부 확인
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    // stack의 제일 위의 원소 확인
    var top: T? {
        return stack.last
    }
    
    // stack의 원소 갯수
    var count: Int {
        return stack.count
    }
    
    // stack에 원소 추가
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    // stack의 마지막 원소 빼기
    mutating func pop() -> T? {
        return stack.popLast()
    }
}


func testStack() {
    print("😇Stack test start😇")
    var myStack = Stack<Int>()

    myStack.push(0)
    myStack.push(1)
    myStack.push(2)
    myStack.push(3)

    print(myStack) // Stack<Int>(stack: [0, 1, 2, 3])
    print("top:", myStack.top) // 3
    print("stack size:", myStack.count) // 4

    myStack.pop() // 제일 위의 원소인 3을 pop

    print("top:", myStack.top) // 2

    myStack.pop() // 제일 위의 원소인 3을 pop
    myStack.pop() // 제일 위의 원소인 2를 pop
    myStack.pop() // 제일 위의 원소인 1을 pop

    print("isEmpty:", myStack.isEmpty) // true
    print("top:", myStack.top) // nil
    print("😇Stack test end😇")
}
