from enum import Enum

class Filetype(Enum):
    SRT = 1
    ASS = 2
    SSA = 3
    VTT = 4
    TTML2 = 5

def parseSRT(filepath):
    with open(filepath, encoding='utf-8-sig') as f:
        subs = f.read().strip().split('\n\n')

    lines = []
    for sub in subs:
        num, time, text = sub.split('\n', 2)
        start, end = time.split(' --> ')
        lines.append((int(num), start, end, text))

    lines.sort()
    for _, start, end, text in lines:
        yield(start, end, text)

def parseASS(filepath):
    return None

def parseSubFile(filepath, filetype=None):
    match filetype:
        case Filetype.SRT:
            return parseSRT(filepath)
        case Filetype.ASS | Filetype.SSA:
            return parseASS(filepath)

    if filepath.endswith('.srt'):
        return parseSRT(filepath)
    if filepath.endswith('.ass') or filepath.endswith('.ssa'):
        return parseASS(filepath)

    return None

def main():
    import sys

    _, filepath = sys.argv

    print(tuple(parseSubFile(filepath)))

if __name__ == '__main__':
    main()
