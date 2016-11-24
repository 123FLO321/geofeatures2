///
///  Point+GeometryTests.swift
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
///  Created by Tony Stone on 4/24/2016.
///
import XCTest
import GeoFeatures

private let geometryDimension = Dimension.zero   // Point always have a 0 dimension

// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class Point_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2D>(coordinate: (x: 2.0, y: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate2D>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate2D>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate2DM, FloatingPrecision, Cartesian -

class Point_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2DM>(coordinate: (x: 2.002, y: 2.002, m: 2.002), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate2DM>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate2DM>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate3D, FloatingPrecision, Cartesian -

class Point_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3D>(coordinate: (x: 2.0, y: 2.0, z: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate3D>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate3D>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate3DM, FloatingPrecision, Cartesian -

class Point_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3DM>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate3DM>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate3DM>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate2D, FixedPrecision, Cartesian -

class Point_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2D>(coordinate: (x: 1.0, y: 1.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2D>(coordinate: (x: 2.0, y: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate2D>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate2D>(coordinate: (x: 1.001, y: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate2D>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate2DM, FixedPrecision, Cartesian -

class Point_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2DM>(coordinate: (x: 1.0, y: 1.0, m: 1.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate2DM>(coordinate: (x: 2.0, y: 2.0, m: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate2DM>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate2DM>(coordinate: (x: 1.001, y: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate2DM>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate3D, FixedPrecision, Cartesian -

class Point_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3D>(coordinate: (x: 1.0, y: 1.0, z: 1.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3D>(coordinate: (x: 2.0, y: 2.0, z: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate3D>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate3D>(coordinate: (x: 1.001, y: 1.001, z: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate3D>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}

// MARK: - Coordinate3DM, FixedPrecision, Cartesian -

class Point_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let cs       = Cartesian()

    func testDimension() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).dimension, geometryDimension)
    }

    func testIsEmpty() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).isEmpty(), false)
    }

    func testEquals_IntOne_True() {
        XCTAssertEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3DM>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_IntOne_False() {
        XCTAssertNotEqual(Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs), Point<Coordinate3DM>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 2.0), precision: precision, coordinateSystem: cs))
    }

    func testEquals_Point_NonPoint_False() {
        let input1           = Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs)
        let input2: Geometry = LineString<Coordinate3DM>()

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

    func testBoundary() {
        let geometry = Point<Coordinate3DM>(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001), precision: precision, coordinateSystem: cs).boundary()
        let expected = MultiPoint<Coordinate3DM>(precision: precision, coordinateSystem: cs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }
}
