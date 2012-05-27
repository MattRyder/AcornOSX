//
//  Library.h
//  Acorn
//
//  Created by Matt Ryder on 25/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Library : NSObject {
    NSMutableArray *songs;
    NSString *libraryLocation;
}

@property (nonatomic, retain) NSString *LibraryLocation;
@property (nonatomic, retain) NSMutableArray *Songs;

-(void) initializeLibrary:(NSString*) libLocation;

@end
