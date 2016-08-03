---
title: LeetCode-24. Swap Nodes in Pairs  
date: 2016-08-03 18:55:41  
categories: Algorithm  
tags: LeetCode  
---

## 24. Swap Nodes in Pairs

Given a linked list, swap every two adjacent nodes and return its head.

For example,  
Given `1->2->3->4`, you should return the list `as 2->1->4->3`.

Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.

## Translation

给定一个链表，交换每两相邻的节点，并返回它的头节点。  
例如给定链表 `1->2->3->4`, 你应当返回交换之后的链表 `2->1->4->3`。
你的算法应该只使用常量空间，即空间复杂度为O(1)。你可能不修改链表中节点的值，只有节点本身可以改变。

## The idea of solving process

首先找到新的头节点 `newHead` 应当指向开头第二个元素。

```javascript
// 设置新的头节点
var now = head
let newHead = now?.next
var nextNode = newHead?.next
newHead?.next = now
now?.next = nextNode
```

例如要交换第三个和第四个节点，下面是算法的执行流程图：

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/24/1.png)

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/24/2.png)

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/24/3.png)

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/24/4.png)

在纸上画一下下面代码的执行过程对于理解算法的思路比较有帮助，完整的代码如下所示：

## AC Code

```javascript
func swapPairs(head: ListNode?) -> ListNode?
{
    if head == nil || head?.next == nil
    {
        return head
    }
    
    // 设置新的头节点
    var now = head
    let newHead = now?.next
    var nextNode = newHead?.next
    
    // 初始化now指向的节点和newHead指向的节点
    newHead?.next = now
    now?.next = nextNode
    
    while nextNode != nil
    {
        let temp = now
        nextNode = nextNode?.next
        if nextNode == nil
        {
            return newHead
        }
        now = now?.next
        temp?.next = nextNode
        nextNode = nextNode?.next
        now?.next?.next = now
        now?.next = nextNode
    }
    
    return newHead
}
```