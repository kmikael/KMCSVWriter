//
//  KMViewController.m
//  KMCSVWriter
//
//  Created by Mikael Konutgan on 27/12/13.
//  Copyright (c) 2013 Mikael Konutgan. All rights reserved.
//

#import "KMViewController.h"
#import "KMCSVWriter.h"

@interface KMViewController ()

@end

@implementation KMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *headers = [NSArray arrayWithObjects:@"First Name", @"Last Name", @"ID", nil];
    KMCSVWriter *CSVWriter = [[KMCSVWriter alloc] initWithHeaders:headers separator:@";"];
    
    NSArray *aRow = [NSArray arrayWithObjects:@"Mikael", @"Konutgan", @"312", nil];
    NSArray *anotherRow = [NSArray arrayWithObjects:@"Dorothea", @"Hörmann", @"697", nil];
    
    [CSVWriter appendCSVRow:aRow];
    [CSVWriter appendCSVRow:anotherRow];
    
    NSURL *URL = [[[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"test"] URLByAppendingPathExtension:@"csv"];
    NSError *error;
    
    [CSVWriter writeToURL:URL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"Failed to write csv file %@", error);
    } else {
        NSLog(@"Success writing csv to file");
        
        NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[URL path]], @"The CSV file should exist.");
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

@end
