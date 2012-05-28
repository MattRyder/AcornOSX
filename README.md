# AcornOSX - (https://github.com/MattRyder/AcornOSX)
A Cocoa Library for parsing "iTunes Music Library.xml" files

####To Build:
- Open AcornOSX.xcodeproj into XCode
- Build the project from the IDE.


####To Use:
- Add as a Framework reference to your project

####Examples:
    
    //
    // Parse and return a list of Song objects from the Library XML
    //
    - (NSMutableArray *)parseAndReturnSongs
    {
       //URL is statically defined here, can be used with NSOpenPanel to get a file location
       NSURL *location = [NSURL fileURLWithPath:@"/Users/USERFOO/Music/iTunes/iTunes Music Library.xml"];
       Library *library = [[Library alloc] initWithLibrary:location];
       
       if([library parseLibrary]) {
          return library.Songs; 
       } else {
          NSLog(@"%@", @"Something went wrong and parseLibrary returned NO");
          return NULL;
       }
    }