---
title: LeetCode-14. Longest Common Prefix  
date: 2016-07-31 17:26:45  
categories: Algorithm  
tags: LeetCode  
---

### 14. Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

### 题目翻译

写一个函数来查找字符串数组中的最长公共前缀字符串。

### 解题思路

首先，将数组第一个元素当做最长公共前缀字符串。然后不断的和后面的第二个，第三个。。。元素去匹配，查看最长公共前缀字符串是不是后面元素的前缀。每次和当前元素匹配有2种情况：

1. 是后面元素的前缀。这样最长公共前缀字符串保持不变，继续循环和后续的数组元素去比较。
2. 不是后面元素的前缀。这时需要将最长公共前缀字符串的最后一个字符去掉（即缩短最长公共前缀字符串）。再去匹配。一直到最长公共前缀字符串是当前元素的前缀。

这样不断的缩短最长公共前缀字符串，直到循环结束，就找到了最长公共前缀字符串。

记录说明如下：

对于字符串数组 `["abcd", "ab", "abc", "a"]` ，匹配过程如下：

1. 先将数组第一个元素 `"abcd"` 作为最长公共前缀字符串。
2. 查看 `"abcd"` 是不是 `"ab"` 的前缀。结果不是，则最长公共前缀字符串变为 `"abc"`，继续查看是不是 `"ab"` 的前缀。结果不是，则最长公共前缀字符串变为 `"ab"`。继续查看是不是 `"ab"` 的前缀，此时是前缀。
3. 将上一步的到的最长公共前缀字符串 `"ab"` 和第三个元素进行匹配，发现 `"ab"` 是 `"abc"` 的前缀。
4. 将上一步的到的最长公共前缀字符串 `"ab"` 和第四个元素进行匹配，发现 `"ab"` 不是 `"a"` 的前缀。则最长公共前缀字符串变为 `"a"`，再去匹配，发现是的。
5. 数组循环结束，找到了最长公共前缀字符串。

所以，算法的核心思路是：**不断的去掉最长公共前缀字符串最后一位，和其他元素进行匹配，直到全部比配完成，这时就找到了最长公共前缀字符串。**

理解了算法的思路之后，就不难写出代码了。详细的代码如下所示：

### AC Code

```javascript
func longestCommonPrefix(strs: [String]) -> String
{
    if strs.count == 0
    {
        return ""
    }
    var first = strs[0]
    if first == "" || strs.count == 1
    {
        return first
    }
    
    for i in 1..<strs.count
    {
        while !strs[i].hasPrefix(first)
        {
            if first == ""
            {
                return ""
            }
			// 去掉最长公共前缀字符串最后一位字符
            first = String(first.characters.dropLast())
        }
    }
    
    return first
}
```