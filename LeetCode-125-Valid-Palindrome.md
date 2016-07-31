---
title: LeetCode-125. Valid Palindrome  
date: 2016-07-31 14:57:24  
categories: Algorithm  
tags: LeetCode  
---

### 125. Valid Palindrome

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

For example,  
`"A man, a plan, a canal: Panama" ` is a palindrome.
`"race a car"` is not a palindrome.

**Note:**

1. Have you consider that the string might be empty? This is a good question to ask during an interview.

2. For the purpose of this problem, we define empty string as valid palindrome.

### 题目翻译

给定一个字符串，判断它是不是一个回文结构的，只考虑字母和数字字符，忽略其它字符。
例如：

`"A man, a plan, a canal: Panama" ` 是回文结构的。
`"race a car"` 不是回文结构的。

### 解题思路

判断一个字符串是不是回文结构的很简单，使用两个指针分别指向首尾，然后向中间移动，判断对应的字符是不是相等的即可。

**但是该题的回文结构的定义稍有区别，即只考虑字母和数字字符，忽略其它字符。**

所以，可以先将字符串转换为小写字符串，并且过滤出中含有字母和数字的字符，并返回得到的数组。过滤数组可以使用Swift的 `filter` 函数来过滤。

转换代码如下：

```javascript
let low = s.lowercaseString.characters.filter { (char: Character) -> Bool in
	if (char >= "a" && char <= "z") || (char >= "0" && char <= "9")
	{
		return true
	}
	return false
}
```

例如：对于字符串 `"A man, a plan, a canal: Panama"` 转换可以得到如下的数组：

`["a", "m", "a", "n", "a", "p", "l", "a", "n", "a", "c", "a", "n", "a", "l", "p", "a", "n", "a", "m", "a"]`

对于上面得到的字符数组，就可以采用之前提到的首尾指针来遍历数组，判断相等即可。

```javascript
var i = 0
var j = low.count - 1
    
while i < j
{
	if low[i] != low[j]
	{
		return false
	}    
	i += 1
	j -= 1
}    
return true
```

完整代码如下：

### AC Code

```javascript
func isPalindrome(s: String) -> Bool
{
    if s == ""
    {
        return true
    }
    let low = s.lowercaseString.characters.filter { (char: Character) -> Bool in
        if (char >= "a" && char <= "z") || (char >= "0" && char <= "9")
        {
            return true
        }
        return false
    }
    
    var i = 0
    var j = low.count - 1
    
    while i < j
    {
        if low[i] != low[j]
        {
            return false
        }
        
        i += 1
        j -= 1
    }
    
    return true
}
```