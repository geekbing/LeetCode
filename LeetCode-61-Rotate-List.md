---
title: LeetCode-61. Rotate List  
date: 2016-08-14 11:37:41  
categories: Algorithm  
tags: LeetCode  
---

## 61. Rotate List  

Given a list, rotate the list to the right by k places, where k is non-negative.

For example:  
Given `1->2->3->4->5->NULL` and `k = 2`,
return `4->5->1->2->3->NULL`.

## Translation

给定一个链表，将链表向右旋转 k 步，并且 k 是非负整数。
例如:  
给定 `1->2->3->4->5->NULL` ，`k = 2`,
返回 `4->5->1->2->3->NULL`.

## The idea of solving process

大致思路：可以考虑将链表的首尾相连形成一个环，这样只需要断开一个地方就完成了题目的向右旋转了。  
下面叙述详细思路。首先，排除一些特殊的情况：

```swift
if head == nil || head?.next == nil || k == 0
{
	return head
}
```

为了将链表首尾相连接形成一个环，需要先遍历到链表尾部。

```swift
// 统计链表长度
var count = 1
var now = head
while now?.next != nil
{
	now = now?.next
	count += 1
}
```

遍历结束之后， now 指向链表末尾。此时只需要将末尾的指针指向头节点，就可以将链表连成一个环：

```swift
now?.next = head
```

重新计算得到新的需要移动的步数:

```swift
let step = k % count
``` 

下面要考虑的问题就是，具体在什么地方断开链表。

```swift
var preNode = head
while count != (step + 1)
{
	preNode = preNode?.next
	count -= 1
}
```

得到新的头节点 `newHead`，和头节点之前的节点 `preNode`。将 `preNode`的 `next` 指向 nil 就完成了断开链表。

```swift
let newHead = preNode?.next
preNode?.next = nil
```

返回新的头节点 `newHead` 即可。完整代码如下所示：

## AC Code

```swift
func rotateRight(head: ListNode?, _ k: Int) -> ListNode?
{
    // 排除特殊情况
    if head == nil || head?.next == nil || k == 0
    {
        return head
    }
    // 统计链表长度
    var count = 1
    var now = head
    while now?.next != nil
    {
        now = now?.next
        count += 1
    }
    // 将链表连成一个环
    now?.next = head
    // 需要移动的步数
    let step = k % count
    
    var preNode = head
    while count != (step + 1)
    {
        preNode = preNode?.next
        count -= 1
    }
    // 得到新的头节点，和头节点之前的节点
    let newHead = preNode?.next
    preNode?.next = nil
    return newHead
}
```