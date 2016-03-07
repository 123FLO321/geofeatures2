/*
*   MultiPointCoordinate3DMFixedPrecisionTests.swift
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
*   Created by Tony Stone on 3/6/16.
 */
import XCTest
import GeoFeatures2

/*
    NOTE: This file was auto generated by gyb from file MultiPointTests.swift.gyb using the following command.

    ~/gyb --line-directive '' -DCoordinateType=Coordinate3DM -D"TestTuple0=(x: 1.001, y: 1.001, z: 1.001, m: 1.001)" -D"TestTuple1=(x: 2.002, y: 2.002, z: 2.002, m: 2.002)" -D"ExpectedTuple0=(x: 1.0, y: 1.0, z: 1.0, m: 1.0)" -D"ExpectedTuple1=(x: 2.0, y: 2.0, z: 2.0, m: 2.0)" -D"Precision=FixedPrecision(scale: 100)" -o MultiPointCoordinate3DMFixedPrecisionTests.swift MultiPointTests.swift.gyb

    Do NOT edit this file directly as it will be regenerated automatically when needed.
*/

class MultiPointCoordinate3DMFixedPrecisionTests : XCTestCase {

    // MARK: Init
    
    func testInit_NoArg ()   {
        XCTAssertEqual(MultiPoint<Coordinate3DM>(precision: FixedPrecision(scale: 100)).isEmpty, true)
    }
    
    func testInit_Tuple () {
    
        XCTAssertEqual(
            (MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100)).elementsEqual([Point(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)),Point(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 2.0))])
                { (lhs: Point<Coordinate3DM>, rhs: Point<Coordinate3DM>) -> Bool in
                    return lhs == rhs
            }
        ), true)
    }
    
    // MARK: CollectionType
    
    func testSubscript_Get () {
        let geometry = MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100))
        
        XCTAssertEqual(geometry[1] == Point<Coordinate3DM>(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 2.0)), true)
    }
    
    func testSubscript_Set () {
        var geometry = MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100))
        
        geometry[1] = Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001))
        
        XCTAssertEqual(geometry[1] == Point<Coordinate3DM>(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)), true)
    }
    
    func testAppendContentsOf_MultiPoint () {
        
        let geometry1 = MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100))
        var geometry2 = MultiPoint<Coordinate3DM>(precision: FixedPrecision(scale: 100))
        
        geometry2.appendContentsOf(geometry1)
        
        XCTAssertEqual(geometry1 == geometry2, true)
    }
    
    func testAppendContentsOf_Array () {
        
        var geometry = MultiPoint<Coordinate3DM>(precision: FixedPrecision(scale: 100))
        
        geometry.appendContentsOf([Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))])
        
        XCTAssertEqual(geometry.elementsEqual([Point(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0)),Point(coordinate: (x: 2.0, y: 2.0, z: 2.0, m: 2.0))]) { (lhs: Point<Coordinate3DM>, rhs: Point<Coordinate3DM>) -> Bool in
            return lhs == rhs
        }, true)
    }
    
    // MARK: Equal
    
    func testEquals () {
        XCTAssertEqual(MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100)).equals(MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100))), true)
    }
    
    // MARK: isEmpty
    
    func testIsEmpty () {
        XCTAssertEqual(MultiPoint<Coordinate3DM>(precision: FixedPrecision(scale: 100)).isEmpty(), true)
    }
    
    func testIsEmpty_False() {
        XCTAssertEqual(MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100)).isEmpty(), false)
    }
    
    func testCount () {
        XCTAssertEqual(MultiPoint<Coordinate3DM>(elements: [Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)),Point(coordinate: (x: 2.002, y: 2.002, z: 2.002, m: 2.002))], precision: FixedPrecision(scale: 100)).count, 2)
    }
    
    func testAppend () {
        var lineString = MultiPoint<Coordinate3DM>(precision: FixedPrecision(scale: 100))
        
        lineString.append(Point(coordinate: (x: 1.001, y: 1.001, z: 1.001, m: 1.001)))
        
        XCTAssertEqual(lineString.elementsEqual([Point(coordinate: (x: 1.0, y: 1.0, z: 1.0, m: 1.0))])
            { (lhs: Point<Coordinate3DM>, rhs: Point<Coordinate3DM>) -> Bool in
                return lhs == rhs
        }, true)
    }

}
