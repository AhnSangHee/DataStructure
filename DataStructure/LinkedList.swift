//
//  LinkedList.swift
//  DataStructure
//
//  Created by 안상희 on 2022/02/27.
//

import Foundation

let MX = 100
var dat = [Int](repeating: 0, count: MX) // 데이터 저장
var pre = [Int](repeating: -1, count: MX) // 이전 주소 (인덱스) 저장
var nxt = [Int](repeating: -1, count: MX) // 다음 주소 (인덱스) 저장
var unused = 1 // 현재 사용되지 않는 인덱스 (새로운 원소가 들어갈 수 있는 인덱스)로, 원소 추가 이후에는 1씩 증가


/// 예를 들어 원소 13이 2번지이고 13 뒤에 20을 새로 추가하고 싶은거면 insert(2, 20)을 호출
/// unused가 가리키는 곳이 새로운 원소가 들어갈 자리. 그 자리의 dat에 값을 넣어주면 된다.
/// - Parameters:
///   - addr: 추가하려는 원소의 위치 (주소, 인덱스, 번지)
///   - num: 추가할 값
func insert(addr: Int, num: Int) {
    // 1. 새로운 원소 생성
    dat[unused] = num
    
    // 2. 새 원소의 pre 값에 삽입할 위치 (주소) 값 저장
    pre[unused] = addr
    
    // 3. 새 원소의 nxt 값에 삽입할 위치의 nxt 값 저장
    nxt[unused] = nxt[addr]
    
    // 4. 새롭게 들어간 원소의 자리에 원래 있던 원소의 nxt 값과 삽입할 위치의 다음 원소의 pre 값을 새 원소로 변경
    // (삽입할 위치의 nxt 값과 삽입할 위치의 다음 원소의 pre 값을 새 원소로 변경)
    if nxt[unused] != -1 { // 새로 삽입한 원소가 마지막이 아닐 경우에만!
        pre[nxt[addr]] = unused
    }
    nxt[addr] = unused
    unused += 1
}


///  원소 13이 2번지이고, 13을 지우고 싶으면 erase(2)를 호출
/// - Parameter addr: 지우려는 원소의 위치 (주소, 인덱스, 번지)
func erase(addr: Int) {
    // 1. 이전 원소의 nxt를 삭제하려는 원소의 nxt로 변경
    nxt[pre[addr]] = nxt[addr]
    
    // 2. 다음 원소의 pre를 삭제하려는 원소의 pre로 변경.
    if nxt[addr] != -1 { // 삭제하려는 원소가 마지막 원소가 아닐 경우에만!
        pre[nxt[addr]] = pre[addr]
    }
}


/// 연결 리스트의 모든 원소들을 출력 (연결 순서대로 출력)
func traverse() {
    var cur = nxt[0]
    while cur != -1 {
        print(dat[cur], terminator: " ")
        cur = nxt[cur]
    }
    print("** traverse 끝 **")
}


func testLinkedList() {
    print("😇insert test😇")
    insert(addr: 0, num: 10)
    traverse() // 10(address=1)
    insert(addr: 0, num: 30)
    traverse() // 30(address=2) 10
    insert(addr: 2, num: 40)
    traverse() // 30 40(address=3) 10
    insert(addr: 1, num: 20)
    traverse() // 30 40 10 20(address=4)
    insert(addr: 4, num: 70)
    traverse() // 30 40 10 20 70(address=5)

    print("\n😇erase test😇")
    erase(addr: 1)
    traverse() // 30 40 20 70
    erase(addr: 2)
    traverse() // 40 20 70
    erase(addr: 4)
    traverse() // 40 70
    erase(addr: 5)
    traverse() // 40
}
