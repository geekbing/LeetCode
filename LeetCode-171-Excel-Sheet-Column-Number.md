---
title: LeetCode-171. Excel Sheet Column Number  
date: 2016-07-29 20:25:50  
categories: Algorithm  
tags: LeetCode  
---

### 171. Excel Sheet Column Number  

Related to question [Excel Sheet Column Title](https://leetcode.com/problems/excel-sheet-column-title/)

Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:

```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
```

### 题目翻译

与问题 [Excel Sheet Column Title](https://leetcode.com/problems/excel-sheet-column-title/)相关。

给定一个出现在一个Excel表格中的列标题，返回相应的列号。

例如:

```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
```

### 解题思路

题目很简单，可以简单的看成26进制的数转换成十进制。

对于十进制数123，我们的计算过程如下：

```
（（（1 ＊ 10）＋ 2）＊ 10）＋ 3
```

同理对于26进制数的计算过程也一样，只是基数换乘26而已，即每次乘以26。

理解之后，不难写出代码：

### AC Code  

```

func titleToNumber(s: String) -> Int
{
    var ans = 0
    let dect = ["A" : 1 , "B" : 2, "C" : 3, "D" : 4, "E" : 5,
                "F" : 6 , "G" : 7, "H" : 8, "I" : 9, "J" : 10,
                "K" : 11, "L" : 12,"M" : 13,"N" : 14,"O" : 15,
                "P" : 16, "Q" : 17,"R" : 18,"S" : 19,"T" : 20,
                "U" : 21, "V" : 22,"W" : 23,"X" : 24,"Y" : 25, "Z" : 26]
    
    for char in s.characters
    {
        ans = ans * 26 + dect["\(char)"]!
    }
    return ans
}
```
