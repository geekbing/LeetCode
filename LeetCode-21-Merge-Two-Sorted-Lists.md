---
title: LeetCode-21. Merge Two Sorted Lists  
date: 2016-08-05 14:12:21  
categories: Algorithm  
tags: LeetCode  
---

## 21. Merge Two Sorted Lists  

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

## Translation

合并两个有序链表并返回一个新的列表。新列表应该是通过拼接前两个列表节点得到的。

## The idea of solving process

采用递归的思路来解决这一道题目的话，非常简单。

很容易想到递归结束的条件就是 `l1` 或 `l2` 为空。

```swift
if l1 == nil
{
	return l2
}
if l2 == nil
{
	return l1
}
```

接着比较 `l1` 和 `l2` 当前节点的值。
如果 `l1` 的当前值小于 `l2`，则可以递归调用当前函数，将 `l1` 接下去的链表和 `l2` 合并排序好之后接在 `l1` 后面即可。 

```swift
if l1?.val < l2?.val
{
	l1?.next = mergeTwoLists(l1?.next, l2)
	return l1
}
```

反之，如果 `l1` 的当前值大于 `l2`，则可以递归调用当前函数，将 `l1` 和 `l2` 接下去的链表合并排序好之后接在 `l2` 后面即可。 

```swift
l2?.next = mergeTwoLists(l1, l2?.next)
return l2
```

完整代码如下所示：

## AC Code

```swift
func mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode?
{
    if l1 == nil
    {
        return l2
    }
    if l2 == nil
    {
        return l1
    }
    if l1?.val < l2?.val
    {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }
    else
    {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}
```