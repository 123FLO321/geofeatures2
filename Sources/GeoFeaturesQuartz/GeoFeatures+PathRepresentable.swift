///
/// GeoFeatures+CGPath.swift
///
/// Copyright (c) Tony Stone, All rights reserved.
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
/// Created by Tony Stone on 3/16/18.
///

#if os(OSX) || os(iOS) || os(tvOS) || os(watchOS)

import CoreGraphics.CGPath
import GeoFeatures


///
/// Protocol specifying the ability to convert the object into a Quartz 2D path.
///
internal protocol PathRepresentable {

    ///
    /// Returns a CGPath representation of `self`.
    ///
    func path(transform: CGAffineTransform) -> CGPath
}

///
/// Defaults for protocol `PathRepresentable`.
///
internal extension PathRepresentable {

    ///
    /// Returns a CGPath representation of `self` with the default value for `transform`.
    ///
    func path(transform: CGAffineTransform = CGAffineTransform.identity) -> CGPath {
        return path(transform: transform)
    }
}

///
/// Point drawing routines
///
/// - Note: The drawing routine translates all Coordinate types to 2d flat space at the moment dropping z and m from 2DM, 3D, and 3DM coordinates.
///
extension Point: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        path.move(to: CGPoint(x: self.x, y: self.y), transform: transform)
        path.closeSubpath()

        return path
    }
}

///
/// LineString drawing implementation
///
extension LineString: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path =  CGMutablePath()

        if self.count > 0 {
            path.move(to: CGPoint(x: self[0].x, y: self[0].y), transform: transform) /// start from here

            for index in 1..<self.count {
                path.addLine(to: CGPoint(x: self[index].x, y: self[index].y), transform: transform)
            }
            if self.isClosed() {
                path.closeSubpath()
            }
        }
        return path
    }
}

///
/// LinearRing drawing implementation
///
extension LinearRing: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path =  CGMutablePath()

        if self.count > 0 {
            path.move(to: CGPoint(x: self[0].x, y: self[0].y), transform: transform) /// start from here

            for index in 1..<self.count {
                path.addLine(to: CGPoint(x: self[index].x, y: self[index].y), transform: transform)
            }
            if self.isClosed() {
                path.closeSubpath()
            }
        }
        return path
    }
}

///
/// Polygon drawing implementation
///
extension Polygon: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        path.addPath(self.outerRing.path(transform: transform))

        /// Now the holes
        for innerRing in self.innerRings {
            path.addPath(innerRing.path(transform: transform))
        }
        return path
    }
}

///
/// MultiPoint drawing implementation
///
extension MultiPoint: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        for point in self {
            path.addPath(point.path(transform: transform))
        }
        return path
    }
}

///
/// MultiLineString drawing implementation
///
extension MultiLineString: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        for lineString in self {
            path.addPath(lineString.path(transform: transform))
        }
        return path
    }
}

///
/// MultiPolygon drawing implementation
///
extension MultiPolygon: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        for polygon in self {
            path.addPath(polygon.path(transform: transform))
        }
        return path
    }
}

///
/// GeometryCollection drawing implementation
///
extension GeometryCollection: PathRepresentable {

    internal func path(transform: CGAffineTransform) -> CGPath {
        let path = CGMutablePath()

        for case let geometry as PathRepresentable in self {
            path.addPath(geometry.path(transform: transform))
        }
        return path
    }
}
#endif
