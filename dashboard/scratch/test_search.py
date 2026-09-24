import os

def find_self_push(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    for i, line in enumerate(lines):
        if 'ephemeralModifiers.push("self")' in line or 'ephemeralModifiers.push(\'self\')' in line:
            print(f'{os.path.basename(filepath)}: Line {i+1}: {line.strip()}')
            # Print surrounding lines
            start = max(0, i - 5)
            end = min(len(lines), i + 10)
            for j in range(start, end):
                print(f'  {j+1}: {lines[j].strip()}')
            print('='*40)

find_self_push(r'E:\home work\cryptrader\dashboard\vendor\livewire\livewire\dist\livewire.esm.js')
find_self_push(r'E:\home work\cryptrader\dashboard\vendor\livewire\livewire\dist\livewire.js')
