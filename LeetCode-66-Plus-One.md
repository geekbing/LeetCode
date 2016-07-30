---
title: LeetCode-66. Plus One
date: 2016-07-30 15:52:39
tags:
---

### 66. Plus One

Given a non-negative number represented as an array of digits, plus one to the number.

The digits are stored such that the most significant digit is at the head of the list.

### 题目翻译

给定一个整数数组代表一个非负整数，将这个整数加1。

数字在存储的时候将最重要的数字（即整数的最高位）放在数组的开头。

### 解题思路

这是一道非常常规的整数加1的题目。根据题目意思整数`123`在数组中是这样存储的`[1，2，3]`。

所以，进行加1操作的时候，需要倒着遍历数组。

需要注意的一个地方就是要考虑进位的问题。**如果循环结束之后，产生了进位，则数组需要在开头插入1个值为1的新元素。**

完整代码如下：

### AC Code

```javascript
func plusOne(digits: [Int]) -> [Int]
{
    var numArr = digits
    
    // 初始化进位为1
    var carry = 1
    
    // 倒着遍历数组
    var index = numArr.count - 1
    while index >= 0
    {
        let number = numArr[index] + carry
        numArr[index] = number % 10
        carry = number / 10
        index -= 1
    }
    // 如果最后还有进位，则数组增加1位
    if carry == 1
    {
        numArr.insert(1, atIndex: 0)
    }
    return numArr
}
```