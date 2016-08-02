---
title: LeetCode-92. Reverse Linked List II  
date: 2016-08-02 21:15:17  
categories: Algorithm  
tags: LeetCode  
---

## 92. Reverse Linked List II

Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:  
Given `1->2->3->4->5->NULL`, m = 2 and n = 4,

return `1->4->3->2->5->NULL`.

**Note:**  
Given m, n satisfy the following condition:  
1 ≤ m ≤ n ≤ length of list.

## Translation

将链表 从 m 到 n 反转。不要使用额外的空间且只循环一遍链表。  
例如:  给定链表为 `1->2->3->4->5->NULL`, m = 2，n = 4，返回 `1->4->3->2->5->NULL`.
**注意:**  
给定的 m, n 满足下面的条件：  
1 ≤ m ≤ n ≤ 链表的长度。

## The idea of solving process

这一题与之前 [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/) ，这是之前的 [解题过程](http://geekbing.com/2016/08/02/LeetCode-206-Reverse-Linked-List/) 。  
之前那道题目采用一个 `now` 指向当前节点， `nextNode` 指向当前节点的下一个节点，不断的向后移动，反转链表的指向。主要循环代码如下：

```javascript
while nextNode != nil
{
	let temp = nextNode
	nextNode = nextNode?.next
	temp?.next = now
	now = temp
}
```

对于现在的这题，同样可以采用这种方案。只是需要找到开始循环反转的起点，即首先要定位到开始循环反转的 `now` 节点。  **并且为了后续处理反转之后部分的首尾指针的方便，我们需要事先使用变量保存循环起点 `now` 之前的那个节点**。由于当 `m == 1` 时，头节点之前没有节点，所以需要分情况讨论：  
**当 `m == 1` 时，需要新构建一个节点 `begin`， `begin` 的 `next` 指向链表头部。**

```javascript
begin = ListNode(0)
begin?.next = head
now = head
```

**当 `m != 1` 时，循环找到反转的起点 `now` 节点的位置，`now` 之前的节点就是 `begin` 节点。**

```javascript
now = head
for _ in 0..<(m - 2)
{
	now = now?.next
}
// 暂时保留
begin = now
now = now?.next
```

循环反转的代码比较简单：

```javascript
// 反转
var i = m
while i < n && nextNode != nil
{
	let temp = nextNode
	nextNode = nextNode?.next
	temp?.next = now
	now = temp
	i += 1
}
```

需要注意的是反转结束之后首尾指针的处理同样需要分情况讨论：

```javascript
// 处理循环反转之后的首尾指针
begin?.next?.next = nextNode
if m == 1
{
	return now
}
else
{
    begin?.next = now
    return head
}
```

对照着下面的完整代码，在纸上画一下执行过程对于该题的理解比较有帮助。特别是最后处理循环结束之后的首尾指针的问题。完整代码如下所示：

## AC Code

```javascript
func reverseBetween(head: ListNode?, _ m: Int, _ n: Int) -> ListNode?
{
    var begin: ListNode?
    var nextNode: ListNode?
    var now: ListNode?
    
    // 排除特殊的情况
    if m == n
    {
        return head
    }
    
    // 不是从头开始反转
    if m != 1
    {
        now = head
        for _ in 0..<(m - 2)
        {
            now = now?.next
        }
        // 暂时保留
        begin = now
        now = now?.next
    }
    else
    {
        begin = ListNode(0)
        begin?.next = head
        now = head
    }
    nextNode = now?.next
    
    // 反转
    var i = m
    while i < n && nextNode != nil
    {
        let temp = nextNode
        nextNode = nextNode?.next
        temp?.next = now
        now = temp
        i += 1
    }
    
    // 处理反转部分的首尾部分
    begin?.next?.next = nextNode
    if m == 1
    {
        return now
    }
    begin?.next = now
    return head
}
```

