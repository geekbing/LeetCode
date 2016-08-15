---
title: LeetCode-232. Implement Queue using Stacks
date: 2016-08-15 16:53:28
categories: Algorithm  
tags:
- LeetCode  
- Java  
---

## 232. Implement Queue using Stacks

Implement the following operations of a queue using stacks.

+ push(x) -- Push element x to the back of queue.
+ pop() -- Removes the element from in front of queue.
+ peek() -- Get the front element.
+ empty() -- Return whether the queue is empty.

**Notes:**  

+ You must use only standard operations of a stack -- which means only `push to top`, `peek/pop from top`, `size`, and `is empty` operations are valid.
+ Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
+ You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).

## Translation

使用栈来实现如下的队列操作。

+ push(x) -- 将元素 x 添加到队列的末尾。
+ pop() -- 删除队列最前面的元素。
+ peek() -- 获取队列最前面的元素。
+ empty() -- 返回队列是否为空。

**注意：**  

+ 你必须只能使用栈的基本操作 -- 意味着你只能使用 `push to top`, `peek/pop from top`, `size`, 并且使用 `is empty` 操作也是合法的。
+ 根据你使用的编程语言，栈有可能没有原生支持。你可以使用链表或队列(双向队列)来模拟一个堆栈，只要你只使用堆栈的标准操作。
+ 你可以假定所有操作都是有效的(例如，不会向空的队列调用 pop 或 peek操作)。

## The idea of solving process

**由于这题暂时不能使用 Swift 来提交代码，所以使用 Java 来编写代码。**  
使用栈来模拟队列的基本操作。**队列有先进先出，栈有先进后出的特点。**

1. 模拟队列的 push(x) 操作--将元素 x 添加到队列的末尾。对于栈结构来说，就是需要将元素压入栈底。而栈只支持栈顶元素的入栈和出栈操作。所以，可以考虑使用一个额外的栈来做中转。先将前面栈的所有元素依次出栈并压入第二个栈。然后将元素 x 压入第一个栈的栈底。最后依次将第二个栈的所有元素依次出栈并压入第一个栈。这样就完整了中转。
2. 模拟队列的 pop() 操作--删除队列最前面的元素。可以对应到栈的 pop() 操作。
3. 模拟队列的 peek() 操作 -- 获取队列最前面的元素。可以对应栈的 peek() 操作。
4. 模拟队列的 empty() 操作 -- 返回队列是否为空。可以对应栈的 empty() 操作。

完整代码如下所示：

## AC Code

```java
class MyQueue 
{    
    private Stack<Integer> stack1 = new Stack<Integer>();
	private Stack<Integer> stack2 = new Stack<Integer>();
	
    // Push element x to the back of queue.
    public void push(int x) 
    {
        if(stack1.empty())
        {
        	stack1.push(x);
        }
        else
        {
        	while(!stack1.empty())
        	{
        		stack2.push(stack1.pop());
        	}
        	stack1.push(x);
        	while(!stack2.empty())
        	{
        		stack1.push(stack2.pop());
        	}
        }
    }

    // Removes the element from in front of queue.
    public void pop() 
    {
        if(!stack1.empty())
        {
            stack1.pop();    
        }
    }

    // Get the front element.
    public int peek() 
    {
        if(!stack1.empty())
        {
            return (int) stack1.peek();    
        }
        return 0;
    }

    // Return whether the queue is empty.
    public boolean empty() 
    {
        return stack1.empty();
    }
}
```