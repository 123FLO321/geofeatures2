///
///  CoordinateSystem+Cartesian.swift
///
///  Copyright (c) 2018 Tony Stone
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
///  Created by Tony Stone on 2/28/18.
///
import Swift

///
/// Cartesian CoordinateSystem Type
///
public struct Cartesian: CoordinateSystem, Equatable, Hashable {
    public init() {}
    public var hashValue: Int = String(reflecting: Cartesian.self).hashValue
}

///
/// CustomStringConvertible and CustomDebugStringConvertible Implementation
///
extension Cartesian: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return "\(type(of: self))()"
    }

    public var debugDescription: String {
        return self.description
    }
}
