/*
 *   Surface.swift
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
 *   Created by Tony Stone on 2/13/16.
 */
import Swift

public protocol Surface {
    
    /**
        The area of this Surface calaculated using its associated CoordinateReferenceSystem.
    */
    @warn_unused_result
    func area() -> Double

//    /**
//        The mathematical centroid for this surface as a Point.  The Point is not guaranteed to be on this Surface
//    */
//    @warn_unused_result
//    func centroid() -> Geometry
//
//    /**
//
//    */
//    @warn_unused_result
//    func boundary() -> Geometry
}