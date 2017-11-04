//
//  MovieVCTests.swift
//  MovieAlbumTests
//
//  Created by Nina Yousefi on 11/3/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import XCTest
@testable import MovieAlbum

class MovieVCTests: XCTestCase {
    
    var movieVC: MovieViewController?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieVC = MovieViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        movieVC = nil
    }
    
    func testThatViewLoads() {
        XCTAssertNotNil(movieVC?.view, "View is not initiated properly!")
    }
    
    //UICollectionView Tests
    
    func testThatCollectionViewConformsToUICollectionViewDataSoure(){
        XCTAssertTrue((movieVC?.conforms(to: UICollectionViewDataSource.self))!, "View does not conform to UICollectionView datasource protocol")
    }
    
    func testThatCollectionViewHasDataSource() {
        XCTAssertNotNil(movieVC?.movieCollectionView.dataSource, "Collection View datasource cannot be nil!")
    }
    
    func testThatCollectionViewConformsToUICollectionViewDelegate(){
        XCTAssertTrue((movieVC?.conforms(to: UICollectionViewDelegate.self))!, "View does not conform to UICollectionView Delegate protocol!")
    }
    
    func testThatCollectionViewIsConnectedToDelegate() {
        XCTAssertNotNil(movieVC?.movieCollectionView.delegate, "Collection View delegate cannot be nil!")
    }
 
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
