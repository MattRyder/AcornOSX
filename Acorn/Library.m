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

-(void) initializeLibrary:(NSString*) libLocation {
    self.LibraryLocation = libLocation;
    //TODO:
    //parser = new Parser(libraryLocation);
    
    //if(libraryLocation != String.Empty)
    //      parser.parse();
}

@end
