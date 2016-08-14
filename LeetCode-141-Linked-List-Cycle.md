---
title: LeetCode-141. Linked List Cycle  
date: 2016-08-14 15:14:39  
categories: Algorithm  
tags: LeetCode  
---

## 141. Linked List Cycle  

Given a linked list, determine if it has a cycle in it.

Follow up:  
Can you solve it without using extra space?

## Translation

给定一个链表，判断它是否有一个环。  
更进一步：你能否不用额外的空间来解决这题？

## The idea of solving process

非常经典的数据结构的题目了。主要思路如下：

1. 使用两个指针，初始的时候都指向头节点。
2. 慢的指针每次先后移动 1 步，快的指针每次向后移动 2 步。
3. 如果有环，则在环中，快的指针肯定至少会比慢的多跑一圈并追上慢的指针。
4. 所以，如果快指针等于慢指针，则说明有环。

就像一快一慢的两个同学在操场跑步，如果赛道永远是直的，则快的同学永远不可能和慢的同学相遇。如果赛道是环形的，由于快的同学的速度是慢的同学的 2 倍，则快的同学肯定会遇到慢的同学。

清楚思路之后，写代码就很容易了。

## AC Code

```java
public class Solution 
{
    public boolean hasCycle(ListNode head) 
    {
		ListNode slow = head;
		ListNode fast = head;
		while(fast != null && fast.next != null)
		{
			slow = slow.next;
			fast = fast.next.next;		
			if(slow == fast)
			{
				return true;
			}
		}
		return false;
    }
}
```