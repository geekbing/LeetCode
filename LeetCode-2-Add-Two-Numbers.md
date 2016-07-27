---
title: LeetCode-2. Add Two Numbers  
date: 2016-07-27 14:27:10  
categories: Algorithm  
tags: LeetCode
---

### 2. Add Two Numbers

You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

**Input:** (2 -> 4 -> 3) + (5 -> 6 -> 4)

**Output:** 7 -> 0 -> 8


### 题目翻译

给你两个链表表示两个非负整数。链表中的数字按照相反的顺序存储，并且每个节点只包含一个数字。将两个数字相加并返回结果链表。

### 解题思路

题目中链表节点的定义如下：

```javascript
public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
     }
 }
```
题目具体考察链表遍历加和并储存进位。

有些小地方需要注意：

1. 数字存储是反向的，即整数123按照题目中的链表表示为（3 －> 2 －> 1）
2. 题目给的例子恰好有歧义，题目并没有说给出的两个链表长度相同。所以较长的链表后面的值应顺接在结果后面，比如：(1 -> 2) + (2 -> 3 -> 4)的结果应为(3 -> 5 -> 4)
3. 如果两个链表最后节点相加结果有进位，最终结果应该将进位单独算作一个节点，比如： (2 -> 7) + (9 -> 2)的结果应为(1 -> 0 -> 1)

由于链表是单向的，在我们沿着链表方向进行加和时，需要保留链表头部指针位置，所以应使用新的指针沿链表移动。
首先我们应该排除链表为空的情况
```
if l1 == nil
{
	return l2
}
if l2 == nil
{
	return nil
}
```
然后计算两个链表头部的和。sum用来计算每一次的和（对应的进位，l1节点的值，l2节点的值。由于第一次进位为0，所以只需要计算两个链表表头的和）
```
var sum = l1!.val + l2!.val
```
使用新的指针指向`l1`和`l2`的下一节点，用于后面移动读取数值
```
var next1 = l1?.next
var next2 = l2?.next
```
然后将和的个位赋予链表`l3`的头部节点，l3将是我们要返回的结果链表的头节点
```
let l3 = ListNode(sum % 10)
```
使用新的指针指向结果l3，用于后面移动存储结果
```
var node = l3
```
计算和的进位
```
var carrybit = sum / 10
```
综合上面的分析，输出链表l3结束的条件为必须同时满足以下两个条件：

1. 链表`l1`和`l2`当前节点均为nil
2. 当前进位为0

于是循环体为：
```
while (next1 != nil) || (next2 != nil) || (carrybit != 0)
{
    ...
}
```
由于在循环体中，不能保证每次循环`l1`和`l2`中的节点都存在，所以要进行简单判断，不存在的时候赋值0
```
a = next1 != nil ? next1!.val : 0
b = next2 != nil ? next2!.val : 0
sum = a + b + carrybit
```
其中`a`和`b`为某次计算`l1`与`l2`之和时两个链表节点对应的值，结合起来就是
```
sum = carrybit + (next1 != nil ? next1!.val : 0) + (next2 != nil ? next2!.val : 0)
```
移动`l1`和`l2`到下一个节点时，同样我们也需要判断一下l1和l2是否还存在下一节点，不存在的时候赋值nil

```
next1 = (next1 != nil) ? next1?.next : nil
next2 = (next2 != nil) ? next2?.next : nil
```

下面是完整的AC代码：

### AC Code  

```
class Solution
{
    func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        if l1 == nil
        {
            return l2
        }
        if l2 == nil
        {
            return nil
        }
        var sum = l1!.val + l2!.val
        var carrybit = sum / 10
        var next1 = l1?.next
        var next2 = l2?.next
        let l3 = ListNode(sum % 10)
        var node = l3
        
        while next1 != nil || next2 != nil || carrybit != 0
        {
            sum = carrybit + (next1 != nil ? next1!.val : 0) + (next2 != nil ? next2!.val : 0)
            carrybit = sum / 10
            node.next = ListNode(sum % 10)
            node = node.next!
            next1 = (next1 != nil) ? next1?.next : nil
            next2 = (next2 != nil) ? next2?.next : nil
        }
        return l3
    }
}
```