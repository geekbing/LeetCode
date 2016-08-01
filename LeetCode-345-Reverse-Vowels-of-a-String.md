---
title: LeetCode-345. Reverse Vowels of a String  
date: 2016-08-01 14:57:46  
categories: Algorithm  
tags: LeetCode  
---

### 345. Reverse Vowels of a String

Write a function that takes a string as input and reverse only the vowels of a string.

**Example 1:**  
Given s = "hello", return "holle".

**Example 2:**  
Given s = "leetcode", return "leotcede".

**Note:**  
The vowels does not include the letter "y".

### Translation

编写一个函数，它接受一个字符串作为输入，并反转字符串中的元音字符。

**例子1：**  
给定字符串 s = "hello", 返回 "holle"。

**例子2：**  
给定字符串 s = "leetcode", 返回 "leotcede"。

**注意：**  
元音字符不包括字符 "y".

### The idea of solving process

典型的 `Two Pointers` 问题。使用指针 `i` 和 `j` 分别指向数组的首尾。如果指针指向的位置不是元音字符，则指针先中间移动，直到两个指针指向的位置的字符都是元音字符，交换两个元音字符。

详细代码如下所示：

### AC Code

```javascript
func reverseVowels(s: String) -> String
{
    let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    
    var charArr = s.characters.filter { (char: Character) -> Bool in
        return true
    }
    
    var i = 0
    var j = charArr.count - 1
    while i < j
    {
        if !vowels.contains(charArr[i]) && vowels.contains(charArr[j])
        {
            i += 1
        }
        else if vowels.contains(charArr[i]) && !vowels.contains(charArr[j])
        {
            j -= 1
        }
        else if !vowels.contains(charArr[i]) && !vowels.contains(charArr[j])
        {
            i += 1
            j -= 1
        }
        else
        {
            let temp = charArr[i]
            charArr[i] = charArr[j]
            charArr[j] = temp
            i += 1
            j -= 1
        }
    }
    return String(charArr)
}
```