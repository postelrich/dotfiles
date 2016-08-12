
## move
hjkl left,up,down,right
w beginning of next word
W beginning of next word separated by space
b beginning of prev word
B beginning of prev word separated by space
eE end of next word (by space)
fF{char} to next/prev occurrence of char

## edit
aA edit after cursor (at end of line)
iI edit before cursor (before first char)
oO insert line below (above)

## delete
x delete character under cursor
X delete character before cursor
dd delete line

# find replace
:%s/old/new/g(c) replace all occurrences (confirm each)
/<str> -> cgn delete str, edit mode.  Make change then hit escape and hit . to repeat, n to skip next.

## search
/ forward search
? backwords search

## comments
<Leader>-cc comment line
<Leader>-ci toggle comment

## NerdTree
<F2> toggle nerdtree
t open in new tab
i horizontal split
s vertical split

## file search
<Ctrl>+P open ctrlp
up/down select file
<Enter> open in current buffer
<Ctrl>+t open in new tab
