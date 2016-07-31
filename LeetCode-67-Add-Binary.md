---
title: LeetCode-67. Add Binary
date: 2016-07-31 11:16:45
tags:
---

### 67. Add Binary

Given two binary strings, return their sum (also a binary string).

For example,
a = `"11"`
b = `"1"`
Return `"100"`.

### 题目翻译

给定两个二进制字符串，返回他们的和（和同样也是二进制字符串）。

例如，a = `"11"`，b = `"1"`，返回 `"100"`。

### 解题思路

非常正常的两个数字加和的题目。之前做过类似的题目。但是思路上基本是一致的。

由于二进制字符串操作起来不方便，所以先将它转换为反转的字符数组，方便我们正常的遍历操作。

例如对于二进制字符串 `"110"` ，转换为 `["0"，"1"，"1"]`，这样低位在前面，方便正常遍历操作。

```javascript
// 将a和b反转，并得到字符数组
let reverseArrA: [Character] = a.characters.reverse()
let reverseArrB: [Character] = b.characters.reverse()
```

由于得到的字符数组长度不一定相同，所以先遍历到短的数组长度为止。并且需要考虑进位的问题。

```javascript
// 处理0..<short部分的数组的加和
var carry = 0
var ans = [Character]()
for i in 0..<short
{
	let numA = Int("\(reverseArrA[i])")!
	let numB = Int("\(reverseArrB[i])")!    
	ans.append(Character("\((numA + numB + carry) % 2)"))
	carry = (numA + numB + carry) / 2
}
```

接着处理长的数组多出来的部分即可。同样如果处理结束后，进位为1，需要在数组最后新增一个值为"1"的元素。

代码不复杂，完整代码如下所示：

### AC Code

```javascript
func addBinary(a: String, _ b: String) -> String
{
    // 最短长度
    let lengthA = a.characters.count
    let lengthB = b.characters.count
    let short = lengthA <= lengthB ? lengthA : lengthB
    
    // 将a和b反转，并得到字符数组
    let reverseArrA: [Character] = a.characters.reverse()
    let reverseArrB: [Character] = b.characters.reverse()
    
    // 处理0..<short部分的数组的加和
    var carry = 0
    var ans = [Character]()
    for i in 0..<short
    {
        let numA = Int("\(reverseArrA[i])")!
        let numB = Int("\(reverseArrB[i])")!
        
        ans.append(Character("\((numA + numB + carry) % 2)"))
        carry = (numA + numB + carry) / 2
    }
    
    // 处理后半段的加和
    if lengthA > lengthB
    {
        for i in short..<lengthA
        {
            let numA = Int("\(reverseArrA[i])")!
            ans.append(Character("\((numA + carry) % 2)"))
            carry = (numA + carry) / 2
        }
        if carry == 1
        {
            ans.append(Character("1"))
        }
    }
    else if lengthA < lengthB
    {
        for i in short..<lengthB
        {
            let numB = Int("\(reverseArrB[i])")!
            ans.append(Character("\((numB + carry) % 2)"))
            carry = (numB + carry) / 2
        }
        if carry == 1
        {
            ans.append(Character("1"))
        }
    }
    else
    {
        if carry == 1
        {
            ans.append(Character("1"))
        }
    }
    
    return String(ans.reverse())
}
```