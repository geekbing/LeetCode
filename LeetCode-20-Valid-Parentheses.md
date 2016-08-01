---
title: LeetCode-20. Valid Parentheses  
date: 2016-08-01 17:58:24  
categories: Algorithm  
tags: LeetCode  
---

### 20. Valid Parentheses  

Given a string containing just the characters `'(', ')'`, `'{', '}'`, `'[' and ']'`, determine if the input string is valid.

The brackets must close in the correct order, `"()"` and `"()[]{}"` are all valid but `"(]"` and `"([)]"` are not.

### Translation

给定一个只包含 `'(', ')'`, `'{', '}'`, `'[' and ']'` 这些字符的字符串, 判断该字符串是不是合法的。

括号必须以正确的顺序闭合，`"()"` 和 `"()[]{}"` 都是合法的，但是 `"(]"` and `"([)]"` 不是合法的。

### The idea of solving process

这道题目考察的是非常基本的堆栈操作。

**从头到尾扫描字符串，如果当前字符和栈顶的字符匹配，则栈执行出栈pop操作，删除栈顶元素；
如果不匹配，则需要将当前元素入栈，执行push操作。**

**需要注意的地方是，如果栈为空，则需要先进行入栈push操作。**

可以使用数组模仿栈的特性：

```
var stack = [Character]()
```

出栈pop操作即删除数组最后一个元素：

```
stack.removeLast()
```

入栈push操作即在数组最后追加一个新的元素：

```
stack.append(char)
```

验证char1 和 char2 时候匹配，char1在前面。
```javascript
func isMatch(char1: Character, char2: Character) -> Bool
{
    let matchs = ["()", "{}", "[]"]
    return matchs.contains(String(char1) + String(char2))
}
```

思路比较简单，完整代码如下所示：

### AC Code

```javascript
// 验证char1 和 char2 时候匹配，char1在前面
func isMatch(char1: Character, char2: Character) -> Bool
{
    let matchs = ["()", "{}", "[]"]
    return matchs.contains(String(char1) + String(char2))
}

func isValid(s: String) -> Bool
{
    var stack = [Character]()
    
    for char in s.characters
    {
        if stack.count == 0
        {
            stack.append(char)
        }
        else
        {
            if isMatch(stack.last!, char2: char)
            {
                stack.removeLast()
            }
            else
            {
                stack.append(char)
            }
        }
    }
    
    if stack.count == 0
    {
        return true
    }
    return false
}
```