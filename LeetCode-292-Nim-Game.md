---
title: LeetCode-292-Nim-Game  
date: 2016-07-28 16:02:58  
categories: Algorithm  
tags: LeetCode  
---

### LeetCode-292-Nim-Game

You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner. You will take the first turn to remove the stones.

Both of you are very clever and have optimal strategies for the game. Write a function to determine whether you can win the game given the number of stones in the heap.

For example, if there are 4 stones in the heap, then you will never win the game: no matter 1, 2, or 3 stones you remove, the last stone will always be removed by your friend.

**Hint:**

If there are 5 stones in the heap, could you figure out a way to remove the stones such that you will always be the winner?

### 题目翻译

你和你的朋友正在玩下面的Nim游戏: 桌子上放着一堆小石头, 每次你们轮流拿走1到3块小石头。拿走最后一块小石头的人将会成为赢家。你第一个拿小石头。

你和你的朋友都非常聪明并且想出了最优策略来玩这个游戏。你的任务是写一个函数，来判断对于给定数量的小石头，你是否能赢得这场比赛。

例如，如果有四堆石头,那么你永远不会赢得比赛：无论你拿走1、2、或3块小石头，最后一块小石头总会被你的朋友拿走。

**提示**
如果在石头堆中有5块小石头，你是否能够想出一个拿石头的方法来保证你将永远是赢家?

### 解题思路

记得在大学上组合数学的时候，第一节课讲的就是这个题目（PS: 组合数学还是蛮有意思的）。

其实稍稍想一下，答案就会出来了。

如果石头<4块，你直接全部拿走，你赢。
如果有4块石头，无论你拿1，2，3块，最后的一块都会被你的朋友拿去。你输。
如果有5块石头，你第一次只拿1块，将4块给你朋友选择。最终你会赢。
如果有6块石头，你第一次只拿2块，将4块给你朋友选择。最终你会赢。
如果有7块石头，你第一次只拿3块，将4块给你朋友选择。最终你会赢。
如果有8块石头，无论你第一次拿1，2，3块，你朋友接着拿的数量跟你拿的数量凑成4块，那么又是4块小石头摆在你的面前。你输。

如果石头数量为（4n + 1），你第一次拿1块，将剩下的4n块给你朋友选择，你每次拿的数量和你朋友拿的数量凑成4即可。你赢。
如果石头数量为（4n + 2），你第一次拿2块，将剩下的4n块给你朋友选择，你每次拿的数量和你朋友拿的数量凑成4即可。你赢。
如果石头数量为（4n + 3），你第一次拿3块，将剩下的4n块给你朋友选择，你每次拿的数量和你朋友拿的数量凑成4即可。你赢。
如果石头数量为（4n），无论你第一次拿1，2，3块，你朋友每次拿的数量和你拿的数量凑成4即可。你输。

所以如果小石头的数量为4的倍数，你输；否则你赢。
代码异常的简单。

### AC Code  

```javascript
func canWinNim(n: Int) -> Bool
{
    if n % 4 == 0
    {
        return false
    }
    return true
}
```