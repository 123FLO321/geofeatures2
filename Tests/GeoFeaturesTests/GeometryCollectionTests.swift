///
///  GeometryCollectionTests.swift
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
///  Created by Tony Stone on 3/6/2016.
///
import XCTest
import GeoFeatures

#if (os(OSX) || os(iOS) || os(tvOS) || os(watchOS)) && SWIFT_PACKAGE
    /// TODO: Remove this after figuring out why there seems to be a symbol conflict (error: cannot specialize a non-generic definition) with another Polygon on Swift PM on Apple platforms only.
    import struct GeoFeatures.Polygon
#endif

///
/// NOTE: This file was auto generated by gyb from file GeometryCollectionTests.swift.gyb using the following command.
///
/// ../bin/gyb --line-directive '' -DTestInput='GeometryCollectionTestInput' -o GeometryCollectionTests.swift GeometryCollectionTests.swift.gyb
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///
// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class GeometryCollectionCoordinate2DFloatingPrecisionCartesianTests: XCTestCase {

    let precision = FloatingPrecision()
    let cs        = Cartesian()

    // MARK: Construction

    func testInitWithNoArg() {
        let input = GeometryCollection()

        XCTAssertTrue(input.isEmpty())
    }

    func testInitWithNoArgAndDefaults() {
        let input    = GeometryCollection()

        /// FIXME: Currently Precision and CoordinateSystem can not be Equitable and be used for anything other than Generic constraints because it's a protocol, this limits testing of the defaultPrecision and defaultCoordinateSystem
        /// XCTAssertEqual(input.precision as? FloatingPrecision, GeoFeatures.defaultPrecision)
        XCTAssertEqual(input.coordinateSystem as? Cartesian, GeoFeatures.defaultCoordinateSystem)
    }

    func testInitWithPrecisionAndCRS() {
        let input = GeometryCollection(precision: precision, coordinateSystem: cs)

        XCTAssertEqual(input.precision as? FloatingPrecision, precision)
        XCTAssertEqual(input.coordinateSystem as? Cartesian, cs)
    }

    func testInitWithPrecision() {
        let input    = GeometryCollection(precision: precision)
        let expected = precision

        XCTAssertEqual(input.precision as? FloatingPrecision, expected)
    }

    func testInitWithCRS() {
        let input = GeometryCollection(coordinateSystem: cs)
        let expected = cs

        XCTAssertEqual(input.coordinateSystem as? Cartesian, expected)
    }

    // MARK: CustomStringConvertible & CustomDebugStringConvertible

    func testDescription() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = "GeometryCollection(Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []), Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))"

        XCTAssertEqual(input.description, expected)
    }

    func testDebugDescription() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = "GeometryCollection(Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []), Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))"

        XCTAssertEqual(input.debugDescription, expected)
    }

    // MARK: Collection conformance

    func testAppendContentsOf() {

        let input1 = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        var input2 = GeometryCollection(precision: precision, coordinateSystem: cs)

        input2.append(contentsOf: input1)

        XCTAssertEqual(input1, input2)
    }

    // MARK: Swift.Collection Conformance

    func testSubscriptGet() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])) as GeometryCollection.Element

        XCTAssertTrue(input[1].equals(expected))
    }

    func testSubscriptSet() {

        var input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)

        input[1] = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])) as GeometryCollection.Element

        XCTAssertEqual(input, expected)
    }

    func testEquals() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)

        XCTAssertEqual(input, expected)
    }

    func testIsEmpty() {

        let input = GeometryCollection(precision: precision, coordinateSystem: cs)
        let expected = true

        XCTAssertEqual(input.isEmpty(), expected)
    }

    func testIsEmptyFalse() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = false

        XCTAssertEqual(input.isEmpty(), expected)
    }

    func testCount() {

        let input    = GeometryCollection(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))] as [GeometryCollection.Element], precision: precision, coordinateSystem: cs)
        let expected = 2

        XCTAssertEqual(input.count, expected)
    }
}
