/*
 *   PolygonTests.swift
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
 *   Created by Tony Stone on 11/14/16.
 */
import XCTest
import GeoFeatures

#if (os(OSX) || os(iOS) || os(tvOS) || os(watchOS)) && SWIFT_PACKAGE
    /// TODO: Remove this after figuring out why there seems to be a symbol conflict (error: cannot specialize a non-generic definition) with another Polygon on Swift PM on Apple platforms only.
    import struct GeoFeatures.Polygon
#endif

// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class Polygon_Coordinate2D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testInit_NoArg() {

        let input = Polygon<Coordinate2D>()

        XCTAssertEqual(input.isEmpty(), true)
    }

    func testInit_NoArg_Defaults() {
        let input    = Polygon<Coordinate2D>()

        // FIXME: Currently Precision and CoordinateRefereceSystem can not be Equitable and be used for anything otherthan Generic constraints because it's a protocol, this limits testing of the defaultPrecision and defaultCoordinateReferenceSystem
        // XCTAssertEqual(input.precision as? FloatingPrecision, GeoFeatures.defaultPrecision)
        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, GeoFeatures.defaultCoordinateReferenceSystem)
    }

    func testInit_Precision_CRS() {
        let input = Polygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input.precision as? FloatingPrecision, precision)
        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, crs)
    }

    func testInit_Precision() {
        let input    = Polygon<Coordinate2D>(precision: precision)
        let expected = precision

        XCTAssertEqual(input.precision as? FloatingPrecision, expected)
    }

    func testInit_CRS() {
        let input = Polygon<Coordinate2D>(coordinateReferenceSystem: crs)
        let expected = crs

        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, expected)
    }

    func testInit_RIngs() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input.outerRing.count, 5)
        XCTAssertEqual(input.innerRings.count, 1)
        XCTAssertEqual(input, expected)
    }

    func testInit_Tuple() {

        let input    = Polygon<Coordinate2D>(outerRing: [(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], innerRings: [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]], precision: precision, coordinateReferenceSystem: crs)
        let expected = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input, expected)
     }

    // MARK: CustomStringConvertible & CustomDebugStringConvertible

    func testDescription() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = "Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]])"

        XCTAssertEqual(input.description, expected)
    }

    func testDebugDescription() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = "Polygon<Coordinate2D>([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]])"

        XCTAssertEqual(input.debugDescription, expected)
    }

    func testOperatorEqual_Geometry_Polygon() {
        let input: Geometry                 = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected: Polygon<Coordinate2D> = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected)
    }

    func testOperatorEqual_Polygon_Geometry() {
        let input: Polygon<Coordinate2D> = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected: Geometry           = Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.0, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected)
    }
}

// MARK: - Coordinate2D, FixedPrecision, Cartesian -

class Polygon_Coordinate2D_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testInit_NoArg() {

        let input = Polygon<Coordinate2D>()

        XCTAssertEqual(input.isEmpty(), true)
    }

    func testInit_NoArg_Defaults() {
        let input    = Polygon<Coordinate2D>()

        // FIXME: Currently Precision and CoordinateRefereceSystem can not be Equitable and be used for anything otherthan Generic constraints because it's a protocol, this limits testing of the defaultPrecision and defaultCoordinateReferenceSystem
        // XCTAssertEqual(input.precision as? FloatingPrecision, GeoFeatures.defaultPrecision)
        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, GeoFeatures.defaultCoordinateReferenceSystem)
    }

    func testInit_Precision_CRS() {
        let input = Polygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input.precision as? FixedPrecision, precision)
        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, crs)
    }

    func testInit_Precision() {
        let input    = Polygon<Coordinate2D>(precision: precision)
        let expected = precision

        XCTAssertEqual(input.precision as? FixedPrecision, expected)
    }

    func testInit_CRS() {
        let input = Polygon<Coordinate2D>(coordinateReferenceSystem: crs)
        let expected = crs

        XCTAssertEqual(input.coordinateReferenceSystem as? Cartesian, expected)
    }

    func testInit_RIngs() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = Polygon<Coordinate2D>(rings: ([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input.outerRing.count, 5)
        XCTAssertEqual(input.innerRings.count, 1)
        XCTAssertEqual(input, expected)
    }

    func testInit_Tuple() {

        let input    = Polygon<Coordinate2D>(outerRing: [(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], innerRings: [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]], precision: precision, coordinateReferenceSystem: crs)
        let expected = Polygon<Coordinate2D>(rings: ([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input, expected)
     }

    // MARK: CustomStringConvertible & CustomDebugStringConvertible

    func testDescription() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = "Polygon<Coordinate2D>([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]])"

        XCTAssertEqual(input.description, expected)
    }

    func testDebugDescription() {

        let input    = Polygon<Coordinate2D>(rings: ([(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected = "Polygon<Coordinate2D>([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]])"

        XCTAssertEqual(input.debugDescription, expected)
    }

    func testOperatorEqual_Geometry_Polygon() {
        let input: Geometry                 = Polygon<Coordinate2D>(rings: ([(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected: Polygon<Coordinate2D> = Polygon<Coordinate2D>(rings: ([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected)
    }

    func testOperatorEqual_Polygon_Geometry() {
        let input: Polygon<Coordinate2D> = Polygon<Coordinate2D>(rings: ([(x: 6.006, y: 1.001), (x: 1.001, y: 1.001), (x: 1.001, y: 3.003), (x: 3.501, y: 4.001), (x: 6.006, y: 3.003)], [[(x: 5.005, y: 2.002), (x: 3.003, y: 1.501), (x: 3.003, y: 3.003), (x: 4.004, y: 3.503), (x: 5.005, y: 3.003)]]), precision: precision, coordinateReferenceSystem: crs)
        let expected: Geometry           = Polygon<Coordinate2D>(rings: ([(x: 6.01, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.01, y: 3.0)], [[(x: 5.01, y: 2.0), (x: 3.0, y: 1.5), (x: 3.0, y: 3.0), (x: 4.0, y: 3.5), (x: 5.01, y: 3.0)]]), precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected)
    }
}
