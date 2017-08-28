# anagrams

The result of an msft3c coding challenge I did to kill time.

[https://msft3c.com/preview/0](https://msft3c.com/preview/0)


## A variation on anagrams | 1 point(s)

Let's assume you were recently hired by a Start-up. On the first day,
you meet the CEO and are given an assignment. Your CEO has decided
that all products will be named according to the following pattern.

Your CEO calls the pattern “P@tter”. Two product names obey P@tter
if they are permutations of each other, ignoring spaces and capitalization.

Your task is to determine whether two product names obey P@tter.

### Input definition

The input will consist of two product names per line, in quotation
marks, which are not part of the names. The quoted names will be
separated by a comma and potentially whitespace.

You can assume that there will be ≤ 1000 lines in the input file.
Also, product name length will be ≤ 255 characters and product names
will contain only ASCII characters.

### Output definition

For each line of input, output the result in one of the following 2
ways (case sensitive):

- Valid Pattern
- Invalid Pattern

#### Example input

	"Calculate", "Acute Call"
	"Drop Cue" , "Cued Pro"
	"carE Not", "raCe On"

#### Example output

	Valid Pattern
	Valid Pattern
	Invalid Pattern
