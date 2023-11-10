import XCTest
@testable import DogsWeLove

final class DogsWeLoveTests: XCTestCase {

    func testFetchDogs() {
        let expectation = XCTestExpectation(description: "fetchDogs completes")
        var responseError: Error?
        var responseDogs: [DogData]?
        
        APIManager.shared.fetchDogs { dogs, error in
            responseDogs = dogs
            responseError = error
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertNil(responseError, "fetchDogs should not return an error")
        XCTAssertNotNil(responseDogs, "fetchDogs should return a list of dogs")
        XCTAssertEqual(responseDogs?.count, 5, "fetchDogs should return 5 dogs")
    }
}
