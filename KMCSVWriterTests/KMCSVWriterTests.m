//
//  KMCSVWriterTests.m
//  KMCSVWriterTests
//
//  Created by Mikael Konutgan on 27/12/13.
//  Copyright (c) 2013 Mikael Konutgan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "KMCSVWriter.h"

@interface KMCSVWriterTests : XCTestCase

@property (strong, nonatomic) KMCSVWriter *CSVWriter;

@end

@implementation KMCSVWriterTests

- (void)setUp
{
    [super setUp];
    
    NSArray *headers = @[@"A", @"B", @"C"];
    self.CSVWriter = [[KMCSVWriter alloc] initWithHeaders:headers separator:@","];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertEqualObjects(self.CSVWriter.CSVString, @"A,B,C\n", @"");
    
    NSArray *CSVRow = @[@"X", @"Y", @"Z"];
    [self.CSVWriter appendCSVRow:CSVRow];
    
    XCTAssertEqualObjects(self.CSVWriter.CSVString, @"A,B,C\nX,Y,Z\n", @"");
}

@end
