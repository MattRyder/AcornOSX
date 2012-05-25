//
//  Song.h
//  Acorn
//
//  Created by Matt Ryder on 24/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject {
    NSArray *_attributeKeys;
    NSMutableDictionary *_songAttributes;
}

@property(nonatomic, readonly) NSArray *AttributeKeys;
@property(nonatomic, retain) NSMutableDictionary *SongAttributes;

-(void) setAttribute: (NSString *) attributeKey: (NSString *)attributeValue;
-(NSObject *) getAttribute:(NSString *) attributeKey;

@end

