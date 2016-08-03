---
title: LeetCode-13. Roman to Integer  
date: 2016-08-03 09:46:09  
categories: Algorithm  
tags: LeetCode  
---

## 13. Roman to Integer  

Given a roman numeral, convert it to an integer.  
Input is guaranteed to be within the range from 1 to 3999.

## Translation

给定一个罗马数字，将它转换成一个整数。  
输入确保在1到3999范围内。

## The idea of solving process

[罗马数字](http://baike.baidu.com/link?url=FxqRf1kL9CULfSt7gq1qSALzyZQtZgqRbiPCpB87DeeHI3z6gPS5upSwUskyESrp) 采用七个罗马字母作数字，即Ⅰ（1）、X（10）、C（100）、M（1000）、V（5）、L（50）、D（500）。

记数的方法：
1. 相同的数字连写，所表示的数等于这些数字相加得到的数，如 Ⅲ=3；
2. 小的数字在大的数字的右边，所表示的数等于这些数字相加得到的数，如 Ⅷ=8、Ⅻ=12；
3. 小的数字（限于 Ⅰ、X 和 C）在大的数字的左边，所表示的数等于大数减小数得到的数，如 Ⅳ=4、Ⅸ=9；
4. 在一个数的上面画一条横线，表示这个数增值 1,000 倍，如

由于题目输入范围为 1 到 3999，所以规则 4 用不上。

基本思路就是遍历字符串，如果当前字符比后面一位字符对应的数值小，则减去当前字符对应的数值，否则加上当前字符对应的数值。

完整代码如下所示：

## AC

```javascript
func romanToInt(s: String) -> Int
{
    let dict:[Character: Int] = [ "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    var ans = 0
    for index in s.characters.startIndex..<s.characters.endIndex.predecessor()
    {
        if dict[s.characters[index]] < dict[s.characters[index.successor()]]
        {
            ans -= dict[s.characters[index]] ?? 0
        }
        else
        {
            ans += dict[s.characters[index]] ?? 0
        }
    }
    
    ans += dict[s.characters.last!] ?? 0
    return ans
}
```