#!/usr/bin/python3
from pybtex.database import parse_file
import argparse
from pathlib import Path

def main(args):
    bib_data = parse_file(args.f)
    for entry in bib_data.entries.items():
        try:
            print(f"{entry[0]} -- {format_authors(entry[1])} ({entry[1].fields['year']}), \"{entry[1].fields['title']}\"")
        except Exception as e:
            print(e)
            continue

def format_authors(entry):
    authors = entry.persons['author']
    try:
        first = authors[0].bibtex_first_names[0]
    except KeyError:
        first = ""
    try:
        last = authors[0].last_names[0]
    except KeyError:
        last = ""
    str_authors = f"{first} {last}"
    if len(authors) > 1:
        str_authors = f"{last} et al" 
    return str_authors


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", help="string to search")
    parser.add_argument("-f", help="File to search in", type=Path, required=True)
    args = parser.parse_args()
    main(args)



