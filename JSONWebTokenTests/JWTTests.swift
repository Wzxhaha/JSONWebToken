//
//  JWTTests.swift
//  JSONWebTokenTests
//
//  Created by wzxjiang on 2018/4/9.
//  Copyright © 2018 dia. All rights reserved.
//

import XCTest
@testable import JSONWebToken

func == (lhs: Algorithm?, rhs: Algorithm) -> Bool {
    guard let lhs = lhs else {
        return false
    }
    return lhs.description == rhs.description
}

class JWTTests: XCTestCase {
    func testDescription() {
        XCTAssert(Algorithm.none.description == "none")
        XCTAssert(Algorithm.hs256("").description == "HS256")
        XCTAssert(Algorithm.hs384("").description == "HS384")
        XCTAssert(Algorithm.hs512("").description == "HS512")
    }
    
    func testInit() {
        let key = "key"
        XCTAssert(Algorithm.algorithm("none", key: nil) == .none)
        XCTAssert(Algorithm.algorithm("none", key: key) == nil)
        XCTAssert(Algorithm.algorithm("HS256", key: nil) == nil)
        XCTAssert(Algorithm.algorithm("HS256", key: key) == .hs256(key))
        XCTAssert(Algorithm.algorithm("HS384", key: nil) == nil)
        XCTAssert(Algorithm.algorithm("HS384", key: key) == .hs384(key))
        XCTAssert(Algorithm.algorithm("HS512", key: nil) == nil)
        XCTAssert(Algorithm.algorithm("HS512", key: key) == .hs512(key))
        XCTAssert(Algorithm.algorithm("HS513", key: nil) == nil)
        XCTAssert(Algorithm.algorithm("xxxx", key: key) == nil)
    }
    
    func testSign() {
        let key = "key"
        XCTAssert(Algorithm.none.sign("xxx") == "")
    }
}
