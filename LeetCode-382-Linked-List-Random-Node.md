---
title: LeetCode-382. Linked List Random Node  
date: 2016-08-16 16:36:55  
categories: Algorithm  
tags:  
- LeetCode  
- Java  
---

## 382. Linked List Random Node  

Given a singly linked list, return a random node's value from the linked list. Each node must have the **same probability** of being chosen.

**Follow up:**
What if the linked list is extremely large and its length is unknown to you? Could you solve this efficiently without using extra space?

**Example:**

```
// Init a singly linked list [1,2,3].
ListNode head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
Solution solution = new Solution(head);

// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
solution.getRandom();
```

## Translation

给定一个单链表，返回链表随机的节点值，每一个节点被选中的可能性应当相同。  
**更进一步：**  
假如链表的长度非常大并且它的长度未知呢？你能高效的解决这题而不使用额外的空间吗？  
例如：

```
// Init a singly linked list [1,2,3].
ListNode head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
Solution solution = new Solution(head);

// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
solution.getRandom();
```

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以使用 Java 来编写代码。**

从链表中完全随机的选中一个节点。这让我想起了大学里宿舍同学点完外卖之后，摇骰子来决定谁下去拿外卖，谁摇的号最大（或者最小）就下去拿外卖。

对应到这题，从头向后遍历节点，对于每一个节点，生成一个随机数，选出最大的随机数即可。

```java
double max = 0;
ListNode nextNode = head;
int ans = 0;
while(nextNode != null)
{
	double random = Math.random();
	if(random > max)
	{
		max = random;
		ans = nextNode.val;
	}
	nextNode = nextNode.next;
}
```

完整的代码如下所示：

## AC Code

```java
public class Solution 
{
    /** @param head The linked list's head.
    Note that the head is guaranteed to be not null, so it contains at least one node. */
	ListNode head;
	public Solution(ListNode head) 
	{
	    this.head = head;
	}
	
	/** Returns a random node's value. */
	public int getRandom() 
	{
		double max = 0;
		ListNode nextNode = head;
		int ans = 0;
		while(nextNode != null)
		{
			double random = Math.random();
			if(random > max)
			{
				max = random;
				ans = nextNode.val;
			}
			nextNode = nextNode.next;
		}
		return ans;
	}
}
```