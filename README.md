# KMCSVWriter

`KMCSVWriter` is an extremely simple class for creating CSV files.

## Usage

```objective-c
NSArray *headers = [NSArray arrayWithObjects:@"First Name", @"Last Name", @"ID", nil];

KMCSVWriter *CSVWriter = [[KMCSVWriter alloc] initWithHeaders:headers separator:@";"];
    
NSArray *aRow = [NSArray arrayWithObjects:@"Mikael", @"Konutgan", @"312", nil];
NSArray *anotherRow = [NSArray arrayWithObjects:@"Dorothea", @"Hörmann", @"697", nil];
    
[CSVWriter appendCSVRow:aRow];
[CSVWriter appendCSVRow:anotherRow];
    
NSURL *URL = [[[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"test"] URLByAppendingPathExtension:@"csv"];
NSError *error;
    
[CSVWriter writeToURL:URL atomically:YES encoding:NSUTF8StringEncoding error:&error];

// Handle the error or use the csv file
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
