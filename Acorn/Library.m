//
//  Library.m
//  Acorn
//
//  Created by Matt Ryder on 25/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import "Library.h"

@implementation Library

@synthesize LibraryLocation = libraryLocation;
@synthesize Songs = songs;
@synthesize Parser = parser;

- (id) initWithLibrary:(NSURL*) libLocation {
    
    if(self = [super init]) {
        self.LibraryLocation = libLocation;
        self.Parser = [[LibraryParser alloc] initWithLibrary:libLocation];
    }
    
    return self;
}

- (BOOL) parseLibrary {
    if((self.Songs = [self.Parser tryParseLibraryXML])) {
        return true;
    } else return false;
}

@end
