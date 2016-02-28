//===--- GeometryCollection.swift.gyb -------------------------------------*- swift -*-===//
//
// NOTE: This file was auto generated by gyb from file GeometryCollection.swift.gyb.
//
// Do NOT edit this file directly as it will be regenerated automatically when needed.
//

/*
 *   MultiPoint.swift
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

/**
    MultiPoint
 
    A MultiPoint is a collection of some number of Point objects.
 
    All the elements in a MultiPoint shall be in the same Spatial Reference System. This is also the Spatial Reference System for the MultiPoint.
 */
public struct MultiPoint<CoordinateType : protocol<Coordinate, TupleConvertable>> : Geometry  {

    public typealias Element = Point<CoordinateType>
    
    public let precision: Precision
    public let coordinateReferenceSystem: CoordinateReferenceSystem

    public init(coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        self.precision = precision
        self.coordinateReferenceSystem = coordinateReferenceSystem
    }
    
    private var elements = ContiguousArray<Element>()
}

// MARK:  Collection conformance

extension MultiPoint : Collection {

    /**
        MultiPoint can be constructed from any SequenceType as long as it has an
        Element type equal the Geometry Element.
     */
    public init<S : SequenceType where S.Generator.Element == Element>(elements: S, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
    
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        var generator = elements.generate()
        
        while let element = generator.next() {
            self.elements.append(element)
        }
    }
    
    /**
        MultiPoint can be constructed from any CollectionType including Array as
        long as it has an Element type equal the Geometry Element and the Distance
        is an Int type.
     */
    public init<C : CollectionType where C.Generator.Element == Element, C.Index.Distance == Int>(elements: C, coordinateReferenceSystem: CoordinateReferenceSystem = defaultCoordinateReferenceSystem, precision: Precision = defaultPrecision) {
        
        self.init(coordinateReferenceSystem: coordinateReferenceSystem, precision: precision)
        
        self.elements.reserveCapacity(elements.count)

        var generator = elements.generate()
        
        while let element = generator.next() {
            self.elements.append(element)
        }
    }
    
    /**
        - Returns: The number of Point objects.
     */
    public var count: Int {
        get { return self.elements.count }
    }

    /**
        - Returns: The current minimum capacity.
     */
    public var capacity: Int {
        get { return self.elements.capacity }
    }

    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous storage.
     */
    public mutating func reserveCapacity(minimumCapacity: Int) {
        self.elements.reserveCapacity(minimumCapacity)
    }

    /**
        Append `newElement` to this MultiPoint.
     */
    public mutating func append(newElement: Element) {
        self.elements.append(newElement)
    }

    /**
        Append the elements of `newElements` to this MultiPoint.
     */
    public mutating func appendContentsOf<S : SequenceType where S.Generator.Element == Element>(newElements: S) {
        self.elements.appendContentsOf(newElements)
    }

    /**
        Append the elements of `newElements` to this MultiPoint.
     */
    public mutating func appendContentsOf<C : CollectionType where C.Generator.Element == Element>(newElements: C) {
        self.elements.appendContentsOf(newElements)
    }

    /**
        Remove an element from the end of this MultiPoint.
     
        - Requires: `count > 0`.
     */
    public mutating func removeLast() -> Element {
        return self.elements.removeLast()
    }

    /**
        Insert `newElement` at index `i` of this MultiPoint.
     
        - Requires: `i <= count`.
     */
    public mutating func insert(newElement: Element, atIndex i: Int) {
        self.elements.insert(newElement, atIndex: i)
    }

    /**
        Remove and return the element at index `i` of this MultiPoint.
     */
    public mutating func removeAtIndex(index: Int) -> Element {
        return self.elements.removeAtIndex(index)
    }

    /**
        Remove all elements of this MultiPoint.
     
        - Postcondition: `capacity == 0` iff `keepCapacity` is `false`.
     */
    public mutating func removeAll(keepCapacity keepCapacity: Bool = true) {
        self.elements.removeAll(keepCapacity: keepCapacity)
    }
}

// MARK: CollectionType conformance

extension MultiPoint {
    
    /**
        Always zero, which is the index of the first element when non-empty.
     */
    public var startIndex : Int { return self.elements.startIndex }

    /**
        A "past-the-end" element index; the successor of the last valid subscript argument.
     */
    public var endIndex   : Int { return self.elements.endIndex }
    
    public subscript(position : Int) -> Element {
        get         { return self.elements[position] }
        set (value) { self.elements[position] = value }
    }
    
    public subscript(range: Range<Int>) -> ArraySlice<Element> {
        get         { return self.elements[range] }
        set (value) { self.elements[range] = value }
    }
    
    public func generate() -> IndexingGenerator<ContiguousArray<Element>> {
        return self.elements.generate()
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible protocol conformance

extension MultiPoint : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description : String {
        return "\(self.dynamicType)(\(self.elements.description))"
    }
    
    public var debugDescription : String {
        return self.description
    }
}

