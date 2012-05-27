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
    
    isValidSong = true;
    self.Songs = [[NSMutableArray alloc] initWithCapacity:1024];
    
    if(self = [super init]) {
        self.Parser = [[NSXMLParser alloc] initWithContentsOfURL:libLocation];
        [self.Parser setDelegate:self];
    }
    
    return self;
}

- (NSMutableArray *) tryParseLibraryXML {
    if([self.Parser parse] && self.Songs)
        return self.Songs;
    else
        return NULL;
}

//Entered an XML Element Node:
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    currentKey = nil;
    currentStringValue = nil;
    
    if([elementName isEqualToString:@"dict"]) {
        currentKey = elementName;
        dictCount++;
        song = [[Song alloc] init];
        
        return;
    }
    
    if([song.AttributeKeys containsObject:elementName] || [elementName isEqualToString:@"key"]) {
        currentKey = elementName;
    }
    
    if([elementName isEqualToString:@"integer"] || [elementName isEqualToString:@"string"]
       || [elementName isEqualToString:@"true"] || [elementName isEqualToString:@"false"]
       || [elementName isEqualToString:@"date"]) {
        currentKey = elementName;
    }
}

//Found Characters inside a node, get them:
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(currentKey && dictCount == 3) {
        
        if(!currentStringValue) {
            currentStringValue = [[NSMutableString alloc] initWithCapacity:256];
        }
        if(!lastNodeValue) {
            lastNodeValue = [[NSMutableString alloc] initWithCapacity:256];
        }
        
        [currentStringValue appendString:string];
        
        if([lastNodeValue isEqualToString:@"Kind"] && [string rangeOfString:@"audio"].location == NSNotFound) {
            isValidSong = false;
            return;
        }
        
        //Is it an attribute we're looking for?:
        if([song.AttributeKeys containsObject:lastNodeValue]) {
            [song setAttribute:lastNodeValue :string];
        } 
    }
    lastNodeValue = currentStringValue; //Swap the node over so we remember it
}

//Hit the end of the element:
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"dict"]) {
        dictCount--;
        
        //Check if we've got a valid song to add:
        if(([song.SongAttributes count] > 0) && isValidSong) {
            [self.Songs addObject:song];
        }
        isValidSong = true; //Reset valid song flag
        
        
        //We've just left a <dict> element, check if all "Tracks" have been parsed:
        if ([self.Songs count] > 0 && dictCount < 2) {
            [self.Parser abortParsing];
        }
        return;
    }
    
}

@end
