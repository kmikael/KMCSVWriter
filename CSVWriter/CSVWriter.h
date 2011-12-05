
#import <Foundation/Foundation.h>

@interface CSVWriter : NSObject

// This is the designated initializer.
// It takes an array of header-values and the character to seperate the values of the csv-file.

- (id)initWithHeaders:(NSArray *)headers seperator:(NSString *)seperator;

// The seperator defaults to ",".

- (id)initWithHeaders:(NSArray *)headers;



// Append a row a values to the csv-string. Raises an exception if the number of columns are inconsistent.

- (void)appendRow:(NSArray *)row;

// Writes the csv-string to given path.

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;

@end
