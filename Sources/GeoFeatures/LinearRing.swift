///
///  LinearRing.swift
///
///  Copyright (c) 2016 Tony Stone
///
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
///
///  Created by Tony Stone on 2/14/2016.
///
import Swift

///
/// NOTE: This file was auto generated by gyb from file CoordinateCollection.swift.gyb using the following command.
///
///     ~/gyb --line-directive '' -DSelf=LinearRing  -o LinearRing.swift CoordinateCollection.swift.gyb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

///
/// LinearRing
///
/// A LinearRing is a Curve with linear interpolation between Coordinates. Each consecutive pair of
/// Coordinates defines a Line segment.
///
public struct LinearRing<CoordinateType: Coordinate & CopyConstructable> {

    public let precision: Precision
    public let coordinateSystem: CoordinateSystem

    public init(coordinateSystem: CoordinateSystem) {
        self.init(precision: defaultPrecision, coordinateSystem: coordinateSystem)
    }

    public init(precision: Precision) {
        self.init(precision: precision, coordinateSystem: defaultCoordinateSystem)
    }

    public init(precision: Precision, coordinateSystem: CoordinateSystem) {
        self.precision = precision
        self.coordinateSystem = coordinateSystem

        buffer = CollectionBuffer<CoordinateType>.create(minimumCapacity: 8) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<CoordinateType> // swiftlint:disable:this force_cast
    }

    ///
    /// Construct a LinearRing from another LinearRing (copy constructor).
    ///
    /// - parameters:
    ///     - other: The LinearRing of the same type that you want to construct a new LinearRing from.
    ///     - precision: The `Precision` model this polygon should use in calculations on it's coordinates.
    ///     - coordinateSystem: The 'CoordinateSystem` this polygon should use in calculations on it's coordinates.
    ///
    /// - seealso: `CoordinateSystem`
    /// - seealso: `Precision`
    ///
    public init(other: LinearRing<CoordinateType>, precision: Precision = defaultPrecision, coordinateSystem: CoordinateSystem = defaultCoordinateSystem) {

        self.init(precision: precision, coordinateSystem: coordinateSystem)

        other.buffer.withUnsafeMutablePointers { (header, elements) -> Void in

            self.reserveCapacity(numericCast(header.pointee.count))

            for index in 0..<header.pointee.count {
                self.append(elements[index])
            }
        }
    }

    internal var buffer: CollectionBuffer<CoordinateType>
}

extension LinearRing {

    @inline(__always)
    fileprivate mutating func _ensureUniquelyReferenced() {
        if !isKnownUniquelyReferenced(&buffer) {
            buffer = buffer.clone()
        }
    }

    @inline(__always)
    fileprivate mutating func _resizeIfNeeded() {
        if buffer.header.capacity == buffer.header.count {
            buffer = buffer.resize(buffer.header.capacity * 2)
        }
    }
}

// MARK: Collection conformance

extension LinearRing: Collection {

    ///
    /// LinearRings are empty constructable
    ///
    public init() {
        self.init(precision: defaultPrecision, coordinateSystem: defaultCoordinateSystem)
    }

    ///
    /// LinearRing can be constructed from any Swift.Collection including Array as
    /// long as it has an Element type equal the Coordinate type specified in Element
    /// and the Distance is an Int type.
    ///
    public init<C: Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateSystem: CoordinateSystem = defaultCoordinateSystem)
            where C.Iterator.Element == CoordinateType {

        self.init(precision: precision, coordinateSystem: coordinateSystem)

        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    ///
    /// - Returns: The number of Coordinate3D objects.
    ///
    public var count: Int {
        return self.buffer.header.count
    }

    ///
    /// - Returns: The current minimum capacity.
    ///
    public var capacity: Int {
        return self.buffer.header.capacity
    }

    ///
    /// Reserve enough space to store `minimumCapacity` elements.
    ///
    /// - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
    ///
    public mutating func reserveCapacity(_ minimumCapacity: Int) {

        if buffer.capacity < minimumCapacity {

            _ensureUniquelyReferenced()

            let newSize = Swift.max(buffer.capacity * 2, minimumCapacity)

            buffer = buffer.resize(newSize)
        }
    }

    ///
    /// Reserve enough space to store `minimumCapacity` elements.
    ///
    /// - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
    ///
    public mutating func append(_ newElement: CoordinateType) {

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        buffer.append(CoordinateType(other: newElement, precision: precision))
    }

    ///
    /// Append the elements of `newElements` to this LinearRing.
    ///
    public mutating func append<C: Swift.Collection>(contentsOf newElements: C)
            where C.Iterator.Element == CoordinateType {

        self.reserveCapacity(numericCast(newElements.count))

        var Iterator = newElements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    ///
    /// Insert `newElement` at index `i` of this LinearRing.
    ///
    /// - Requires: `i <= count`.
    ///
    public mutating func insert(_ newElement: CoordinateType, at index: Int) {

        _ensureUniquelyReferenced()
        _resizeIfNeeded()

        buffer.insert(CoordinateType(other: newElement, precision: precision), at: index)
    }

    ///
    /// Remove and return the element at index `i` of this LinearRing.
    ///
    @discardableResult
    public mutating func remove(at index: Int) -> CoordinateType {
        return buffer.remove(at: index)
    }

    ///
    /// Remove an element from the end of this LinearRing.
    ///
    /// - Requires: `count > 0`.
    ///
    @discardableResult
    public mutating func removeLast() -> CoordinateType {
        return buffer.removeLast()
    }

    ///
    /// Remove all elements of this LinearRing.
    ///
    /// - Postcondition: `capacity == 0` if `keepCapacity` is `false`.
    ///
    public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {

        if keepCapacity {

            buffer.withUnsafeMutablePointerToHeader { (header) -> Void in
                header.pointee.count = 0
            }
        } else {
            buffer = CollectionBuffer<CoordinateType>.create(minimumCapacity: 0) { newBuffer in CollectionBufferHeader(capacity: newBuffer.capacity, count: 0) } as! CollectionBuffer<CoordinateType> // swiftlint:disable:this force_cast
        }
    }
}

///
/// TupleConvertible extensions
///
/// Coordinates that are TupleConvertible allow initialization via an ordinary Swift tuple.
///
extension LinearRing where CoordinateType: TupleConvertible & CopyConstructable {

    ///
    /// LinearRing can be constructed from any Swift.Collection if it's Elements are tuples that match
    /// Self.Element's TupleType.
    ///
    /// ----
    ///
    /// - seealso: TupleConvertible.
    ///
    public init<C: Swift.Collection>(elements: C, precision: Precision = defaultPrecision, coordinateSystem: CoordinateSystem = defaultCoordinateSystem)
            where C.Iterator.Element == CoordinateType.TupleType {

        self.init(precision: precision, coordinateSystem: coordinateSystem)

        self.reserveCapacity(numericCast(elements.count))

        var Iterator = elements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(coordinate)
        }
    }

    ///
    /// Reserve enough space to store `minimumCapacity` elements.
    ///
    /// - Postcondition: `capacity >= minimumCapacity` and the array has mutable contiguous buffer.
    ///
    public mutating func append(_ newElement: CoordinateType.TupleType) {
        self.append(CoordinateType(tuple: newElement))
    }

    ///
    /// Append the elements of `newElements` to this LinearRing.
    ///
    public mutating func append<C: Swift.Collection>(contentsOf newElements: C)
            where C.Iterator.Element == CoordinateType.TupleType {

        _ensureUniquelyReferenced()

        self.reserveCapacity(numericCast(newElements.count) + buffer.header.count)

        var Iterator = newElements.makeIterator()

        while let coordinate = Iterator.next() {
            self.append(CoordinateType(tuple: coordinate))
        }
    }

    ///
    /// Insert `newElement` at index `i` of this LinearRing.
    ///
    /// - Requires: `i <= count`.
    ///
    public mutating func insert(_ newElement: CoordinateType.TupleType, at i: Int) {
        self.insert(CoordinateType(tuple: newElement), at: i)
    }
}

// MARK: Swift.Collection conformance

extension LinearRing: Swift.Collection, MutableCollection, _DestructorSafeContainer {

    ///
    /// Returns the position immediately after `i`.
    ///
    /// - Precondition: `(startIndex..<endIndex).contains(i)`
    ///
    public func index(after i: Int) -> Int {
        return i+1
    }

    ///
    /// Always zero, which is the index of the first element when non-empty.
    ///
    public var startIndex: Int {
        return 0
    }

    ///
    /// A "past-the-end" element index; the successor of the last valid subscript argument.
    ///
    public var endIndex: Int {
        return buffer.header.count
    }

    public subscript(index: Int) -> CoordinateType {

        get {
            guard (index >= 0) && (index < buffer.header.count) else { preconditionFailure("Index out of range.") }

            return buffer.withUnsafeMutablePointerToElements { $0[index] }
        }

        set (newValue) {

            _ensureUniquelyReferenced()

            buffer.update(CoordinateType(other: newValue, precision: precision), at: index)
        }
    }
}

// MARK: CustomStringConvertible & CustomDebugStringConvertible Conformance

extension LinearRing: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return "\(type(of: self))(\(self.flatMap { String(describing: $0) }.joined(separator: ", ")))"
    }

    public var debugDescription: String {
        return self.description
    }
}

// MARK: Equatable Conformance

extension LinearRing: Equatable {}

public func == <CoordinateType: Coordinate & CopyConstructable>(lhs: LinearRing<CoordinateType>, rhs: LinearRing<CoordinateType>) -> Bool {
    return lhs.equals(rhs)
}
