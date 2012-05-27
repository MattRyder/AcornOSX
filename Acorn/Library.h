//
//  Library.h
//  Acorn
//
//  Created by Matt Ryder on 25/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LibraryParser.h"

@interface Library : NSObject {
    NSURL *libraryLocation;
    NSMutableArray *songs;
    LibraryParser *parser;
}

@property (nonatomic, retain) NSURL *LibraryLocation;
@property (nonatomic, retain) NSMutableArray *Songs;
@property (retain) LibraryParser *Parser;

-(id) initWithLibrary:(NSURL*) libLocation;
- (BOOL) parseLibrary;

@end
