//
//  Library.h
//  Acorn
//
//  Created by Matt Ryder on 25/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Library : NSObject {
    NSString *libraryLocation;
}

@property (nonatomic, retain) NSString* LibraryLocation;

-(void) initializeLibrary:(NSString*) libraryLocation;

@end
