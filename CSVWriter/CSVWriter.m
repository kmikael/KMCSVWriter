
#import "CSVWriter.h"

@interface CSVWriter ()

@property (strong, nonatomic) NSMutableString *cSVString;
@property (strong, nonatomic) NSString *seperator;
@property (nonatomic) NSUInteger columnCount;

@end

@implementation CSVWriter

@synthesize seperator = _seperator, cSVString = _cSVString, columnCount = _columnCount;

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error
{
    BOOL written = [self.cSVString writeToFile:path atomically:useAuxiliaryFile encoding:enc error:error];
    return written;
}

- (void)appendRow:(NSArray *)row
{
    if (self.columnCount == 0) {
        self.columnCount = [row count];
    }
    
    if ([row count] != self.columnCount) {
        @throw [NSException exceptionWithName:@"WrongColCount" reason:@"Inconsistent number of columns." userInfo:nil];
    }
    
    NSString *newRow = [row componentsJoinedByString:self.seperator];
    [self.cSVString appendString:@"\n"];
    [self.cSVString appendString:newRow];
}

- (id)initWithHeaders:(NSArray *)headers
{
    self = [super init];
    if (self) {
        _seperator = @",";
        _cSVString = [[NSMutableString alloc] init];
        _columnCount = 0;
        if (headers != nil && [headers count] != 0) {
            _columnCount = [headers count];
            NSString *headerRow = [headers componentsJoinedByString:self.seperator];
            [_cSVString appendString:headerRow];
        }
    }
    return self;
}

- (id)init
{
    self = [self initWithHeaders:nil];
    return self;
}

@end
