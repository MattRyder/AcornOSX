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

//
//Given a valid Library XML location, -parseLibrary should return YES to pass
//
- (void)testLocationValid
{
    NSURL *url = [NSURL fileURLWithPath:@"/Users/matt/Music/iTunes/iTunes Music Library.xml"];
    Library *library = [[Library alloc] initWithLibrary:url];
    
    STAssertEquals([library parseLibrary], YES, nil);
}

//
//Given an invalid NSURL pointing to an incorrect location, -parseLibrary will return NO
//
- (void)testLocationInvalid
{
    NSURL *url = [NSURL fileURLWithPath:@"/Users/matt/Music/foo/iTunes Music Library.xml"];
    Library *library = [[Library alloc] initWithLibrary:url];

    STAssertEquals([library parseLibrary], NO, nil);
}

//
//Checks that the Song objects in library.Songs are returning < 0 attributes
//
- (void)testIfSongsHaveAttributes
{
    NSURL *url = [NSURL fileURLWithPath:@"/Users/matt/Music/iTunes/iTunes Music Library.xml"];
    Library *library = [[Library alloc] initWithLibrary:url];
    
    for (Song *song in library.Songs) {
        if([song.SongAttributes count] == 0) {
            STFail(@"No attributes for Song!");
        }
    }
}

@end
