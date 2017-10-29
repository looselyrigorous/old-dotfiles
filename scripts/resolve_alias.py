#!/usr/bin/python

'''
Resolve POSIX path from macOS alias(es)
'''

from __future__ import print_function
import argparse
import sys
from Foundation import (NSURL,
                        NSURLBookmarkResolutionWithoutUI,
                        NSURLBookmarkResolutionWithoutMounting)

def check_if_alias(path):
    """ Simple checks to see if file is an alias """
    try:
        with open(path, "rb") as f:
            header = f.read(16)
    except IOError as e:
        return False

    # Check inspired from file(1)
    if header != "book\0\0\0\0mark\0\0\0\0":
        return False
    return True

def target_of_alias(path):
    ''' Find the path referenced by alias '''
    url = NSURL.fileURLWithPath_(path)
    bookmark_data, error = \
        NSURL.bookmarkDataWithContentsOfURL_error_(url, None)
    if bookmark_data is None:
        return None
    opts = (NSURLBookmarkResolutionWithoutUI |
            NSURLBookmarkResolutionWithoutMounting)
    # What the actual fuck
    resolved, stale, error = \
        NSURL.URLByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_\
        (bookmark_data, opts, None, None, None)
    return resolved.path()

def main():
    ''' main '''
    parser = argparse.ArgumentParser()
    parser.add_argument("path", help="Path to the macOS alias")
    args = parser.parse_args()

    path = args.path

    if not check_if_alias(path):
        print("\"%s\" not a valid macOS alias" % path,
              file=sys.stderr)
        sys.exit(1)

    target = target_of_alias(path)
    if check_if_alias(target):
        print("Alias \"%s\" resolved to another alias:" % path,
              "\n\t%s" % target, file=sys.stderr)
    else:
        print(target)

if __name__ == "__main__":
    main()
