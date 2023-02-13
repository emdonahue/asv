# asv
ASCII Separated Values

asv is a suite of tools for working with tabular text data, oriented around text data mining applications. The tools are analagous to those one would apply to the comma-separated value and tab-separated value file types, but asv uses ASCII control characters as delimiters, which eliminates the need to worry about malformed files when working  with arbitrary (printable) text data containing tabs, commas, newlines, etc.

The file type asv assumes consists of a set of null-character-separated rows in which fields are separated by the ASCII Record Separator character. The ASCII Unit Separator is used for array-valued fields that contain multiple distinct objects, and the Group Separator is used for transient computations. The first line of every asv file is assumed to be the header, which is preserved by all operations, but otherwise shares the same bit format as other rows.

This format was chosen because most common unix tools support a -z flag to enable null-terminated lines, which allows easy manipulation of the asv file using other tools in addition to those supplied here.

## Documentation
```
asv - ASCII-Separated Values
Tabular text data manipulation using ASCII control characters as table structure. 
Usage: asv SUBCOMMAND [ARGUMENTS...]

Subcommands:
	asv2tsv [ASV]	Converts ASV into a tsv.
	awk [OPTION]...	Runs awk on the rows of the asv on stdin.
	check [ASV]	Checks the integrity of the ASV in terms of column count and datatype consistency and presence of nulls.
	count FIELD[,FIELD]... [ASV]	Aggregates and counts the rows grouped by FIELD ids.
	cut [OPTION]...	Acts like unix cut on the asv using field names or ids.
	head N [ASV]	Prints the first N rows.
	header HEADER...	Sets the headers for the asv supplied on stdin to the list of HEADERS.
	--help|-h|help [SUBCOMMAND]	Prints help text for SUBCOMMAND. If SUBCOMMAND omitted, prints list of subcommands.
	group FIELD[,FIELD]... [ASV]	Creates an grouped column at position 1 by concatenating and sorting values from the comma-separated list of fields. The fields are then removed from the table until it is unjoined. Useful for aggregate functions and multi-column joins.
	join [OPTION]... FILE1 FILE2	Runs unix join on the two files.
	less [ASV]	Lightly formats the table and pipes it to less for inspection.
	plot [ASV]...	Plots the data with gnuplot.
	project [OPTIONS]... FIELD[,FIELD]...	Similar to cut, but limited to comma syntax and allows column rearrangement and column names in addition to indices.
	rows COMMAND	Prints the header of the asv on stdin then executes an arbitrary unix COMMAND with the rows on stdin.
	schema ASV	Prints the table headers along with their indices for use in other commands.
	select [OPTION]... REGEX [ASV]	Selects rows in which a value matches REGEX.
	size ASV	Counts the rows in ASV.
	sort [OPTION]...	Runs unix sort on just the rows of the asv supplied on stdin.
	ungroup [ASV]	Ungroups the group column and restores the multiple columns from which it was computed. Use after multi-column joins or aggregates to restore a complete table.
	uniq [OPTION]... [ASV]	Performs unix uniq on the asv on stdin.
	update PATTERN REPLACEMENT [ASV]	Replaces regex PATTERN with REPLACEMENT, which may use back references.
	tail N [ASV]	Prints the last N rows.
	tokenize TOKENS [TOKENS...]	Converts each whitespace-separated TOKENS file into a token table and concatenates them all.
	tsv2asv [HEADER...]	Converts TSV on stdin into an asv table using HEADERS as the columns. If no HEADERS are supplied, the first row of TSV is used as the header.
```
## TODO
- Add -f field selection to update
- Normalize all commands to take stdin or else manually parse flags for unix tools and pass them through to allow for uniform syntax
