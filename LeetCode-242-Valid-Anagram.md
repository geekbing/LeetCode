---
title: LeetCode-242. Valid Anagram
date: 2016-07-30 09:22:28
categories: Algorithm  
tags: LeetCode  
---

### 242. Valid Anagram

Given two strings s and t, write a function to determine if t is an anagram of s.

For example,
s = "anagram", t = "nagaram", return true.
s = "rat", t = "car", return false.

**Note:**

You may assume the string contains only lowercase alphabets.

**Follow up:**

What if the inputs contain unicode characters? How would you adapt your solution to such case?

### 题目翻译

给定两个字符串s和t, 写一个函数判断t是不是s的anagram数（相同字母异序词）。

例如：

s = "anagram", t = "nagaram", 返回 true.
s = "rat", t = "car", 返回 false.

**注意:**

你可以假设给定的字符串只包含小写字母。

**更进一步:**

如果输入的字符串包含unicode编码的字符串呢？对于这种情况，你将如何适配你的程序？

### 解题思路

第一反应就是分别查看字符串s和t中字符的种类和个数。分别用字典存起来（字典的key为字符，value为这个字符的个数）。

```javascript
for char in s.characters
{
	if dictS["\(char)"] == nil
	{
		dictS["\(char)"] = 1
	}
	else
	{
		dictS["\(char)"]! += 1
	}
}

```

然后就是对比两个字典的key和value是否完全相等。事实证明，这种方法是正确的:)。程序没有任何难点。

之前是自己写代码判断两个字典是否完全相等，代码如下：

```javascript
if dictS.keys.count != dictT.keys.count
{
	return false
}
    
for key in dictS.keys
{
	if dictS[key] != dictT[key]
	{
		return false
	}
}
return true
```

后来试了一下，原来Swift可以直接使用`==`判断两个字典是否完全相等:)。

```javascript
if dictS != dictT
{
	return false
}
return true
```

完整代码如下：

### AC Code  

```javascript
func isAnagram(s: String, _ t: String) -> Bool
{
    var dictS: [String: Int] = [:]
    var dictT: [String: Int] = [:]
    
    for char in s.characters
    {
        if dictS["\(char)"] == nil
        {
            dictS["\(char)"] = 1
        }
        else
        {
            dictS["\(char)"]! += 1
        }
    }
    
    for char in t.characters
    {
        if dictT["\(char)"] == nil
        {
            dictT["\(char)"] = 1
        }
        else
        {
            dictT["\(char)"]! += 1
        }
    }
    
    if dictS != dictT
    {
        return false
    }
    return true
}
```