/*
 *   LengthTests.swift
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
 *   Created by Tony Stone on 2/16/16.
 */
import XCTest

#if SWIFT_PACKAGE
    import Geometry
#else
    import GeoFeatures2
#endif

// MARK: - Coordinate2D, FloatingPrecision, Cartesian -

class LineString_Curve_Coordinate2D_FloatingPrecision_Cartesian_Tests: XCTestCase {

    func testLength_Test1() {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [(x: 0, y: 0),(x: 1, y: 1)]).length(), 1.4142135623730951)
    }

    func testLength_Test2() {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [(x: 0, y: 0),(x: 0, y: 2)]).length(), 2.0)
    }

    func testLength_Test3() {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [(x: 0, y: 0),(x: 7, y:0)]).length(), 7.0)
    }
    
    func testLength_Test4() {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [(x: 0, y: 0),(x: 0, y: 2),(x: 0, y: 3),(x: 0, y: 4),(x: 0, y: 5)]).length(), 5.0)
    }

#if os(Linux) || os(FreeBSD)
#else
    func testPerformanceLength() {
        let lineString = LineString<Coordinate2D>(elements: [(x :0, y: 0),(x: 0, y: 2),(x: 0,y: 3),(x: 0, y: 4),(x: 0,y: 5)])
        
        self.measure {
            
            for _ in 1...500000 {
                let _ = lineString.length()
            }
        }
    }
#endif
}

// MARK: - Coordinate3D, FloatingPrecision, Cartesian -

class LineString_Curve_Coordinate3D_FloatingPrecision_Cartesian_Tests: XCTestCase {
    
#if os(Linux) || os(FreeBSD)
#else
    func testPerformanceLength() {
        let lineString = LineString<Coordinate3D>(elements: [(x :0, y: 0, z: 0),(x: 0, y: 2, z: 0),(x: 0,y: 3, z: 0),(x: 0, y: 4, z: 0),(x: 0,y: 5, z:0)])
        
        self.measure {
            
            for _ in 1...500000 {
                let _ = lineString.length()
            }
        }
    }
#endif
}
