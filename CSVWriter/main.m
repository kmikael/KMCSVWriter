
#import <Foundation/Foundation.h>

#import "CSVWriter.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *headers = [NSArray arrayWithObjects:@"First Name", @"Last Name", @"ID Number", nil];
        CSVWriter *writer = [[CSVWriter alloc] initWithHeaders:headers];
        
        NSArray *aRow = [NSArray arrayWithObjects:@"Mikael", @"Konutgan", @"312", nil];
        NSArray *anotherRow = [NSArray arrayWithObjects:@"Dorothea", @"Hoermann", @"697", nil];
        
        [writer appendRow:aRow];
        [writer appendRow:anotherRow];
        
        NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"];
        NSString *fileName = @"test.csv";
        NSString *fullPath = [filePath stringByAppendingPathComponent:fileName];
        
        NSError *error = nil;
        
        [writer writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSLog(@"Fail: %@", [error localizedDescription]);
        } else {
            NSLog(@"Success");
        }
        
    }
    return 0;
}

