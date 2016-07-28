---
title: LeetCode-344. Reverse String  
date: 2016-07-28 14:13:08  
categories: Algorithm  
tags: LeetCode  
---

### 344. Reverse String

Write a function that takes a string as input and returns the string reversed.

Example:

Given s = "hello", return "olleh".

### 题目翻译

写一个函数，输入为一个字符串，输出为输入字符串的反转字符串。

例如：

给定字符串 s = "hello", 返回 "olleh".

### 解题思路

最基本的反转字符串，循环字符串，将当前的字符不断加到头部即可。

例如反转hello，初始情况下ans = ""

扫描到h时，ans = h + ans，结果ans = "h"

扫描到e时，ans = e + ans，结果ans = "eh"

扫描到l时，ans = l + ans，结果ans = "leh"

扫描到l时，ans = l + ans，结果ans = "lleh"

扫描到o时，ans = o + ans，结果ans = "olleh"

### AC Code  

```javascript
func reverseString(s: String) -> String 
{
    var ans = ""
    for char in s.characters
    {
        ans = "\(char)" + ans
    }
    return ans
}
```