
#import <Foundation/Foundation.h>

@interface CSVWriter : NSObject

- (id)initWithHeaders:(NSArray *)headers;
- (void)appendRow:(NSArray *)row;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;

@end
