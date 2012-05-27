//
//  LibraryParser.h
//  Acorn
//
//  Created by Matt Ryder on 27/05/2012.
//  Copyright (c) 2012 Matt Ryder. All rights reserved.
//

#import "Song.h"

@interface LibraryParser : NSObject <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableArray *songs;
    
    NSString *currentKey;
    NSMutableString *lastNodeValue, *currentStringValue;
    
    int dictCount;
    bool isValidSong;
    Song *song; //Temp buffer for a song object
}

@property (nonatomic, retain) NSXMLParser *Parser;
@property (nonatomic, retain) NSMutableArray *Songs;

- (id) initWithLibrary:(NSURL *) libLocation;
- (NSMutableArray *) tryParseLibraryXML;

//NSXMLParser instance methods:
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
    qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict;

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

@end
