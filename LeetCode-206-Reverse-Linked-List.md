---
title: LeetCode-206. Reverse Linked List  
date: 2016-08-02 14:13:50  
categories: Algorithm  
tags: LeetCode  
---


## 206. Reverse Linked List  

Reverse a singly linked list.

**Hint:**  
A linked list can be reversed either iteratively or recursively. Could you implement both?

## Translation

反转一个单链表。  
**提示：**  
反转一个单链表可以采用迭代或者递归的方式。你能都实现吗?

## The idea of solving process

我们分别采用递归和迭代的方式来解决这道题目。

迭代的方法：  
使用指针 `now` 指向当前节点，使用指针 `nextNode` 指向下一个节点。  初始化的时候，`now` 指向head，`nextNode` 指向 `head?.next`。

```javascript
var now = head
var nextNode = head?.next
```

同时需要将 `head` 的 `next` 节点设置为 nil，因为反转之后，头节点将变为最后一个。

```javascript
now?.next = nil
```

循环主体代码：

```javascript
while nextNode != nil
{
	let temp = nextNode
	nextNode = nextNode?.next
	temp?.next = now
	now = temp
}
```

完整代码请查看最后的迭代方法：

递归的方法：  
将头节点右边的部分看成一个整体，调用递归方法反转

```javascript
// 反转剩下的链表
let rest = reverseList(head?.next)
```

使用变量 `tail` 保存右边整体反转后的最后一个节点

```javascript
// head->next 是右边部分反转后的最后一个元素
let tail = head?.next   
```

将tail指向head，通过这种方式使得head成为了反转链表新的尾部

```javascript
tail?.next = head
```     

使用nil结束反转链表

```javascript
head?.next = nil
```

完整代码请查看最后的递归方法：

## AC Code

迭代的方法：

```javascript
func reverseList(head: ListNode?) -> ListNode?
{
    if head == nil || head?.next == nil
    {
        return head
    }
    
    var now = head
    var nextNode = head?.next
    now?.next = nil
    
    while nextNode != nil
    {
        let temp = nextNode
        nextNode = nextNode?.next
        temp?.next = now
        now = temp
    }
    return now
}
```

递归的方法：

```javascript
func reverseList(head: ListNode?) -> ListNode?
{
    if head == nil || head?.next == nil
    {
        return head
    }
    else
    {
        // 反转剩下的链表
        let rest = reverseList(head?.next)
        
        // head->next 是反转后链表的最后一个元素
        let tail = head?.next
        
        // 将tail指向head，通过这种方式使得head成为了反转链表新的尾部
        tail?.next = head
        
        // 使用nil结束反转链表
        head?.next = nil
        
        return rest
    }
}
```