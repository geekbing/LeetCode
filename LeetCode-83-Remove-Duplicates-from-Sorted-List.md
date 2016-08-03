---
title: LeetCode-83. Remove Duplicates from Sorted List  
date: 2016-08-03 10:20:39  
categories: Algorithm  
tags: LeetCode  
---

## 83. Remove Duplicates from Sorted List  

Given a sorted linked list, delete all duplicates such that each element appear only once.

For example,
Given `1->1->2`, return `1->2`.
Given `1->1->2->3->3`, return `1->2->3`.

## Translation

给定一个排好序的链表，删除所有的重复元素，这样每个元素只出现一次。  
例如：  
给定 `1->1->2`, 返回 `1->2`.  
给定 `1->1->2->3->3`, 返回 `1->2->3`.

## The idea of solving process

从头到尾遍历链表，使用 `now` 指向当前节点，使用 `nextNode` 指向当前节点的下一个节点。  
每次判断 `now` 指向的节点和 `nextNode` 指向的值是否相等。  

1. 如果相等，则将 `nextNode` 向后移动，然后将 ｀now?.next = nextNode｀，这样就删除了 `nextNode` 处重复的元素
2. 如果不相等，则 `now` 和 `nextNode` 都向后移动一个节点。`nextNode = nextNode?.next`，`now = now?.next`

思路比较简单，完整代码如下所示：

## AC Code

```javascript
func deleteDuplicates(head: ListNode?) -> ListNode?
{
    if head == nil || head?.next == nil
    {
        return head
    }
    
    var now = head
    var nextNode = now?.next
    
    while nextNode != nil
    {
        if now?.val == nextNode?.val
        {
            nextNode = nextNode?.next
            now?.next = nextNode
        }
        else
        {
            nextNode = nextNode?.next
            now = now?.next
        }
    }
    return head
}
```