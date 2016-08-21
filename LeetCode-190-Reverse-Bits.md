---
title: LeetCode-190. Reverse Bits  
date: 2016-08-18 09:18:36  
categories: Algorithm  
tags:  
- LeetCode  
- Java  
---

## 190. Reverse Bits  

Reverse bits of a given 32 bits unsigned integer.

For example, given input 43261596 (represented in binary as **00000010100101000001111010011100**), return 964176192 (represented in binary as **00111001011110000010100101000000**).

**Follow up:**  
If this function is called many times, how would you optimize it?

Related problem: [Reverse Integer](https://leetcode.com/problems/reverse-integer/)

## Translation

反转一个给定的32位无符号整数。  
例如：给定输入 43261596 (二进制表现形式为 **00000010100101000001111010011100**), 返回 964176192 (二进制表现形式为 **00111001011110000010100101000000**).  
**更进一步：**  
如果这个函数调用多次呢，你如何来优化算法？  
相关的问题: [Reverse Integer](https://leetcode.com/problems/reverse-integer/)

## The idea of solving process

首先得到输入的无符号整数的二进制形式，并用数组存储起来。**可以使用循环，不断的将这个数与 1 做 & 运算得到二进制形式的最后1位（使用数组元素存储），然后将这个数右移1位（>>>）。**

```java
int arr[] = new int[32];
int index = 0;
while(index < 32)
{
	arr[index++] = n & 1;
	n = n >>> 1;
}
```

这样数组 arr 中存储的就是整数二进制形式的反转。接下来只需要反过来从数组末尾向前遍历，将二进制转换为整数即可。该操作和上面的操作刚好相反。

```java
index--;
int ans = arr[index];
int base = 1;
index--;
while(index >= 0)
{
	base *= 2;
	if (arr[index] == 1)
	{
		ans += base;
	}
	index--;
}
return ans;
```

完整代码如下所示：

## AC Code

```java
public class Solution {
    // you need treat n as an unsigned value
    public int reverseBits(int n) {
        int arr[] = new int[32];
    	int index = 0;
    	while(index < 32)
    	{
    		arr[index++] = n & 1;
    		n = n >>> 1; 
    	}
    	index--;
    	int ans = arr[index];
    	int base = 1;
    	index--;
    	while(index >= 0)
    	{
    		base *= 2;
    		if (arr[index] == 1)
    		{
    			ans += base;
    		}
    		index--;
    	}
    	return ans;
    }
}
```
