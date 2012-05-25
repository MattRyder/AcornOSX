//
//  Song.m
//  Acorn
//
//  Created by Matt Ryder on 24/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Song.h"

@implementation Song

@synthesize AttributeKeys = _attributeKeys;
@synthesize SongAttributes = _songAttributes;

- (id) init {
    if(self = [super init]) {
        
        //Use this to check if an attribute is being indexed by Acorn:
        _attributeKeys = [[NSArray alloc] initWithObjects: @"Track ID", @"Name", @"Artist", @"Album Artist", 
                       @"Album", @"Genre", @"Kind", @"Size", @"Total Time", @"Track Number",
                       @"Track Count", @"Year", @"Date Modified", @"Date Added", @"Bit Rate",
                       @"Sample Rate", @"Comments", @"Skip Count", @"Skip Date", @"Persistent ID", 
                       @"Location", nil];
        
        _songAttributes = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) setAttribute: (NSString *) attributeKey: (NSString *)attributeValue {
    [self.SongAttributes setObject:attributeValue forKey:attributeKey];
}

- (NSObject *) getAttribute:(NSString *) attributeKey {
    return [self.SongAttributes objectForKey:attributeKey];
}

@end
