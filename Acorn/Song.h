//
//  Song.h
//  Acorn
//
//  Created by Matt Ryder on 24/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject {
    NSArray *attributeKeys;
    NSMutableDictionary *songAttributes;
}

@property(nonatomic, readonly) NSArray *AttributeKeys;
@property(nonatomic, retain) NSMutableDictionary *SongAttributes;

//Helper methods for accessing or adding an attribute
-(void) setAttribute:(NSString *)attributeKey: (NSString *)attributeValue;
-(NSObject *) getAttribute: (NSString *)attributeKey;

@end

