---
title: LeetCode-6. ZigZag Conversion  
date: 2016-08-02 19:06:42  
categories: Algorithm  
tags: LeetCode  
---

## 6. ZigZag Conversion  

The string `"PAYPALISHIRING"` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

```
P   A   H   N
A P L S I I G
Y   I   R
```

And then read line by line: `"PAHNAPLSIIGYIR"`  
Write the code that will take a string and make this conversion given a number of rows:

```javascript
string convert(string text, int nRows);
```

`convert("PAYPALISHIRING", 3)` should return `"PAHNAPLSIIGYIR"`.

## Translation

字符串 `"PAYPALISHIRING"` 写成给定行数的锯齿形状是这样的：(为了更好的可读性，您可能会使用一个固定宽度的字体)

```
P   A   H   N
A P L S I I G
Y   I   R
```

然后按行读作: `"PAHNAPLSIIGYIR"`  
编写的函数将接受一个字符串，和转换的行数作为参数:

```javascript
string convert(string text, int nRows);
```

`convert("PAYPALISHIRING", 3)` 应当返回 `"PAHNAPLSIIGYIR"`.

## The idea of solving process

为了处理的方便，首先将输入的字符串 `s` 转换为字符数组：

```javascript
let charArr:[Character] = s.characters.filter { (char: Character) -> Bool in
	return true
}
```

然后使用一个字符数组 `matrix` 来存储生成的锯齿形状的字符串。 `matrix` 的每一个元素存储一行字符。 `matrix` 的初始化如下所示：

```javascript
var matrix = [String]()
for _ in 0..<numRows
{
	matrix.append("")
}
```

按照生成锯齿形的规则，不断的去填充数组 `matrix` 即可。

```javascript
var index = 0
var i:Int
while index < len
{
	// 向下填充
	i = 0
	while i < numRows && index < len
	{
		matrix[i].append(charArr[index])
		index += 1
		i += 1
	}
    // 向上填充
	i = numRows - 2
	while i > 0 && index < len
	{
		matrix[i].append(charArr[index])
		index += 1
		i -= 1
	}
}
```

对于生成的 `matrix` 数组，只需要将每一行的字符串连接起来即可。

```javascript
var ans = ""
for i in 0..<matrix.count
{
	ans += String(matrix[i])
}
```

完整代码如下所示：

## AC Code

```javascript
func convert(s: String, _ numRows: Int) -> String
{
	// 排除一些特殊情况
    let len = s.characters.count
    if numRows >= len || numRows == 1 || len < 3
    {
        return s
    }
    
    // 初始化结果数组
    var matrix = [String]()
    for _ in 0..<numRows
    {
        matrix.append("")
    }
    
    // 将字符串转换为字符数组
    let charArr:[Character] = s.characters.filter { (char: Character) -> Bool in
        return true
    }
    
    var index = 0
    var i:Int
    while index < len
    {
    	// 向下填充
        i = 0
        while i < numRows && index < len
        {
            matrix[i].append(charArr[index])
            index += 1
            i += 1
        }
		// 向上填充
        i = numRows - 2
        while i > 0 && index < len
        {
            matrix[i].append(charArr[index])
            index += 1
            i -= 1
        }
    }
    // 连接结果数组每一行的字符串
    var ans = ""
    for i in 0..<matrix.count
    {
        ans += String(matrix[i])
    }
    return ans
}
```