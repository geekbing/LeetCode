---
title: LeetCode-290. Word Pattern  
date: 2016-07-31 18:36:34  
categories: Algorithm  
tags: LeetCode  
---

### 290. Word Pattern

Given a `pattern` and a string `str`, find if `str` follows the same pattern.

Here **follow** means a full match, such that there is a bijection between a letter in `pattern` and a non-empty word in `str`.

**Examples:**

1. pattern = `"abba"`, str = `"dog cat cat dog"` should return true.
2. pattern = `"abba"`, str = `"dog cat cat fish"` should return false.
3. pattern = `"aaaa"`, str = `"dog cat cat dog"` should return false.
4. pattern = `"abba"`, str = `"dog dog dog dog"` should return false.

**Notes:**

You may assume `pattern` contains only lowercase letters, and `str` contains lowercase letters separated by a single space.

### Translation

给定一个模式 `pattern` 和一个字符串 `str`，查看 `str` 时候遵循相同的模式。

这里遵循意味着一个完整的匹配，这样模式的一个字符和 `str` 的一个非空的单词之间有有一个一一映射的关系。

**例如：**

1. pattern = `"abba"`, str = `"dog cat cat dog"` 应当返回 true.
2. pattern = `"abba"`, str = `"dog cat cat fish"` 应当返回 false.
3. pattern = `"aaaa"`, str = `"dog cat cat dog"` 应当返回 false.
4. pattern = `"abba"`, str = `"dog dog dog dog"` 应当返回 false.

### The idea of solving process

首先想到的，应该将字符串 `str` 使用空格分隔成字符串数组。这样容易和模式字符串 `pattern` 进行一一匹配。

**可以使用字典存储这种一一映射的关系，字典的key存储模式字符串的一个字符，value存储对应的字符串数组的一个元素。**

下面是匹配的思路：

从头到尾循环模式字符串，对于当前的每一个字符 `char`

1. 查看当前字符 `char` 在字典中是否存在。
2. 如果存在，则将字典中的 `value` 值与数组对应位置的值进行比较。如果不相等，则说明不匹配。
3. 如果不存在。首先需要查看字典的所有 `values` 数组中是否包含了当前数组对应位置的值。
4. 如果包含了，说明不同的 `key` 对应了相同的 `value` 值，模式肯定不匹配了。
5. 如果不包含，则说明字典中没有这种对应关系，需要将当前对应关系加入数组中。

理解了思路之后，很容易写出代码来，详细的代码如下所示：

### AC Code

```javascript
func wordPattern(pattern: String, _ str: String) -> Bool
{
    let strArr = str.componentsSeparatedByString(" ")
    if pattern.characters.count != strArr.count
    {
        return false
    }
    
    var index = 0
    var dict: [Character: String] = [:]
    for char in pattern.characters
    {
        if dict[char] == nil
        {
            if dict.values.contains(strArr[index])
            {
                return false
            }
            dict[char] = strArr[index]
        }
        else
        {
            if dict[char] != strArr[index]
            {
                return false
            }
        }
        index += 1
    }
    return true
}
```