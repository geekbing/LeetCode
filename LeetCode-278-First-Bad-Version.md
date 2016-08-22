---
title: LeetCode-278. First Bad Version  
date: 2016-08-18 08:46:57  
categories: Algorithm  
tags:  
- LeetCode  
- Java  
---

## 278. First Bad Version  

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

## Translation

你是一个产品经理，目前领导着一个团队开发一个新产品。不幸的是，你的产品的最新版本不能通过质量检查。因为每个版本都是基于之前的版本开发的，一个坏的版本之后的所有版本都是坏的。  
假设你有 n 个版本 [1, 2, ..., n]，你想要找到第一个坏的版本，这个坏的版本导致接下来的所有版本都是坏的。  
给你了一个API `bool isBadVersion(version)`  将返回一个版本是否是好的。你来实现一个函数来找到第一个坏的版本。你应该使API调用的次数最少。

## The idea of solving process

第一印象就是变形的二分查找法。

1. 如果第一个版本是坏的，则返回1。
2. 使用指针 low 指向 2，high 指向 n。
3. 每次计算 low 和 high 中间的值 `min = low + (high - low) / 2;` **需要注意防止溢出**
4. 如果 low 指向的版本是坏版本，则返回 low。
5. 再判断 min 指向的版本，如果 min 指向的版本是坏版本，则需要缩小范围 `high = min;`
6. 否则的话，low 指针向右移动一步。`low = min + 1;`

完整代码如下所示：

## AC Code

```java
/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */
	
public class Solution extends VersionControl {
	public int firstBadVersion(int n) {
		if(isBadVersion(1))
		{
			return 1;
		}
		int low = 2;
		int high = n;
		int min = 2 + (n - 2) / 2;
		while(low <= high)
		{
			if(isBadVersion(low))
			{
				return low;
			}
			if(isBadVersion(min))
			{
				high = min;
			}
			else
			{
				low = min + 1;
			}
			min = low + (high - low) / 2;
		}
		return low;
	}
}
```