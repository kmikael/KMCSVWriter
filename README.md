## CSVWriter

CSVWriter is an extremely simple class for creating CSV files.

### Public API

- initWithHeaders:
- initWithHeaders:separator:

- appendRow:
- writeToFile:atomically:encoding:error:

If you want to use headers, initialize an instance of CSVWriter using **initWithHeaders:**. This also sets the column count and defaults the separator to ",". Otherwise use plain **init**. The column count will be set when you append the first row.

**initWithHeaders:separator:** is the designated initializer and lets you set the header-values, as well as the separator. Use ";" for compatability with iWork. Numbers lets you open the csv-file as a spreadsheet if the separator is ";".

**appendRow:** takes an array of values and appends it to the internal CSV string. It raises an exception if you use an inconsistent number of columns.

**writeToFile:atomically:encoding:error:** writes the internal CSV string to the given path.

### Notes

- There is example usage included in main.m
- The project assumes you are using Xcode 4.2 with ARC.
