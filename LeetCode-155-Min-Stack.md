---
title: LeetCode-155. Min Stack  
date: 2016-08-18 08:26:35  
categories: Algorithm  
tags:
- LeetCode  
- Java  
---

## 155. Min Stack  

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

+ push(x) -- Push element x onto stack.
+ pop() -- Removes the element on top of the stack.
+ top() -- Get the top element.
+ getMin() -- Retrieve the minimum element in the stack.

**Example:**

```java
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```

## Translation

设计一个栈结构支持 push, pop, top,并且支持常量时间的检索最小元素。

+ push(x) -- 将元素 x push进栈结构。
+ pop() -- 删除栈顶元素。
+ top() -- 获取栈顶元素。
+ getMin() -- 检索栈结构中的最小元素。

**例如：**

```java
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```

## The idea of solving process

栈的 push、pop、top操作都是常量时间，只有获取最小元素操作不是的。**为了能够让获取最小元素操作是产量时间，我们可以使用额外的结构来维护一个最小元素的栈。每次push、和pop操作的时候，同步更新这个最小元素栈结构，保证最小元素一只在栈顶即可。**

这样获取最小元素的时候，只需要获取最小栈的栈顶元素即可。使用栈 s 表示原来的栈，使用栈 minS来维护最小栈。

```java
private Stack<Integer> s, minS;
```

获取最小元素的操作就是获取最小栈 minS 的顶层元素即可。

```java
public int getMin() {
	return minS.peek();
}
```

下面来看一下，在pop和push操作的时候，如何维护这个最小栈。

在将元素 x 进行 push 操作的时候。首先需要检查 minS 是否为空，如果为空，则将元素 x 压入栈顶。否则的话，看栈顶元素是否大于或等于 x。如果大于或等于，也进行入栈操作：

```java
public void push(int x) {
	s.push(x);
	if(minS.empty() || x <= minS.peek())
	{
		minS.push(x);
	}
}
```

在进行元素出栈 pop 操作的时候。如果栈顶元素相等，则同步出栈即可。

```java
public void pop() {
	if(s.pop().intValue() == minS.peek().intValue())
	{
		minS.pop();
	}
}
```

完整代码如下所示：

## AC Code

```java
public class MinStack {
	
    private Stack<Integer> s, minS;
	
    /** initialize your data structure here. */
    public MinStack() {
        s = new Stack<Integer>();
        minS = new Stack<Integer>();
    }
    
    public void push(int x) {
        s.push(x);
        if(minS.empty() || x <= minS.peek())
        {
        	minS.push(x);
        }
    }
    
    public void pop() {
        if(s.pop().intValue() == minS.peek().intValue())
    	{
    		minS.pop();
    	}
    }
    
    public int top() {
        return s.peek();
    }
    
    public int getMin() {
        return minS.peek();
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
```