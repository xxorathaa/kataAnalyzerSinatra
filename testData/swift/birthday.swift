//
//  PeopleListDataProviderTests.swift
//  Birthdays
//
//  Created by dasdom on 29.03.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import XCTest
import Birthdays
import CoreData

class PeopleListDataProviderTests: XCTestCase {

  var storeCoordinator: NSPersistentStoreCoordinator!
  var managedObjectContext: NSManagedObjectContext!
  var managedObjectModel: NSManagedObjectModel!
  var store: NSPersistentStore!

  var dataProvider: PeopleListDataProvider!

  var tableView: UITableView!
  var testRecord: PersonInfo!

  override func setUp() {
    super.setUp()

    managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
    storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    store = storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)

    managedObjectContext = NSManagedObjectContext()
    managedObjectContext.persistentStoreCoordinator = storeCoordinator

    dataProvider = PeopleListDataProvider()
    dataProvider.managedObjectContext = managedObjectContext

    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PeopleListViewController") as! PeopleListViewController
    viewController.dataProvider = dataProvider

    tableView = viewController.tableView

    testRecord = PersonInfo(firstName: "TestFirstName", lastName: "TestLastName", birthday: NSDate())
  }

  override func tearDown() {

    managedObjectContext = nil

    var error: NSError? = nil
    XCTAssert(storeCoordinator.removePersistentStore(store, error: &error), "couldn't remove persistant store: \(error)")

    super.tearDown()
  }

  func testThatStoreIsSetUp() {
    XCTAssertNotNil(store, "no persitant store")
  }

  func testOnePersonInThePersistantStoreResultsInOneSection() {

    dataProvider.addPerson(testRecord)

    XCTAssertEqual(tableView.dataSource!.numberOfSectionsInTableView!(tableView), 1, "After adding one person number of sections should be 1")

  }

  func testOnePersonInThePersistantStoreResultsInOneRow() {

    dataProvider.addPerson(testRecord)

    XCTAssertEqual(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0), 1, "After adding one person number of rows should be 1")

  }

  func testPersonCellShowsFullName() {

    dataProvider.addPerson(testRecord)

    let cell = tableView.dataSource!.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as UITableViewCell

    XCTAssertEqual(cell.textLabel!.text!, "TestFirstName TestLastName", "Full name is not as expected")
  }

}
