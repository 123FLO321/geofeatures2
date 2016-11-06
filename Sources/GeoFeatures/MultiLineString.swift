/*
 *   MultiLineString.swift
 *
 *   Copyright 2016 Tony Stone
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 *   Created by Tony Stone on 2/14/16.
 */
import Swift

/*
    NOTE: This file was auto generated by gyb from file GeometryCollection.swift.gyb using the following command.

        ~/gyb --line-directive '' -DSelf=MultiLineString -DElement=LineString -DCoordinateSpecialized=true -o MultiLineString.swift MultiCollection.swift.gyb

    Do NOT edit this file directly as it will be regenerated automatically when needed.
*/

/**
    MultiLineString
 
    A MultiLineString is a collection of some number of LineString objects.
 
    All the elements in a MultiLineString shall be in the same Spatial Reference System. This is also the Spatial Reference System for the MultiLineString.
 */

public struct MultiLineString<CoordinateType : Coordinate & CopyConstructable> {

    public typealias Element = LineString<CoordinateType>
    
    public let precision: Precision
    public let coordinateReferenceSystem: CoordinateReferenceSystem

    public init(coordinateReferenceSystem: CoordinateReferenceSystem) {
        self.init(precision: defaultPrecision, coordinateReferenceSystem: coordinateReferenceSystem)
    }
    
    public init(precision: Precision) {
        self.init(precision: precision, coordinateReferenceSystem: defaultCoordinateReferenceSystem)
    }
    
    public init(precision: Precision, coordinateReferenceSystem: CoordinateReferenceSystem) {
        self.precision = precision
        self.coordinateReferenceSystem = coordinateReferenceSystem
        
        storage = CollectionBuffer<Element>.create(minimumCapacity: 8) { _ in 0 } as! CollectionBuffer<Element>
    }
    
    internal var storage: CollectionBuffer<Element>
}

// MARK: Private methods

extension MultiLineString {
    
    @inline(__always)
    fileprivate mutating func _ensureUniquelyReferenced() {
        if !isKnownUniquelyReferenced(&storage) {
            storage = storage.clone()
        }
    }
    
    @inline(__always)
    fileprivate mutating func _resizeIfNeeded() {
        if storage.capacity == count {
            storage = storage.resize(count * 2)
        }
    }
}

// MARK:  Collection conformance

extension MultiLineString : Collection {

    /**
        MultiLineStrings are empty constructable
     */
    public init() {
        self.init(precision: defaultPrecision, coordinateReferenceSystem: defaultCoordinateReferenceSystem)
    }
    
    /**
        MultiLineString can be constructed from any Sequence as long as it has an
        Element type equal the Geometry Element.
     */
    public init<S : Sequence>(elements: S, precision: Precision = defaultPrecision, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem) where S.Iterator.Element == Element {
    
        self.init(precision: precision, coordinateReferenceSystem: coordinateReferenceSystem)
        
        var Iterator = elements.makeIterator()
        
        while let element = Iterator.next() {
            self.append(element)
        }
    }
    
    /**
        MultiLineString can be constructed from any Swift.Collection including Array as
        long as it has an Element type equal the Geometry Element and the Distance
        is an Int type.
     */
    public init<C : Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem) where C.Iterator.Element == Element {
        
        self.init(precision: precision, coordinateReferenceSystem: coordinateReferenceSystem)
        
        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()
        
        while let element = Iterator.next() {
            self.append(element)
        }
    }
    
    /**
        - Returns: The number of LineString objects.
     */
    public var count: Int {
        get { return self.storage.header }
    }

    /**
        - Returns: The current minimum capacity.
     */
    public var capacity: Int {
        get { return self.storage.capacity }
    }

    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous storage.
     */
    public mutating func reserveCapacity(_ minimumCapacity: Int) {
        
        if storage.capacity < minimumCapacity {
            
            _ensureUniquelyReferenced()
            
            let newSize = Math.max(storage.capacity * 2, minimumCapacity)
            
            storage = storage.resize(newSize)
        }
    }

    /**
        Append `newElement` to this MultiLineString.
     */
    public mutating func append(_ newElement: Element) {
        
        _ensureUniquelyReferenced()
        _resizeIfNeeded()
        
        storage.withUnsafeMutablePointers { (value, elements)->Void in

            /// We create a new instance of the Element so we can adjust the precision and Coordinate reference system of the element before adding.
            (elements + value.pointee).initialize(to: Element(other: newElement, precision: self.precision, coordinateReferenceSystem: self.coordinateReferenceSystem))
            value.pointee += 1
        }
    }

    /**
        Append the elements of `newElements` to this MultiLineString.
     */
    public mutating func append<S : Sequence>(contentsOf newElements: S) where S.Iterator.Element == Element {
       
        var Iterator = newElements.makeIterator()
        
        while let element = Iterator.next() {
            self.append(element)
        }
    }

    /**
        Append the elements of `newElements` to this MultiLineString.
     */
    public mutating func append<C : Swift.Collection>(contentsOf newElements: C) where C.Iterator.Element == Element {
        
        self.reserveCapacity(numericCast(newElements.count))
        
        var Iterator = newElements.makeIterator()
        
        while let element = Iterator.next() {
            self.append(element)
        }
    }


    /**
        Insert `newElement` at index `i` of this MultiLineString.
     
        - Requires: `i <= count`.
     */
    public mutating func insert(_ newElement: Element, atIndex index: Int) {
        guard ((index >= 0) && (index < storage.header)) else { preconditionFailure("Index out of range, can't insert LineString.") }
        
        _ensureUniquelyReferenced()
        _resizeIfNeeded()
        
        storage.withUnsafeMutablePointers { (count, elements)->Void in
            
            var m = count.pointee
            
            count.pointee = count.pointee &+ 1
            
            // Move the other elements
            while  m >= index {
                (elements + (m &+ 1)).moveInitialize(from: (elements + m), count: 1)
                m = m &- 1
            }
            (elements + index).initialize(to: newElement)
        }
    }

    
    /**
        Remove and return the element at index `i` of this MultiLineString.
     */
    @discardableResult
    public mutating func remove(at index: Int) -> Element {
        guard ((index >= 0) && (index < storage.header)) else { preconditionFailure("Index out of range, can't remove LineString.") }
        
        return storage.withUnsafeMutablePointers { (count, elements)-> Element in
            
            let result = (elements + index).move()
            
            var m = index
            
            // Move the other elements
            while  m <  count.pointee {
                (elements + m).moveInitialize(from: (elements + (m &+ 1)), count: 1)
                m = m &+ 1
            }
            count.pointee = count.pointee &- 1
            
            return result
        }
    }
    
    /**
     Remove an element from the end of this MultiLineString.
     
     - Requires: `count > 0`.
     */
    @discardableResult
    public mutating func removeLast() -> Element {
        guard storage.header > 0 else { preconditionFailure("can't removeLast from an empty MultiLineString.") }
        
        return storage.withUnsafeMutablePointers { (count, elements)-> Element in
            
            // No need to check for overflow in `count.pointee - 1` because `count.pointee` is known to be positive.
            count.pointee = count.pointee &- 1
            return (elements + count.pointee).move()
        }
    }

    /**
        Remove all elements of this MultiLineString.
     
        - Postcondition: `capacity == 0` iff `keepCapacity` is `false`.
     */
    public mutating func removeAll(_ keepCapacity: Bool = false) {
        
        if keepCapacity {
        
            storage.withUnsafeMutablePointers { (count, elements)-> Void in
                count.pointee = 0
            }
        } else {
            storage = CollectionBuffer<Element>.create(minimumCapacity: 0) { _ in 0 } as! CollectionBuffer<Element>
        }
    }
}

// MARK: Collection conformance

extension MultiLineString {

    /**
        Returns the position immediately after `i`.
     
        - Precondition: `(startIndex..<endIndex).contains(i)`
     */
    public func index(after i: Int) -> Int {
        return i+1
    }

    /**
        Always zero, which is the index of the first element when non-empty.
     */
    public var startIndex : Int { return 0 }

    /**
        A "past-the-end" element index; the successor of the last valid subscript argument.
     */
    public var endIndex   : Int { return storage.header  }
    
    public subscript(index : Int) -> Element {
        get {
            guard ((index >= 0) && (index < storage.header)) else { preconditionFailure("Index out of range.") }
            
            return storage.withUnsafeMutablePointerToElements { $0[index] }
        }
        set (newValue) {
            guard ((index >= 0) && (index < storage.header)) else { preconditionFailure("Index out of range.") }
            
            _ensureUniquelyReferenced()
        
            storage.withUnsafeMutablePointerToElements { elements->Void in
                
                (elements + index).deinitialize()
                /// We create a new instance of the Element so we can adjust the precision and Coordinate reference system of the element before adding.
                (elements + index).initialize(to: Element(other: newValue, precision: self.precision, coordinateReferenceSystem: self.coordinateReferenceSystem))
            }
        }
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible protocol conformance

extension MultiLineString : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description : String {
        return "\(type(of: self))(\(self.flatMap { String(describing: $0) }.joined(separator: ", ")))"
    }
    
    public var debugDescription : String {
        return self.description
    }
}

// MARK: Equatable Conformance

extension MultiLineString : Equatable {}

public func ==<CoordinateType : Coordinate & CopyConstructable>(lhs: MultiLineString<CoordinateType>, rhs: MultiLineString<CoordinateType>) -> Bool {
    return lhs.equals(rhs)
}
    



