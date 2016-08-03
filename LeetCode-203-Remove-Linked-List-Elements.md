---
title: LeetCode-203. Remove Linked List Elements  
date: 2016-08-03 15:46:33  
categories: Algorithm  
tags: LeetCode  
---

## 203. Remove Linked List Elements  

Remove all elements from a linked list of integers that have value val.

**Example**  
**Given:** 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, **val** = 6  
**Return:** 1 --> 2 --> 3 --> 4 --> 5

## Translation

删除链表中所有值为 `val` 的节点。  
**例如，给定:** 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, **val** = 6  
**返回:** 1 --> 2 --> 3 --> 4 --> 5

## The idea of solving process

非常常规的链表操作题目。因为有可能删除的元素在链表的表头，所以需要先找到链表值不为 `val` 的新表头：

```javascript
var newHead = head
while newHead?.val == val
{
	newHead = newHead?.next
}
```

然后使用 `now` 指向新的表头，使用 `nextNode` 指向 `now` 的下一个节点。

```javascript
var now = newHead
var nextNode = now?.next
```

循环判断 `nextNode` 指向的节点值是否是 `val`。

1. 如果是，则需要将该节点删除，即该节点前面的节点指向该节点之后的节点即可。  
`nextNode = nextNode?.next`， `now?.next = nextNode`

2. 如果不是，则 `now` 和 `nextNode` 继续向后移动，判断下一个节点。  
`now = now?.next`，`nextNode = nextNode?.next`

## AC Code

```javascript
func removeElements(head: ListNode?, _ val: Int) -> ListNode?
{
    var newHead = head
    while newHead?.val == val
    {
        newHead = newHead?.next
    }
    
    var now = newHead
    var nextNode = now?.next
    while nextNode != nil
    {
        if nextNode?.val == val
        {
            nextNode = nextNode?.next
            now?.next = nextNode
        }
        else
        {
            now = now?.next
            nextNode = nextNode?.next
        }
    }
    
    return newHead
}
```