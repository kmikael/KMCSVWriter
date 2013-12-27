//
//  KMCSVWriter.h
//  KMCSVWriter
//
//  Created by Mikael Konutgan on 27/12/13.
//  Copyright (c) 2013 Mikael Konutgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMCSVWriter : NSObject

@property (nonatomic, readonly) NSString *separator;
@property (nonatomic, readonly) NSArray *headers;

@property (nonatomic, readonly) NSString *CSVString;

- (instancetype)initWithHeaders:(NSArray *)headers separator:(NSString *)separator;
- (instancetype)initWithHeaders:(NSArray *)headers;
- (instancetype)init;

- (void)appendCSVRow:(NSArray *)CSVRow;

- (BOOL)writeToURL:(NSURL *)URL atomically:(BOOL)atomically encoding:(NSStringEncoding)encoding error:(NSError **)error;

@end
