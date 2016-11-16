/*
 *   MultiPolygon+GeometryTests.swift
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
 *   Created by Tony Stone on 4/24/16.
 */
import XCTest
import GeoFeatures

private let geometryDimension = Dimension.two    // MultiPolygon are always 2 dimension

// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate2D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }

    func testBoundary_Single_Polygon_NoInnerRings() {

        let input    = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiLineString<Coordinate2D>(elements: [LineString<Coordinate2D>(elements: [(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)])], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Single_Polygon_InnnerRings() {
        let input = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]]))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiLineString<Coordinate2D>(elements: [LineString<Coordinate2D>(elements: [(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)]), LineString<Coordinate2D>(elements: [(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)])], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Multiple_Polygons() {
        let input = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiLineString<Coordinate2D>(elements: [LineString<Coordinate2D>(elements: [(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)]), LineString<Coordinate2D>(elements: [(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]), LineString<Coordinate2D>(elements: [(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)])], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(input == expected, "\(input) is not equal to \(expected)")
    }

    func testBoundary_Empty() {
        let geometry = MultiPolygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs).boundary()
        let expected = MultiLineString<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs)

        XCTAssertTrue(geometry == expected, "\(geometry) is not equal to \(expected)")
    }

    func testEqual_True() {
        let input1 = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs)
        let input2 = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertEqual(input1, input2)
     }

    func testEqual_SameTypes_False() {
        let input1            = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs)
        let input2: Geometry  = MultiPolygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs)

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
    }

     func testEqual_DifferentTypes_False() {
        let input1            = MultiPolygon<Coordinate2D>(elements: [Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], [[(x: 5.0, y: 2.0), (x: 2.0, y: 2.0), (x: 2.0, y: 3.0), (x: 3.5, y: 3.5), (x: 5.0, y: 3.0)]])), Polygon<Coordinate2D>(rings: ([(x: 6.0, y: 1.0), (x: 1.0, y: 1.0), (x: 1.0, y: 3.0), (x: 3.5, y: 4.0), (x: 6.0, y: 3.0)], []))], precision: precision, coordinateReferenceSystem: crs)
        let input2: Geometry  = LineString<Coordinate2D>(elements: [(x: 1.0, y: 1.0), (x: 2.0, y: 2.0)], precision: precision, coordinateReferenceSystem: crs)

        XCTAssertFalse(input1.equals(input2), "\(input1) is not equal to \(input2)")
     }
}

// MARK: - Coordinate2DM, FloatingPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate2DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate2DM>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate3D, FloatingPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate3D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate3D>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate3DM, FloatingPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate3DM_FloatingPrecision_Cartesian_Tests: XCTestCase {

    let precision = FloatingPrecision()
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate3DM>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate2D, FixedPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate2D_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate2D>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate2DM, FixedPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate2DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate2DM>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate3D, FixedPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate3D_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate3D>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}

// MARK: - Coordinate3DM, FixedPrecision, Cartesian -

class MultiPolygon_Geometry_Coordinate3DM_FixedPrecision_Cartesian_Tests: XCTestCase {

    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()

    func testDimension () {
        XCTAssertEqual(MultiPolygon<Coordinate3DM>(precision: precision, coordinateReferenceSystem: crs).dimension, geometryDimension)
    }
}
