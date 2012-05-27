//
//  AcornTests.m
//  AcornTests
//
//  Created by Matt Ryder on 24/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AcornTests.h"

@implementation AcornTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSURL *url = [NSURL fileURLWithPath:@"/Users/matt/Music/iTunes/iTunes Music Library.xml"];
    Library *library = [[Library alloc] initWithLibrary:url];
}

@end
