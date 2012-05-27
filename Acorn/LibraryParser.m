//
//  LibraryParser.m
//  Acorn
//
//  Created by Matt Ryder on 27/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import "LibraryParser.h"

@implementation LibraryParser

@synthesize Parser = parser;
@synthesize Songs = songs;

- (id) initWithLibrary:(NSURL *) libLocation {
    
    if(self = [super init]) {
        self.Parser = [[NSXMLParser alloc] initWithContentsOfURL:libLocation];
        [self.Parser setDelegate:self];
        
        if([self.Parser parse]) {
            NSLog(@"Parse Complete!\n");
        }
    }
    
    return self;
}

//Entered an XML Element Node:
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    currentKey = nil;
    currentStringValue = nil;
    
    if([elementName isEqualToString:@"dict"]) {
        currentKey = [elementName value];
        return;
    }
}

//Found Characters inside a node, get them:
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(currentKey) {
        if(!currentStringValue) {
            currentStringValue = [[NSMutableString alloc] initWithCapacity:256];
        }
        [currentStringValue appendString:string];
    }
}

//Hit the end of the element:
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
}

@end
