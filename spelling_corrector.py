# http://norvig.com/spell-correct.html
import re
from collections import Counter

def words(text): return re.findall(r'\w+', text.lower())

WORDS = Counter(words(open("data/big.txt").read()))

def P(word, N=sum(WORDS.values())):
    "Probability of 'word'"
    return WORDS[word] / N

def correction(word):
    "Most probable spelling correction for word"
    return max(candidates(word), key = P)

def candidates(word):
    "Generate posisble spelling correction for word"
    print(known([word]) or known(edits1(word)) or known(edits2(word)) or [word])
    return (known([word]) or known(edits1(word)) or known(edits2(word)) or [word])

def known(words):
    "The subset of word that appear in the dictionary of WORDS"
    return set(w for w in words if w in WORDS)

def edits1(word):
    "All edits that are one edit away from `word`"
    letters = 'abcdefghijklmnoqprstuvwxz'
    splits = [(word[:i], word[i:]) for i in range(len(word) + 1)]
    deletes = [L + R[1:] for L, R in splits if R]
    transposes = [L + R[1] + R[2:] for L,R in splits if len(R) > 1]
    replaces = [L + c + R for L,R in splits if R for c in letters]
    inserts = [L + c + R for L, R in splits for c in letters]
    #print(splits)
    #print(deletes)
    #print(transposes)
    #print(replaces)
    ###print(inserts)
    return set(deletes + transposes + replaces + inserts)

def edits2(word):
    "All edits are two away from 'word'"
    return (e2 for e1 in edits1(word) for e2 in edits1(e1))

