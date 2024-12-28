#!/usr/bin/python3

import sys
import re
import json

def main():
    with open(sys.argv[1], encoding='utf-8') as f:
        s = f.read()

    # Replace the optional part after the quotes
    cleaned_text = re.sub(r'^(snippet \w+ "[^"]+")(?: \w+)?$', r'\1', s, flags=re.MULTILINE)

    pattern = r'snippet\s+(\w+)\s+"([^"]+)"\s+([\s\S]+?)(?=\n\s*snippet|\Z)'
    result = {}
    for match in re.finditer(pattern, cleaned_text):
        body = match.group(3).split('\n')
        body = [line[4:] if line.startswith("    ") else line for line in body]
        # Replace all other groups of 4 spaces with a tab
        body = [re.sub(r'^( {4})', r'\t', line) for line in body]
        if len(body) == 1:
            body = body[0]

        _id = match.group(1)
        result[_id] = {}
        result[_id]['prefix'] = _id
        result[_id]['descr'] = match.group(2)
        result[_id]['body'] = body

    with open(sys.argv[2], 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f'usage: ./translate_snippets <path-to-snipmate-snippet-file> <output-file>')
        sys.exit(0)
    main()
