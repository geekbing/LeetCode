---
title: LeetCode-237. Delete Node in a Linked List  
date: 2016-08-15 14:48:15  
categories: Algorithm  
tags: LeetCode  
---

## 237. Delete Node in a Linked List  

Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

Supposed the linked list is `1 -> 2 -> 3 -> 4` and you are given the third node with value `3`, the linked list should become `1 -> 2 -> 4` after calling your function.

## Translation

编写一个函数来删除单链表中的一个节点(尾部节点除外)，并且你只能访问改节点。  
假如链表是 `1 - > 2 - > 3 - > 4` ，并且只给你第三个节点，它的值为`3`，在调用你的函数之后，链表应该变为 `1 - > 2 - > 4`。

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以暂时使用 Java 来编写代码。**

数据结构课程中最基本的题目了。在只能访问当前节点的情况下，要删除当前节点，只需要将当前节点的值赋值为下一个节点，并且将当前节点的next指向下下个节点即可。示意图如下所示：

1. 需要删除第三个节点
![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160815/1.png)

2. 先将第三个节点的值赋值为后一个节点的值
![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160815/2.png)

3. 然后将第三个节点指向下下一个节点
![image](http://diary123.oss-cn-shanghai.aliyuncs.com/20160815/3.png)

完整代码如下所示：

## AC Code

```java
public class Solution 
{
    public void deleteNode(ListNode node) 
    {
		node.val = node.next.val;
		node.next = node.next.next;
    }
}
```