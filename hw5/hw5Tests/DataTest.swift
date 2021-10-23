//
//  DataTest.swift
//  hw5Tests
//
//  Created by aprirez on 10/23/21.
//

import XCTest
@testable import hw5

class DataTest: XCTestCase {
    
    var testBundle: Bundle!

    override func setUpWithError() throws {
        super.setUp()
        testBundle = Bundle(for: type(of: self))
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testFileJsonDecoder_Positive() {
        let decodeResult = FileJsonDecoder<Persons>
            .decode(file: "Person", from: testBundle)
        XCTAssertNotNil(decodeResult)
        
        guard let persons = decodeResult else {return}
        
        XCTAssertEqual(persons.person.count, 3)

        XCTAssertEqual(persons.person[0].name, "Test1")
        XCTAssertEqual(persons.person[0].age, "31")

        XCTAssertEqual(persons.person[1].name, "Test2")
        XCTAssertEqual(persons.person[1].age, "32")

        XCTAssertEqual(persons.person[2].name, "Test3")
        XCTAssertEqual(persons.person[2].age, "33")
    }

    func testFileJsonDecoder_Negative() {
        var decodeResult = FileJsonDecoder<Persons>
            .decode(file: "PersonBad", from: testBundle)
        XCTAssertNil(decodeResult)

        decodeResult = FileJsonDecoder<Persons>
            .decode(file: "NoSuchFile", from: testBundle)
        XCTAssertNil(decodeResult)
    }

}
