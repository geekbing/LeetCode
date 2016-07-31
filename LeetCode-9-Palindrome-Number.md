---
title: LeetCode-9. Palindrome Number  
date: 2016-07-31 19:51:20  
categories: Algorithm  
tags: LeetCode  
---

### 9. Palindrome Number

Determine whether an integer is a palindrome. Do this without extra space.

**Some hints:**  
Could negative integers be palindromes? (ie, -1)

If you are thinking of converting the integer to string, note the restriction of using extra space.

You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?

There is a more generic way of solving this problem.

### Translation

判断一个整数是不是回文数。不要用到而外的空间来解决这道题目（通常意味着空间复杂度为O(1)）。

**一些提示：**  
负整数会是回文数吗？（例如－1）

如果你在考虑将整数转换为字符串，注意不要使用额外空间的限制条件。

你也可以尝试反转一个整数。然而，如果你已经解决了 ["反转整数"](https://leetcode.com/problems/reverse-integer/)（[对应的博客解答地址](http://geekbing.com/2016/07/28/LeetCode-7-Reverse-Integer/)） 这个问题，你会知道反转整数可能会导致溢出。你会如何处理这些情况?

有一个更通用的方式来解决这个问题。

### The idea of solving process

题目提示中提到了反转整数。反转整数的代码我们很熟悉：

```javascript
func reverse(x: Int) -> Int
{
    var num = x
    var ans = 0
    while num != 0
    {
        let tail = num % 10
        let newResult = ans * 10 + tail
        ans = newResult
      	
        num = num / 10
    }
    return ans
}
```

上面的代码没有解决反转整数溢出的问题。对于这道题目，提示中说明了还有更加通用的方式来解决。

**为了防止溢出，我们只需要计算整数右半部分的值，和左半部分进行对比即可判断是否是回文数。**

```
var num = x
var rightHalf = 0
while num > rightHalf
{
	rightHalf = rightHalf * 10 + num % 10
	num /= 10
}
```

循环结束的时候会有两种情况：

1. 若原先的整数长度为基数的时候，需要判断 `num == rightHalf / 10` 。例如对于整数12121，循环结束的时候，`num == 12，rightHalf == 121`。
2. 若原先的整数长度为偶数的时候，需要判断 `num == rightHalf` 。例如对于整数1221，循环结束的时候，`num == 12，rightHalf == 121`。

完整代码如下所示：

### AC Code

```javascript
func isPalindrome(x: Int) -> Bool
{
    if x < 0 || (x != 0 && x % 10 == 0)
    {
        return false
    }
    
    var num = x
    var rightHalf = 0
    while num > rightHalf
    {
        rightHalf = rightHalf * 10 + num % 10
        num /= 10
    }
    
    return num == rightHalf || (num == rightHalf / 10)
}
```