#!/usr/bin/env python3
import json, sys

PROGRAMMING_LANGUAGES = {
    "C", "C Header", "C++", "C++ Header", "Rust", "Python", "Perl",
    "Shell", "BASH", "Assembly", "GNU Style Assembly", "Objective-C", "Ruby"
}

with open(sys.argv[1]) as f:
    tokei_data = json.load(f)

total_loc = 0

for language in PROGRAMMING_LANGUAGES:
    language_loc = tokei_data[language]["code"]
    total_loc += language_loc

print(f"Total lines of code (programming languages only): {total_loc:_}")
