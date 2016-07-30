---
title: LeetCode-168. Excel Sheet Column Title  
date: 2016-07-29 20:49:31  
categories: Algorithm  
tags: LeetCode  
---

### 168. Excel Sheet Column Title  

Given a positive integer, return its corresponding column title as appear in an Excel sheet.

For example:

```
    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
```

### 题目翻译

给定一个正整数，返回Excel表格中它相应的列标题。

例如:

```
    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
```

### 解题思路

恰好和LeetCode [171. Excel Sheet Column Number](https://leetcode.com/problems/excel-sheet-column-number/)正好是反着的。大家可以看我之前的解题思路[171题的解答博客](http://geekbing.com/2016/07/29/LeetCode-171-Excel-Sheet-Column-Number/)

即题目的本质就是十进制转换成26进制。但需要要注意的是题目中并没有出现数字0，一切进位都是从数字1开始计数，一直到数字26。整个字母串的每一位都是一直到出现数字27才会开始进位的，所以在处理需要进位的地方时要多加小心。

需要把n映射到0-25这26个数字里，我们可以先`n--`，然后再进行后面的转换, 最后n /= 26.

### AC Code

```javascript
func convertToTitle(n: Int) -> String
{
    let dict = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var num = n
    var ans = ""

    while num != 0
    {
        num -= 1
        ans = dict[num % 26] + ans
        num = num / 26
    }
    
    return ans
}
```