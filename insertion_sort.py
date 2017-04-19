title = """
----------------------------Insertion sort -----------------------------------
arr (a1,a2,a3,....,an)
->: (a1',a2',a3',....,an')
where: a1' <= a2' <= a3' <= .... an'
------------------------------------------------------------------------------
Pseudocode:
    for j = 1 to arr.length
        key = arr[j]
        i = j - 1
        while i >= 0 and arr[i] > key
            arr[i+1] = arr[i]
            i = i - 1
        arr[i+1] = key
------------------------------------------------------------------------------
"""
print title
arr = [33312,3,34,232,4344,324,12,12,12344,323,34,334,3]

print "Before:", arr
for j in range(1, len(arr)):
    key = arr[j]
    i = j - 1
    while i >= 0 and arr[i] > key:
        arr[i+1] = arr[i]
        i = i - 1
    arr[i+1] = key
print "After:", arr
'-----------------------------------------------------------------------------'
arr2 = [23,3224,4454,234,5,233,34,34,343,3,43424]
print "Before:", arr2
for j in range(1, len(arr2)):
    key = arr2[j]
    i = j -1
    while i >= 0 and arr2[i] < key:
        arr2[i+1] = arr2[i]
        i = i -1
    arr2[i+1] = key
print "After:", arr2
analize = '''
------------------------------------------------------------------------------
Analyzing algorithms
Time: depend on size of input N
INSERTION-SORT                                           cost       times
1 for j = 1 to A.length                                    c1       n
2   key = A[j]                                             c2       n - 1
3   // Insert A[j] into the sorted sequence A[0..j-1].      0       n - 1
4   i = j - 1                                              c4       n - 1
5   while i >=0 and A[i] > key                             c5       
6       A[i + 1] = A[i]                                    c6
7       i = i -1                                           c7
8  A[i + 1] = key                                          c8       n - 1
------------------------------------------------------------------------------
O(n^2)
------------------------------------------------------------------------------
'''
print analize
