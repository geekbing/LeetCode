---
title: LeetCode-328. Odd Even Linked List  
date: 2016-08-10 09:16:07  
categories: Algorithm  
tags: LeetCode  
---

## 328. Odd Even Linked List  

Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.

You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.

**Example:**
Given `1->2->3->4->5->NULL`,  
return `1->3->5->2->4->NULL`.

**Note:**
The relative order inside both the even and odd groups should remain as it was in the input. 
The first node is considered odd, the second node even and so on ...

## Translation

给定一个单链表，将所有偶数节点组合在一起接在奇数节点的组合之后。请注意这里我们讨论的奇偶是指节点的编号，而不是节点的值。
程序的时间复杂度应该为O(1)，空间的复杂度应该为O(节点)。
**例如：**  
给定 `1->2->3->4->5->NULL`，   
返回 `1->3->5->2->4->NULL`。  
**注意：**  
偶数和奇数组里面的相对顺序都应该和输入保持一致。
第一个节点被认为是奇数节点，第二个节点是偶数节点等等…

## The idea of solving process

使用 `now` 指向当前节点，使用 `nextNode` 指向 `now` 的下一个节点。

```swift
var now = head
var next = now?.next
```

为了最后能够贱将偶数节点分组接在奇数节点分组之后，需要事先保存偶数链表的头节点（即第二个节点）。

```swift
// 首先保存偶数节点的头节点
let evenHead = next
```

为了达到奇偶分组的目的，只需要当前节点的 `next` 指向下下一个节点即可。即每一个节点指向下下一个节点即可。下面的代码可以实现当前节点指向下下一个节点。

```swift
// 记录节点的总个数
var nodeCount = 2
while nextNode?.next != nil
{
	let temp = nextNode
	nextNode = nextNode?.next
	now?.next = nextNode
	now = temp
        
	nodeCount += 1
}
```

不断的向后移动 `now` 和 `nextNode` 即可完成整条链表中每一个节点都指向下下一个节点。循环遍历结束之后，由于总节点数可能为奇数或者为偶数，所以需要分情况讨论。

```swift
// 如果节点数量是偶数，则now指向最后的奇数节点
if nodeCount % 2 == 0
{
	now?.next = evenHead   
}
else // 节点数量是奇数，则next指向最后的奇数节点
{
	now?.next = nil
	nextNode?.next = evenHead
}
```

完整代码如下所示：

## AC Code

```swift
func oddEvenList(head: ListNode?) -> ListNode?
{
    if head == nil || head?.next == nil || head?.next?.next == nil
    {
        return head
    }
    
    var now = head
    var nextNode = now?.next
    // 首先保存偶数节点的头节点
    let evenHead = nextNode
    
    // 记录节点的总个数
    var nodeCount = 2
    while nextNode?.next != nil
    {
        let temp = nextNode
        nextNode = nextNode?.next
        now?.next = nextNode
        now = temp
        
        nodeCount += 1
    }
    
    // 如果节点数量是偶数，则now指向最后的奇数节点
    if nodeCount % 2 == 0
    {
        now?.next = evenHead
    }
    else // 节点数量是奇数，则next指向最后的奇数节点
    {
        now?.next = nil
        nextNode?.next = evenHead
    }
    return head
}
```
