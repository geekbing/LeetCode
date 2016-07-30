---
title: LeetCode-36. Valid Sudoku  
date: 2016-07-30 13:31:55  
categories: Algorithm  
tags: LeetCode  
---

### 36. Valid Sudoku

说起数独游戏，以前在地铁上经常会玩数独游戏打发时间。后来学习Javascript的时候开发过一款网页版本的[数独游戏](http://geekbing.com/games/sudu/)。无聊之余又开发了专门用来求解数独的程序：[Web版本](http://geekbing.com/games/sudu-crack/)，[iOS版数独求解](https://itunes.apple.com/cn/app/shu-du-qiu-jie/id1091419415?l=en&mt=8)

欢迎大家访问或者下载:)。

Determine if a Sudoku is valid, according to: [Sudoku Puzzles - The Rules](http://sudoku.com.au/TheRules.aspx).

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/sudoku.png)

A partially filled sudoku which is valid.

**Note:**

A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

### 题目翻译

根据[Sudoku Puzzles - The Rules](http://sudoku.com.au/TheRules.aspx)来判断一个数独是否合法。

数独棋盘可能是部分被填满，空的小方格用字符`.`填充。

![image](http://diary123.oss-cn-shanghai.aliyuncs.com/sudoku.png)  

上面是一个典型的合法的数独

**注意**

一个合法的数独棋盘（部分填充）并不一定是可求解的。只需要验证其否合法性。

### 解题思路

**数独的3条简单规则如下：**

1. 数独的每一行的数字均含1-9，不重复。
2. 数独的每一列的数字均含1-9，不重复。
3. 数独的每一宫（即小九宫格）均含1-9，不重复。

判断一个数独棋盘是否合法，就可以分别去判断是否满足上面的三条规则即可。

首先写一个函数，判断1个数组中1-9是否最多出现1次。将出现的字符当作字典的key，出现次数当做value存储进字典即可，然后判断对于字典的每一个key，它的value代表的次数是否大于1即可。代码如下：

```javascript
// 判断数组是否1-9最多1个
func isArrValid(arr: [Character]) -> Bool
{
    var dict: [Character: Int] = [:]
    
    for str in arr
    {
        if str != "."
        {
            if dict[str] == nil
            {
                dict[str] = 1
            }
            else
            {
                dict[str]! += 1
            }
        }
    }
    
    for key in dict.keys
    {
        if dict[key] > 1
        {
            return false
        }
    }
    return true
}
```

接下来，判断棋盘的行是否满足要求。代码也很简单，对于棋盘的每一行，看成一个数组，分别调用上面的方法来判断即可，代码如下：

```javascript
func isRowValid(board: [[Character]]) -> Bool
{
    for row in board
    {
        if !isArrValid(row)
        {
            return false
        }
    }
    return true
}
```

判断棋盘的列是否满足要求。对于棋盘的每一列，看成一个数组，分别调用上面的方法来判断即可，代码如下：

```javascript
func isColValid(board: [[Character]]) -> Bool
{
    for i in 0..<board.count
    {
        var arr = [Character]()
        for j in 0..<board[i].count
        {
            arr.append(board[j][i])
            if !isArrValid(arr)
            {
                return false
            }
        }
    }
    return true
}
```

紧接着判断棋盘的每一宫是否满足要求。同样的将棋盘的每一宫组成一个数组，分别调用上面的方法来判断即可，代码如下：

```javascript
func isMatrixValid(board: [[Character]]) -> Bool
{
    for i in 0...2
    {
        for j in 0...2
        {
            var arr = [Character]()
            for x in (1 + 3 * i)...(3 + 3 * i)
            {
                for y in (1 + 3 * j)...(3 + 3 * j)
                {
                    arr.append(board[x - 1][y - 1])
                    if !isArrValid(arr)
                    {
                        return false
                    }
                }
            }
        }
    }
    return true
}
```

最后，只要棋盘同时满足上面的三个条件就是合法的，否则不合法，代码如下：

```javascript
func isValidSudoku(board: [[Character]]) -> Bool
{
    return isRowValid(board) && isColValid(board) && isMatrixValid(board)
}
```

完整的代码如下所示：

### AC Code

```javascript
// 判断数组是否最多包含1-9各1个
func isArrValid(arr: [Character]) -> Bool
{
    var dict: [Character: Int] = [:]
    
    for str in arr
    {
        if str != "."
        {
            if dict[str] == nil
            {
                dict[str] = 1
            }
            else
            {
                dict[str]! += 1
            }
        }
    }
    
    for key in dict.keys
    {
        if dict[key] > 1
        {
            return false
        }
    }
    return true
}
	
// 判断每一行是否合理
func isRowValid(board: [[Character]]) -> Bool
{
    for row in board
    {
        if !isArrValid(row)
        {
            return false
        }
    }
    return true
}
	
// 判断每一列是否合理
func isColValid(board: [[Character]]) -> Bool
{
    for i in 0..<board.count
    {
        var arr = [Character]()
        for j in 0..<board[i].count
        {
            arr.append(board[j][i])
            if !isArrValid(arr)
            {
                return false
            }
        }
    }
    return true
}
	
// 判断每一宫是否合理
func isMatrixValid(board: [[Character]]) -> Bool
{
    for i in 0...2
    {
        for j in 0...2
        {
            var arr = [Character]()
            for x in (1 + 3 * i)...(3 + 3 * i)
            {
                for y in (1 + 3 * j)...(3 + 3 * j)
                {
                    arr.append(board[x - 1][y - 1])
                    if !isArrValid(arr)
                    {
                        return false
                    }
                }
            }
        }
    }
    return true
}
	
// 判断数独棋盘是否合理
func isValidSudoku(board: [[Character]]) -> Bool
{
    return isRowValid(board) && isColValid(board) && isMatrixValid(board)
}
```