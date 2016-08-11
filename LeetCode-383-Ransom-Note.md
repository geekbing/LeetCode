---
title: LeetCode-383. Ransom Note  
date: 2016-08-11 20:04:30  
categories: Algorithm  
tags: LeetCode   
---

## 383. Ransom Note  

Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines; otherwise, it will return false. 

Each letter in the magazine string can only be used once in your ransom note.

Note:
You may assume that both strings contain only lowercase letters.

canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true

## Translation

给定任意的随机字符串和另一个字符串，编写一个函数，如果随机字符串可以由另一个字符串构造的话，该函数将返回true；否则，它将返回false。  
另一个中的每个字母在随机字符串中只能使用一次。  
**注意：**  
你可以假设两个字符串都只包含小写字母。

```
canConstruct("a", "b") -> false
canConstruct("aa", "ab") -> false
canConstruct("aa", "aab") -> true
```

## The idea of solving process

遍历两个字符串，使用字典来存储两个字符串中字符的种类和对应的个数

```swift
var noteDict = [Character: Int]()
var magazineDict = [Character: Int]()
    
for char in ransomNote.characters
{
	if noteDict[char] == nil
	{
		noteDict[char] = 1
	}
	else
	{
		noteDict[char]! += 1
	}
}    
for char in magazine.characters
{
	if magazineDict[char] == nil
	{
		magazineDict[char] = 1
	}
	else
	{
        magazineDict[char]! += 1
	}
}
```

之后再对比两个同一个字符对应的个数即可判断随机字符串是否可以由另一个字符串构造。

```swift
for key in noteDict.keys
{
	if magazineDict[key] == nil || noteDict[key] > magazineDict[key]
	{
		return false
	}
}
```

完整代码如下所示：

## AC Code

```swift
func canConstruct(ransomNote: String, _ magazine: String) -> Bool
{
    var noteDict = [Character: Int]()
    var magazineDict = [Character: Int]()
    for char in ransomNote.characters
    {
        if noteDict[char] == nil
        {
            noteDict[char] = 1
        }
        else
        {
            noteDict[char]! += 1
        }
    }
    for char in magazine.characters
    {
        if magazineDict[char] == nil
        {
            magazineDict[char] = 1
        }
        else
        {
            magazineDict[char]! += 1
        }
    }
    for key in noteDict.keys
    {
        if magazineDict[key] == nil || noteDict[key] > magazineDict[key]
        {
            return false
        }
    }
    return true
}
```