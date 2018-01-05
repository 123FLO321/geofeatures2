///
/// IntersectionMatrix+HelpersTests+XCTest.swift
///
/// Copyright 2016 Tony Stone
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
///  Created by Tony Stone on 5/4/16.
///
import XCTest

///
/// NOTE: This file was auto generated by file process_test_files.rb.
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

extension IntersectionMatrixHelperTests {

   static var allTests: [(String, (IntersectionMatrixHelperTests) -> () throws -> Void)] {
      return [
                ("testPoint_Point_noIntersection", testPoint_Point_noIntersection),
                ("testPoint_Point_identicalPoints", testPoint_Point_identicalPoints),
                ("testPoint_MultiPoint_noIntersection", testPoint_MultiPoint_noIntersection),
                ("testPoint_MultiPoint_firstProperSubsetOfSecond", testPoint_MultiPoint_firstProperSubsetOfSecond),
                ("testPoint_MultiPoint_firstImproperSubsetOfSecond", testPoint_MultiPoint_firstImproperSubsetOfSecond),
                ("testMultiPoint_Point_noIntersection", testMultiPoint_Point_noIntersection),
                ("testMultiPoint_Point_secondProperSubsetOfFirst", testMultiPoint_Point_secondProperSubsetOfFirst),
                ("testMultiPoint_Point_secondImproperSubsetOfFirst", testMultiPoint_Point_secondImproperSubsetOfFirst),
                ("testMultiPoint_MultiPoint_noIntersection", testMultiPoint_MultiPoint_noIntersection),
                ("testMultiPoint_MultiPoint_firstIntersectsSecondButNotSubset", testMultiPoint_MultiPoint_firstIntersectsSecondButNotSubset),
                ("testMultiPoint_MultiPoint_firstProperSubsetOfSecond", testMultiPoint_MultiPoint_firstProperSubsetOfSecond),
                ("testMultiPoint_MultiPoint_secondProperSubsetOfFirst", testMultiPoint_MultiPoint_secondProperSubsetOfFirst),
                ("testMultiPoint_MultiPoint_firstImproperSubsetOfSecond", testMultiPoint_MultiPoint_firstImproperSubsetOfSecond),
                ("testPoint_LineString_noIntersection", testPoint_LineString_noIntersection),
                ("testPoint_LineString_firstSubsetOfSecondInterior", testPoint_LineString_firstSubsetOfSecondInterior),
                ("testPoint_LineString_firstSubsetOfSecondBoundary", testPoint_LineString_firstSubsetOfSecondBoundary),
                ("testPoint_LinearRing_noIntersection", testPoint_LinearRing_noIntersection),
                ("testPoint_LinearRing_firstSubsetOfSecondInterior", testPoint_LinearRing_firstSubsetOfSecondInterior),
                ("testPoint_MultiLineString_noIntersection", testPoint_MultiLineString_noIntersection),
                ("testPoint_MultiLineString_firstSubsetOfSecondInterior", testPoint_MultiLineString_firstSubsetOfSecondInterior),
                ("testPoint_MultiLineString_firstSubsetOfSecondBoundary", testPoint_MultiLineString_firstSubsetOfSecondBoundary),
                ("testMultiPoint_LineString_noIntersection", testMultiPoint_LineString_noIntersection),
                ("testMultiPoint_LineString_firstSubsetOfSecondInterior", testMultiPoint_LineString_firstSubsetOfSecondInterior),
                ("testMultiPoint_LineString_firstProperSubsetOfSecondBoundary", testMultiPoint_LineString_firstProperSubsetOfSecondBoundary),
                ("testMultiPoint_LineString_firstImproperSubsetOfSecondBoundary", testMultiPoint_LineString_firstImproperSubsetOfSecondBoundary),
                ("testMultiPoint_LineString_firstTouchesSecondInteriorAndBoundary", testMultiPoint_LineString_firstTouchesSecondInteriorAndBoundary),
                ("testMultiPoint_LineString_firstTouchesSecondInteriorAndCoversBoundary", testMultiPoint_LineString_firstTouchesSecondInteriorAndCoversBoundary),
                ("testMultiPoint_LineString_firstTouchesSecondInteriorAndExterior", testMultiPoint_LineString_firstTouchesSecondInteriorAndExterior),
                ("testMultiPoint_LineString_firstTouchesSecondBoundaryAndExterior", testMultiPoint_LineString_firstTouchesSecondBoundaryAndExterior),
                ("testMultiPoint_LineString_firstCoversSecondBoundaryAndTouchesExterior", testMultiPoint_LineString_firstCoversSecondBoundaryAndTouchesExterior),
                ("testMultiPoint_LineString_firstTouchesSecondInteriorAndBoundaryAndExterior", testMultiPoint_LineString_firstTouchesSecondInteriorAndBoundaryAndExterior),
                ("testMultiPoint_LineString_firstTouchesSecondInteriorAndExteriorAndCoversBoundary", testMultiPoint_LineString_firstTouchesSecondInteriorAndExteriorAndCoversBoundary),
                ("testMultiPoint_LinearRing_noIntersection", testMultiPoint_LinearRing_noIntersection),
                ("testMultiPoint_LinearRing_firstSubsetOfSecondInterior", testMultiPoint_LinearRing_firstSubsetOfSecondInterior),
                ("testMultiPoint_LinearRing_firstTouchesSecondInteriorAndExterior", testMultiPoint_LinearRing_firstTouchesSecondInteriorAndExterior),
                ("testMultiPoint_MultiLineString_noIntersection", testMultiPoint_MultiLineString_noIntersection),
                ("testMultiPoint_MultiLineString_firstSubsetOfSecondInterior", testMultiPoint_MultiLineString_firstSubsetOfSecondInterior),
                ("testMultiPoint_MultiLineString_firstProperSubsetOfSecondBoundary", testMultiPoint_MultiLineString_firstProperSubsetOfSecondBoundary),
                ("testMultiPoint_MultiLineString_firstImproperSubsetOfSecondBoundary", testMultiPoint_MultiLineString_firstImproperSubsetOfSecondBoundary),
                ("testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndBoundary", testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndBoundary),
                ("testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndCoversBoundary", testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndCoversBoundary),
                ("testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndExterior", testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndExterior),
                ("testMultiPoint_MultiLineString_firstTouchesSecondBoundaryAndExterior", testMultiPoint_MultiLineString_firstTouchesSecondBoundaryAndExterior),
                ("testMultiPoint_MultiLineString_firstCoversSecondBoundaryAndTouchesExterior", testMultiPoint_MultiLineString_firstCoversSecondBoundaryAndTouchesExterior),
                ("testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndBoundaryAndExterior", testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndBoundaryAndExterior),
                ("testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndExteriorAndCoversBoundary", testMultiPoint_MultiLineString_firstTouchesSecondInteriorAndExteriorAndCoversBoundary),
                ("testPoint_Polygon_outerRingOnly_noIntersection", testPoint_Polygon_outerRingOnly_noIntersection),
                ("testPoint_Polygon_outerRingAndInnerRing_outsideMainRing_noIntersection", testPoint_Polygon_outerRingAndInnerRing_outsideMainRing_noIntersection),
                ("testPoint_Polygon_outerRingAndInnerRing_insideInnerRing_noIntersection", testPoint_Polygon_outerRingAndInnerRing_insideInnerRing_noIntersection),
                ("testPoint_Polygon_outerRingOnly_intersectsBoundary", testPoint_Polygon_outerRingOnly_intersectsBoundary),
                ("testPoint_Polygon_outerRingAndInnerRing_intersectsOuterBoundary", testPoint_Polygon_outerRingAndInnerRing_intersectsOuterBoundary),
                ("testPoint_Polygon_outerRingAndInnerRing_intersectsInnerBoundary", testPoint_Polygon_outerRingAndInnerRing_intersectsInnerBoundary),
                ("testPoint_Polygon_outerRingOnly_intersectsInterior", testPoint_Polygon_outerRingOnly_intersectsInterior),
                ("testPoint_Polygon_outerRingAndInnerRing_intersectsInterior", testPoint_Polygon_outerRingAndInnerRing_intersectsInterior),
                ("testPoint_MultiPolygon_outerRingsOnly_noIntersection", testPoint_MultiPolygon_outerRingsOnly_noIntersection),
                ("testPoint_MultiPolygon_outerRingAndInnerRings_outsideMainRings_noIntersection", testPoint_MultiPolygon_outerRingAndInnerRings_outsideMainRings_noIntersection),
                ("testPoint_MultiPolygon_outerRingAndInnerRing_insideInnerRing_noIntersection", testPoint_MultiPolygon_outerRingAndInnerRing_insideInnerRing_noIntersection),
                ("testPoint_MultiPolygon_outerRingOnly_intersectsBoundary", testPoint_MultiPolygon_outerRingOnly_intersectsBoundary),
                ("testPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterBoundary", testPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterBoundary),
                ("testPoint_MultiPolygon_outerRingAndInnerRing_intersectsInnerBoundary", testPoint_MultiPolygon_outerRingAndInnerRing_intersectsInnerBoundary),
                ("testPoint_MultiPolygon_outerRingOnly_intersectsInterior", testPoint_MultiPolygon_outerRingOnly_intersectsInterior),
                ("testPoint_MultiPolygon_outerRingAndInnerRing_intersectsInterior", testPoint_MultiPolygon_outerRingAndInnerRing_intersectsInterior),
                ("testMultiPoint_Polygon_outerRingOnly_noIntersection", testMultiPoint_Polygon_outerRingOnly_noIntersection),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_outsideMainRing_noIntersection", testMultiPoint_Polygon_outerRingAndInnerRing_outsideMainRing_noIntersection),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_insideInnerRing_noIntersection", testMultiPoint_Polygon_outerRingAndInnerRing_insideInnerRing_noIntersection),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_outsideMainRingAndInsideInnerRings_noIntersection", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_outsideMainRingAndInsideInnerRings_noIntersection),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsBoundaryOnly", testMultiPoint_Polygon_outerRingOnly_intersectsBoundaryOnly),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsOuterBoundaryOnly", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsOuterBoundaryOnly),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInnerBoundaryOnly", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInnerBoundaryOnly),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsOuterAndInnerBoundaries", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsOuterAndInnerBoundaries),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsOuterAndInnerBoundaries", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsOuterAndInnerBoundaries),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsInteriorOnly", testMultiPoint_Polygon_outerRingOnly_intersectsInteriorOnly),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorOnly", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorOnly),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorOnly", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorOnly),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndBoundary", testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndBoundary),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndOuterBoundary", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndOuterBoundary),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndInnerBoundary", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndInnerBoundary),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndOuterAndInnerBoundaries", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndOuterAndInnerBoundaries),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndOuterAndInnerBoundaries", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndOuterAndInnerBoundaries),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndExterior", testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndExterior),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndExteriorOfMainRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndExteriorOfMainRing),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndExteriorWithinInnerRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndExteriorWithinInnerRing),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndExteriorOfMainRingAndWithinInnerRings),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsBoundaryAndExterior", testMultiPoint_Polygon_outerRingOnly_intersectsBoundaryAndExterior),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorOfMainRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorOfMainRing),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorWithinInnerRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorWithinInnerRing),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsBoundaryAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsBoundaryAndExteriorOfMainRingAndWithinInnerRings),
                ("testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndBoundaryAndExterior", testMultiPoint_Polygon_outerRingOnly_intersectsInteriorAndBoundaryAndExterior),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndMainBoundaryAndExteriorOfMainRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndMainBoundaryAndExteriorOfMainRing),
                ("testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndBothMainAndInnerBoundaryAndExteriorWithinInnerRingAndOutsideMainRing", testMultiPoint_Polygon_outerRingAndInnerRing_intersectsInteriorAndBothMainAndInnerBoundaryAndExteriorWithinInnerRingAndOutsideMainRing),
                ("testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndInnerBoundariesAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_Polygon_outerRingAndMultipleInnerRings_intersectsInteriorAndInnerBoundariesAndExteriorOfMainRingAndWithinInnerRings),
                ("testMultiPoint_MultiPolygon_outerRingOnly_noIntersection", testMultiPoint_MultiPolygon_outerRingOnly_noIntersection),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_outsideMainRing_noIntersection", testMultiPoint_MultiPolygon_outerRingAndInnerRing_outsideMainRing_noIntersection),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_insideInnerRing_noIntersection", testMultiPoint_MultiPolygon_outerRingAndInnerRing_insideInnerRing_noIntersection),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_outsideMainRingAndInsideInnerRings_noIntersection", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_outsideMainRingAndInsideInnerRings_noIntersection),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsBoundaryOnly", testMultiPoint_MultiPolygon_outerRingOnly_intersectsBoundaryOnly),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterBoundaryOnly", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterBoundaryOnly),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInnerBoundaryOnly", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInnerBoundaryOnly),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterAndInnerBoundaries", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsOuterAndInnerBoundaries),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsOuterAndInnerBoundaries", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsOuterAndInnerBoundaries),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorOnly", testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorOnly),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorOnly", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorOnly),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorOnly", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorOnly),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndBoundary", testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndBoundary),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndOuterBoundary", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndOuterBoundary),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndInnerBoundary", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndInnerBoundary),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndOuterAndInnerBoundaries", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndOuterAndInnerBoundaries),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndOuterAndInnerBoundaries", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndOuterAndInnerBoundaries),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndExterior", testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndExterior),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndExteriorOfMainRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndExteriorOfMainRing),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndExteriorWithinInnerRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndExteriorWithinInnerRing),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndExteriorOfMainRingAndWithinInnerRings),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsBoundaryAndExterior", testMultiPoint_MultiPolygon_outerRingOnly_intersectsBoundaryAndExterior),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorOfMainRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorOfMainRing),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorWithinInnerRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsBoundaryAndExteriorWithinInnerRing),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsBoundaryAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsBoundaryAndExteriorOfMainRingAndWithinInnerRings),
                ("testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndBoundaryAndExterior", testMultiPoint_MultiPolygon_outerRingOnly_intersectsInteriorAndBoundaryAndExterior),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndMainBoundaryAndExteriorOfMainRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndMainBoundaryAndExteriorOfMainRing),
                ("testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndBothMainAndInnerBoundaryAndExteriorWithinInnerRingAndOutsideMainRing", testMultiPoint_MultiPolygon_outerRingAndInnerRing_intersectsInteriorAndBothMainAndInnerBoundaryAndExteriorWithinInnerRingAndOutsideMainRing),
                ("testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndInnerBoundariesAndExteriorOfMainRingAndWithinInnerRings", testMultiPoint_MultiPolygon_outerRingAndMultipleInnerRings_intersectsInteriorAndInnerBoundariesAndExteriorOfMainRingAndWithinInnerRings),
                ("testLineString_Point_noIntersection", testLineString_Point_noIntersection),
                ("testLineString_Point_firstSubsetOfSecondInterior", testLineString_Point_firstSubsetOfSecondInterior),
                ("testLineString_Point_firstSubsetOfSecondBoundary", testLineString_Point_firstSubsetOfSecondBoundary),
                ("testLineString_MultiPoint_noIntersection", testLineString_MultiPoint_noIntersection),
                ("testLineString_MultiPoint_firstSubsetOfSecondInterior", testLineString_MultiPoint_firstSubsetOfSecondInterior),
                ("testLineString_MultiPoint_firstProperSubsetOfSecondBoundary", testLineString_MultiPoint_firstProperSubsetOfSecondBoundary),
                ("testLineString_MultiPoint_firstImproperSubsetOfSecondBoundary", testLineString_MultiPoint_firstImproperSubsetOfSecondBoundary),
                ("testLineString_MultiPoint_firstTouchesSecondInteriorAndBoundary", testLineString_MultiPoint_firstTouchesSecondInteriorAndBoundary),
                ("testLineString_MultiPoint_firstTouchesSecondInteriorAndCoversBoundary", testLineString_MultiPoint_firstTouchesSecondInteriorAndCoversBoundary),
                ("testLineString_MultiPoint_firstTouchesSecondInteriorAndExterior", testLineString_MultiPoint_firstTouchesSecondInteriorAndExterior),
                ("testLineString_MultiPoint_firstTouchesSecondBoundaryAndExterior", testLineString_MultiPoint_firstTouchesSecondBoundaryAndExterior),
                ("testLineString_MultiPoint_firstCoversSecondBoundaryAndTouchesExterior", testLineString_MultiPoint_firstCoversSecondBoundaryAndTouchesExterior),
                ("testLineString_MultiPoint_firstTouchesSecondInteriorAndBoundaryAndExterior", testLineString_MultiPoint_firstTouchesSecondInteriorAndBoundaryAndExterior),
                ("testLineString_MultiPoint_firstTouchesSecondInteriorAndExteriorAndCoversBoundary", testLineString_MultiPoint_firstTouchesSecondInteriorAndExteriorAndCoversBoundary),
                ("testLineString_LineString_noIntersection", testLineString_LineString_noIntersection),
                ("testLineString_LineString_interiorsIntersectAtOnePointFirstSegments", testLineString_LineString_interiorsIntersectAtOnePointFirstSegments),
                ("testLineString_LineString_interiorsIntersectAtOnePointSecondSegments", testLineString_LineString_interiorsIntersectAtOnePointSecondSegments),
                ("testLineString_LineString_interiorsIntersectAtTwoPointsBothSegments", testLineString_LineString_interiorsIntersectAtTwoPointsBothSegments),
                ("testLineString_LineString_firstInteriorIntersectsSecondBoundary", testLineString_LineString_firstInteriorIntersectsSecondBoundary),
                ("testLineString_LineString_firstInteriorIntersectsSecondBoundary_FirstBoundaryPoint", testLineString_LineString_firstInteriorIntersectsSecondBoundary_FirstBoundaryPoint),
                ("testLineString_LineString_firstInteriorIntersectsSecondBoundary_SecondBoundaryPoint", testLineString_LineString_firstInteriorIntersectsSecondBoundary_SecondBoundaryPoint),
                ("testLineString_LineString_firstInteriorIntersectsSecondBoundary_BothBoundaryPoints", testLineString_LineString_firstInteriorIntersectsSecondBoundary_BothBoundaryPoints),
                ("testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_IdenticalLineStrings", testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_IdenticalLineStrings),
                ("testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesFirstBoundaryPoint", testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesFirstBoundaryPoint),
                ("testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesSecondBoundaryPoint", testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesSecondBoundaryPoint),
                ("testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesNeitherBoundaryPoint", testLineString_LineString_firstInteriorDoesNotIntersectSecondExterior_FirstSubsetOfSecondAndTouchesNeitherBoundaryPoint)
           ]
   }
}
