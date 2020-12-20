//
//  FIFOQueue.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 3/17/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation


public struct FIFOQueue<T> {

    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}
