//
//  KMCSVWriter.m
//  KMCSVWriter
//
//  Created by Mikael Konutgan on 27/12/13.
//  Copyright (c) 2013 Mikael Konutgan. All rights reserved.
//

#import "KMCSVWriter.h"

NSString * const KMCSVWriterDefaultColumnSeperator = @";";
NSString * const KMCSVWriterDefaultRowSeperator = @"\n";

@interface KMCSVWriter ()
{
    NSMutableString *_CSVString;
}

@property (strong, nonatomic) NSString *separator;
@property (strong, nonatomic) NSArray *headers;

@property (assign, nonatomic) NSUInteger columnCount;

@end

@implementation KMCSVWriter

- (instancetype)initWithHeaders:(NSArray *)headers separator:(NSString *)separator
{
    self = [super init];
    if (self) {
        _headers = headers;
        _separator = separator;
        
        _CSVString = [NSMutableString string];
        
        [self appendCSVRow:headers];
    }
    return self;
}

- (instancetype)initWithHeaders:(NSArray *)headers
{
    return [self initWithHeaders:headers separator:KMCSVWriterDefaultColumnSeperator];
}

- (instancetype)init
{
    return [self initWithHeaders:nil];
}

- (NSString *)CSVString
{
    return [NSString stringWithString:_CSVString];
}

- (void)_appendCSVRow:(NSArray *)CSVRow
{
    NSString *rowString = [CSVRow componentsJoinedByString:self.separator];
    [_CSVString appendString:rowString];
    [_CSVString appendString:KMCSVWriterDefaultRowSeperator];
}

- (void)appendCSVRow:(NSArray *)CSVRow
{
    if (self.columnCount == 0) {
        self.columnCount = [CSVRow count];
    }
    
    NSAssert(self.columnCount == [CSVRow count], @"Inconsistent number of columns.");
    
    [self _appendCSVRow:CSVRow];
}

- (BOOL)writeToURL:(NSURL *)URL atomically:(BOOL)atomically encoding:(NSStringEncoding)encoding error:(NSError **)error
{
    return [self.CSVString writeToURL:URL atomically:atomically encoding:encoding error:error];
}

@end
