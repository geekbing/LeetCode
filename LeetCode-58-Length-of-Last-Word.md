---
title: LeetCode-58. Length of Last Word
date: 2016-07-31 09:30:55
tags:
---

### 58. Length of Last Word

Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

If the last word does not exist, return 0.

Note: A word is defined as a character sequence consists of non-space characters only.

For example, 
Given s = "Hello World",
return 5.

### 题目翻译

给定一个由大写或小写字母以及空白字符 `' '` 组成的字符串，返回字符串最后一个单词的长度。

假如最后一个单词不存在，返回0。

**注意：**一个单词被定义为一个只包含非空白字符的字符序列。

例如：给定 s = `"Hello World"`, 返回 `5`。 

### 解题思路

题目很简单。为了找到最后一个单词，我们可以使用Swift自带的字符串分隔函数来得到分隔后的字符串数组。
然后返回最后一个不为空的字符串的长度即可。

需要注意的是，如果字符串中包含空格等空白字符，分隔函数生成的字符串数组中也可能包含空白字符串的元素。
例如，对于字符串`"a "`

```javascript
let strArr = s.componentsSeparatedByString(" ")
print(strArr)			// ["a", ""]
```

所以，需要从后向前遍历得到的字符串数组，找到第一个非空的字符串，返回它的长度即可。

详细代码如下：

### AC Code

```javascript
func lengthOfLastWord(s: String) -> Int
{
    let strArr = s.componentsSeparatedByString(" ")
    
    var index = strArr.count - 1
    while index >= 0
    {
        if strArr[index] != ""
        {
            return strArr[index].characters.count
        }
        index -= 1
    }
    return 0
}
```
