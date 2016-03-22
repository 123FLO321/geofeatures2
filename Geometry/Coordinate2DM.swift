/*
 *   Coordinate2DM.swift
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
 *   Created by Tony Stone on 2/21/16.
 */
import Swift

/**
    Measuted 2D Coordinate
 
    Low level 2 dimensional Coorodinate type with an m value.
 */
public final class Coordinate2DM : Coordinate, Measured {
    
    public let x: Double
    public let y: Double
    public let m: Double
    
    public required init(x: Double, y: Double, m: Double) {
        self.x = x
        self.y = y
        self.m = m
    }
}

extension Coordinate2DM : _ArrayConstructable {
    
    public convenience init(array: [Double]) {
        precondition(array.count == 3)
        
        self.init(x: array[0], y: array[1], m: array[2])
    }
}

extension Coordinate2DM : CopyConstructable {
    
    public convenience init(other: Coordinate2DM) {
        self.init(x: other.x, y: other.y, m: other.m)
    }
    
    public convenience init(other: Coordinate2DM, precision: Precision) {
        self.init(x: precision.convert(other.x), y: precision.convert(other.y), m: precision.convert(other.m))
    }
}

extension Coordinate2DM : TupleConvertable {
    
    public typealias TupleType = (x: Double, y: Double, m: Double)
    
    public var tuple: TupleType {
        get { return (x: self.x, y: self.y, m: self.m)  }
    }
    
    public convenience init(tuple: TupleType) {
        self.init(x: tuple.x, y: tuple.y, m: tuple.m)
    }
    
    public convenience init(tuple: TupleType, precision: Precision) {
        self.init(x: precision.convert(tuple.x), y: precision.convert(tuple.y), m: precision.convert(tuple.m))
    }
}

extension Coordinate2DM : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description : String {
        return "(x: \(self.x), y: \(self.y), m: \(self.m))"
    }
    
    public var debugDescription : String {
        return self.description
    }
}

public func ==(lhs: Coordinate2DM, rhs: Coordinate2DM) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.m == rhs.m
}
