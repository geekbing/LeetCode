---
title: LeetCode-225. Implement Stack using Queues  
date: 2016-08-15 16:53:12  
categories: Algorithm  
tags:
- LeetCode  
- Java  
---

## 225. Implement Stack using Queues  

Implement the following operations of a stack using queues.

+ push(x) -- Push element x onto stack.
+ pop() -- Removes the element on top of the stack.
+ top() -- Get the top element.
+ empty() -- Return whether the stack is empty.

**Notes:**  

+ You must use only standard operations of a queue -- which means only `push to back`, `peek/pop from front`, `size`, and `is empty` operations are valid.
+ Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
+ You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).

## Translation

使用队列来实现下面的栈操作：

+ push(x) -- 将元素 x 压入栈。
+ pop() -- 删除栈顶元素。
+ top() -- 获取栈顶的元素。
+ empty() -- 返回栈是否是空的。

**注意：**  

+ 你必须只使用队列的标准操作 -- 这就意味着你只能使用 `push to back`, `peek/pop from front`, `size`, 以及使用 `is empty` 操作都是合法的。
+ 根据你使用的编程语言，队列有可能没有原生支持。你可以使用链表或队列(双向队列)来模拟一个队列，只要你只使用队列的标准操作。
+ 你可以假定所有操作都是有效的(例如，不会向空的栈调用 pop 或 top 操作)。

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以使用 Java 来编写代码。**  
这一题和之前的 [232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/) 使用栈来实现队列刚好是相反的，之前的[博客文章地址](http://geekbing.com/2016/08/15/LeetCode-232-Implement-Queue-using-Stacks/)。大致思路基本一样，但是又有所区别。  
使用队列来模拟栈的基本操作。**队列有先进先出，栈有先进后出的特点。**  

1. 模拟栈的 push(x) -- 将元素 x 压入栈。对于队列结构来说，就需要将元素放在队列的最前面，然而又只能使用队列的基本操作。所以需要额外的队列来做中转。首先将 x 进入队列2，然后将队列1的所有元素依次进入队列2。这样队列2就是将元素 x 压入栈之后想要的结果了。最后只需要将队列1和队列2互换就可以了。
2. 模拟栈的pop() 操作-- 删除栈顶元素。对应于队列的 poll() 操作
3. 模拟栈的top() 操作-- 获取栈顶的元素。对应于队列的 peek() 操作
4. 模拟栈的empty() 操作-- 返回栈是否是空的。对应于队列的 isEmpty() 操作

有一个小地方需要注意的是：**在 Java 中 Stack 是类，而 Queue 是接口。 使用队列需要 new 一个它的实现类，例如：`Queue<Integer> Q1 = new LinkedList<>();`**

完整代码如下所示

## AC Code

```java
public class MyQueue 
{
    private Queue<Integer> Q1 = new LinkedList<>();
    private Queue<Integer> Q2 = new LinkedList<>();
    
    // Push element x onto stack.
    public void push(int x) 
    {
        Q2.offer(x);
        while(!Q1.isEmpty())
        {
        	Q2.offer(Q1.poll());
        }
        Queue<Integer> temp = Q1;
        Q1 = Q2;
        Q2 = temp;
    }

    // Removes the element on top of the stack.
    public void pop() 
    {
        if(!empty())
        {
        	Q1.poll();
        }
    }

    // Get the top element.
    public int top() 
    {
        if(!empty())
        {
        	return Q1.peek();
        }
        return 0;
    }

    // Return whether the stack is empty.
    public boolean empty() 
    {
        return Q1.isEmpty();
    }
}
```