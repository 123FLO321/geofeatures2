/*
*   LineStringCoordinate2DFixedPrecisionTests.swift
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
 *   Created by Tony Stone on 2/10/16.
 */
import XCTest
@testable import GeoFeatures2

/*
    NOTE: This file was auto generated by gyb from file CoordinateCollectionTests.swift.gyb using the following command.

    ~/gyb --line-directive '' -DCoordinateType=Coordinate2D -D"TestTuple0=(x: 1.001, y: 1.001)" -D"TestTuple1=(x: 2.002, y: 2.002)" -D"ExpectedTuple0=(x: 1.0, y: 1.0)" -D"ExpectedTuple1=(x: 2.0, y: 2.0)" -D"Precision=FixedPrecision(scale: 100)" -DGeometryType=LineString -o LineStringCoordinate2DFixedPrecisionTests.swift CoordinateCollectionTests.swift.gyb

    Do NOT edit this file directly as it will be regenerated automatically when needed.
*/

class LineStringCoordinate2DFixedPrecisionTests : XCTestCase {

    // MARK: Init
    
    func testInit_NoArg ()   {
        XCTAssertEqual(LineString<Coordinate2D>(precision: FixedPrecision(scale: 100)).isEmpty, true)
    }
    
    func testInit_Tuple () {
    
        XCTAssertEqual(
            (LineString<Coordinate2D>(elements: [(x: 1.001, y: 1.001),(x: 2.002, y: 2.002)], precision: FixedPrecision(scale: 100)).elementsEqual([Coordinate2D(tuple: (x: 1.0, y: 1.0)), Coordinate2D(tuple: (x: 2.0, y: 2.0))])
                { (lhs: Coordinate2D, rhs: Coordinate2D) -> Bool in
                    return lhs == rhs
            }
        ), true)
    }
    
    // MARK: CollectionType
    
    func testSubscript_Get () {
        let geometry = LineString<Coordinate2D>(elements: [(x: 1.001, y: 1.001),(x: 2.002, y: 2.002)], precision: FixedPrecision(scale: 100))
        
        XCTAssertEqual(geometry[1] == Coordinate2D(tuple: (x: 2.0, y: 2.0)), true)
    }
    
    func testSubscript_Set () {
        var geometry = LineString<Coordinate2D>(elements: [(x: 1.001, y: 1.001),(x: 2.002, y: 2.002)], precision: FixedPrecision(scale: 100))
        
        geometry[1] = Coordinate2D(tuple: (x: 1.001, y: 1.001))
        
        XCTAssertEqual(geometry[1] ==  Coordinate2D(tuple: (x: 1.0, y: 1.0)), true)
    }
    
    func testAppendContentsOf_LineString () {
        
        let geometry1 = LineString<Coordinate2D>(elements: [(x: 1.001, y: 1.001),(x: 2.002, y: 2.002)], precision: FixedPrecision(scale: 100))
        var geometry2 = LineString<Coordinate2D>(precision: FixedPrecision(scale: 100))
        
        geometry2.append(contentsOf: geometry1)
        
        XCTAssertEqual(geometry1 == geometry2, true)
    }
    
    func testAppendContentsOf_Array () {
        
        var geometry = LineString<Coordinate2D>(precision: FixedPrecision(scale: 100))
        
        geometry.append(contentsOf: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))])
        
        XCTAssertEqual(geometry.elementsEqual([Coordinate2D(tuple: (x: 1.0, y: 1.0)), Coordinate2D(tuple: (x: 2.0, y: 2.0))]) { (lhs: Coordinate2D, rhs: Coordinate2D) -> Bool in
            return lhs == rhs
        }, true)
    }
    
    // MARK: Equal
    
    func testEquals () {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))], precision: FixedPrecision(scale: 100)).equals(LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.0, y: 1.0)), Coordinate2D(tuple: (x: 2.0, y: 2.0))], precision: FixedPrecision(scale: 100))), true)
    }
    
    // MARK: isEmpty
    
    func testIsEmpty () {
        XCTAssertEqual(LineString<Coordinate2D>(precision: FixedPrecision(scale: 100)).isEmpty(), true)
    }
    
    func testIsEmpty_False() {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))], precision: FixedPrecision(scale: 100)).isEmpty(), false)
    }
    
    func testCount () {
        XCTAssertEqual(LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))], precision: FixedPrecision(scale: 100)).count, 2)
    }
    
    func testAppend () {
        var geometry = LineString<Coordinate2D>(precision: FixedPrecision(scale: 100))
        
        geometry.append((x: 1.001, y: 1.001))
        
        XCTAssertEqual(geometry.elementsEqual([Coordinate2D(tuple: (x: 1.0, y: 1.0))])
            { (lhs: Coordinate2D, rhs: Coordinate2D) -> Bool in
                return lhs == rhs
        }, true)
    }

    func testInsert () {
        var geometry = LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))], precision: FixedPrecision(scale: 100))
        
        geometry.insert(Coordinate2D(tuple: (x: 2.002, y: 2.002)), atIndex: 0)

        XCTAssertEqual(geometry.elementsEqual([Coordinate2D(tuple: (x: 2.002, y: 2.002)), Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))])
            { (lhs: Coordinate2D, rhs: Coordinate2D) -> Bool in
                return lhs == rhs
            }, true)
        
    }

    func testRemoveAll () {
        var geometry = LineString<Coordinate2D>(elements: [Coordinate2D(tuple: (x: 1.001, y: 1.001)), Coordinate2D(tuple: (x: 2.002, y: 2.002))], precision: FixedPrecision(scale: 100))

        geometry.removeAll()

        XCTAssertEqual(geometry.isEmpty(), true)
    }

}
