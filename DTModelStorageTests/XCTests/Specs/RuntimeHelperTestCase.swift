//
//  RuntimeHelperTestCase.swift
//  DTModelStorageTests
//
//  Created by Denys Telezhkin on 15.07.15.
//  Copyright (c) 2015 Denys Telezhkin. All rights reserved.
//

import UIKit
import XCTest
import DTModelStorage
import Nimble

class SwiftCell:UITableViewCell{}

class RuntimeHelperTestCase: XCTestCase {

    func testSummaryOfObjectiveCClasses()
    {
        let mirror = _reflect(UITableViewCell)
        expect(RuntimeHelper.classNameFromReflection(mirror)) == "UITableViewCell"
        expect(RuntimeHelper.classNameFromReflectionSummary(mirror.summary)) == "UITableViewCell"
    }
    
    func testSummaryOfSwiftCells()
    {
        let mirror = _reflect(SwiftCell)
        expect(RuntimeHelper.classNameFromReflection(mirror)) == "SwiftCell"
        expect(RuntimeHelper.classNameFromReflectionSummary(mirror.summary)) == "SwiftCell"
    }
    
    func testClassClusterUIColor()
    {
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(UIColor())).summary) == _reflect(UIColor.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(UIColor.cyanColor())).summary) == _reflect(UIColor.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(UIColor(red: 0.5, green: 0.3, blue: 0.2, alpha: 0.8))).summary) == _reflect(UIColor.self).summary
    }
    
    func testClassClusterNSArray()
    {
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSArray())).summary) == _reflect(NSArray.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSMutableArray())).summary) == _reflect(NSArray.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSArray(array: [1,""]))).summary) == _reflect(NSArray.self).summary
    }
    
    func testClassClusterNSDictionary()
    {
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSDictionary())).summary) == _reflect(NSDictionary.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSMutableDictionary())).summary) == _reflect(NSDictionary.self).summary
        expect(RuntimeHelper.classClusterReflectionFromMirrorType(_reflect(NSDictionary(dictionary: [1:"2"]))).summary) == _reflect(NSDictionary.self).summary
    }

}
