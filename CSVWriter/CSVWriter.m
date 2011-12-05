
#import "CSVWriter.h"

@interface CSVWriter ()

@property (strong, nonatomic) NSMutableString *cSVString;
@property (strong, nonatomic) NSString *separator;
@property (nonatomic) NSUInteger columnCount;

@end

@implementation CSVWriter

@synthesize separator = _separator, cSVString = _cSVString, columnCount = _columnCount;

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
    
    NSString *newRow = [row componentsJoinedByString:self.separator];
    [self.cSVString appendString:@"\n"];
    [self.cSVString appendString:newRow];
}

- (id)initWithHeaders:(NSArray *)headers separator:(NSString *)separator
{
    self = [super init];
    if (self) {
        _separator = separator;
        _cSVString = [[NSMutableString alloc] init];
        _columnCount = 0;
        if (headers != nil && [headers count] != 0) {
            _columnCount = [headers count];
            NSString *headerRow = [headers componentsJoinedByString:self.separator];
            [_cSVString appendString:headerRow];
        }
    }
    return self;
}

- (id)initWithHeaders:(NSArray *)headers
{
    self = [self initWithHeaders:headers separator:@","];
    return self;
}

- (id)init
{
    self = [self initWithHeaders:nil separator:@","];
    return self;
}

@end
