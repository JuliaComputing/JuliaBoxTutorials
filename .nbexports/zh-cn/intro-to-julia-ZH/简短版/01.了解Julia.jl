
# ------------------------------------------------------------------------------------------
# # 了解 Julia
#
#
# 这个 notebook 用于速成 Julia 语法，让你了解 Julia 是多么轻量级、多么好用
# ——就像你最喜欢的其他高级语言一样！
#
# 将涉及：
# - 字符串（Strings）
# - 数据结构（Data structures）
# - 循环（Loops）
# - 条件判断（Conditionals）
# - 函数（Functions）
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ## 字符串
# ------------------------------------------------------------------------------------------

string1 = "How many cats "

string2 = "is too many cats?"

string(string1, string2)

😺 = 10
println("I don't know but $😺 are too few!")

# ------------------------------------------------------------------------------------------
# 注意：Julia 允许用 Unicode 字符，例如😺
#
# 这就让我们可以把代码写成这个样子
# ------------------------------------------------------------------------------------------

😺 = 1
😀 = 0
😞 = -1

😺 + 😞 == 😀

# ------------------------------------------------------------------------------------------
# ## 数据结构
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ### 元组（Tuples）
#
# 要创建创建一个元组，就用小括号依次 `( )` 括起一系列元素
#
#
# 语法：
# ```julia
# (item1, item2, ...)
# ```
# ------------------------------------------------------------------------------------------

myfavoriteanimals = ("penguins", "cats", "sugargliders")

myfavoriteanimals[1]

# ------------------------------------------------------------------------------------------
# ###  字典（Dictionaries）
#
# 想存键值对，用字典。通过 `Dict()` 构造器来创建字典。
#
# 语法：
# ```julia
# Dict(key1 => value1, key2 => value2, ...)
# ```
#
# 比如电话簿需要保存人名和电话号码的成对关系
# ------------------------------------------------------------------------------------------

myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

myphonebook["Jenny"]

# ------------------------------------------------------------------------------------------
# ### 数组（Arrays）
#
# 不同于元组，数组可变；不同于字典，数组有序。
# 要创建创建一个数组，用方括号依次 `[ ]` 括起一系列元素。
#
# 语法：
# ```julia
# [item1, item2, ...]
# ```
#
# 例如：
# ------------------------------------------------------------------------------------------

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

fibonacci = [1, 1, 2, 3, 5, 8, 13]

mixture = [1, 1, 2, 3, "Ted", "Robyn"]

# ------------------------------------------------------------------------------------------
# 数组可以包含其他数据结构，也可以包含其他数组变成高维数组。
# ------------------------------------------------------------------------------------------

numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

rand(4, 3)

# ------------------------------------------------------------------------------------------
# ## 循环
#
# ### `for` 循环
#
# `for`循环语法：
# ```julia
# for <var> in <loop iterable>
#     <loop body>
# end
# ```
# ------------------------------------------------------------------------------------------

for n in 1:10
    println(n)
end

# ------------------------------------------------------------------------------------------
# ### `while` 循环
#
# `while`循环语法：
# ```julia
# while <condition>
#     <loop body>
# end
# ```
# ------------------------------------------------------------------------------------------

n = 0
while n < 10
    n += 1
    println(n)
end

# ------------------------------------------------------------------------------------------
# ## 条件判断
#
# ### `if` 分支
#
# Julia 中 if 语法为：
#
# ```julia
# if <condition 1>
#     <option 1>
# elseif <condition 2>
#     <option 2>
# else
#     <option 3>
# end
# ```
#
# 这让我们可以按条件执行不同的语句
# ------------------------------------------------------------------------------------------

x, y = 1, 2
if x > y
    x
else
    y
end

# ------------------------------------------------------------------------------------------
# ### 三元运算符
#
# 我们可以用三元运算符语法重写上一个代码块
#
# ```julia
# a ? b : c
# ```
#
# 它等价于
#
# ```julia
# if a
#     b
# else
#     c
# end
# ```
# ------------------------------------------------------------------------------------------

(x > y) ? x : y

# ------------------------------------------------------------------------------------------
# ## 函数
#
# 将要谈论的主题：
# 1. 如何声明一个函数
# 2. Julia 中的鸭子类型（Duck-typing）
# 3. 原地修改与非原地修改函数（Mutating vs. non-mutating functions）
# 4. 高阶函数
#
# ### 如何声明一个函数
#
# #### 方法一：用 `function` 和 `end` 关键字
# ------------------------------------------------------------------------------------------

function f(x)
    x^2
end

# ------------------------------------------------------------------------------------------
# #### 方法二：用 `=`
# ------------------------------------------------------------------------------------------

f2(x) = x^2

# ------------------------------------------------------------------------------------------
# #### 方法三：匿名函数
# ------------------------------------------------------------------------------------------

f3 = x -> x^2

# ------------------------------------------------------------------------------------------
# ### 调用函数
# ------------------------------------------------------------------------------------------

f(42)

f2(42)

f3(42)

# ------------------------------------------------------------------------------------------
# ### Julia 中的鸭子类型（Duck-typing）
# > *“假如它嘎嘎像个鸭鸭，那它就是个鸭鸭”*
#
# 在未指定函数参数的类型时，不管输入参数是什么类型，只要函数体可以正常执行，
# 那么 Julia 函数就可以应用在这种类型的参数上
# 比如上面的 `f` 函数可以接受一个矩阵（matrix）作为参数
# ------------------------------------------------------------------------------------------

A = rand(3, 3)

f(A)

# ------------------------------------------------------------------------------------------
# 然而，`f` 函数无法接受一个向量（vector）。
# 不同于 `A^2` 是已经定义好的矩阵乘方，当 `v` 是向量时的 `v^2` 是有歧义的。
# ------------------------------------------------------------------------------------------

v = rand(3)

f(v)

# ------------------------------------------------------------------------------------------
# ### 原地修改与非原地修改函数（Mutating vs. non-mutating functions）
#
# 约定：函数名以 `!` 结束的原地修改传入的变量，函数名非以 `!` 结束的则不会改变传入的变量。
#
# 例如下面的 `sort` 和 `sort!`
# ------------------------------------------------------------------------------------------

v = [3, 5, 2]

sort(v)

v

# ------------------------------------------------------------------------------------------
# `sort(v)`会返回一个新的、将 `v` 排序后的数组，`v` 本身不会改变
#
# 而当执行 `sort!(v)` 后，`v` 将会被原地排序修改
# ------------------------------------------------------------------------------------------

sort!(v)

v

# ------------------------------------------------------------------------------------------
# ### 一些高阶函数
#
# #### `map`
#
# `map` 是 Julia 中的高阶函数。“高阶”指的是它会*接受一个函数*作为它的传入参数。
# `map` 将传入的函数作用于传入的数据结构的每一个元素。例如执行
#
# ```julia
# map(f, [1, 2, 3])
# ```
# 将得到一个输出数组，数组的每一个元素为 `f` 作用在数组 `[1, 2, 3]` 的对应元素
# ```julia
# [f(1), f(2), f(3)]
# ```
# ------------------------------------------------------------------------------------------

map(f, [1, 2, 3])

# ------------------------------------------------------------------------------------------
# 这里我们把向量 `[1, 2, 3]` 的每一个元素都平方了，而不是对向量 `[1, 2, 3]` 本身进行平方。
#
# `map` 可以接受匿名函数作为参数，像这样
# ------------------------------------------------------------------------------------------

map(x -> x^3, [1, 2, 3])

# ------------------------------------------------------------------------------------------
# 这就完成了对数组 `[1, 2, 3]` 所有元素立方的计算！
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# ### 广播（broadcast）
#
# 广播（`broadcast`）和 `map` 一样也是高阶函数。
# 广播是一种广义化的 `map`，所以 `map` 能做的它都能做。并不止如此，广播的调用方法和 `map` 一样。
# ------------------------------------------------------------------------------------------

broadcast(f, [1, 2, 3])

# ------------------------------------------------------------------------------------------
# 我们又一次通过函数 `f` 把向量 `[1, 2, 3]` 的每一个元素都平方了
# ——这次是用“广播”函数 `f` 的方式！
#
# 广播（`broadcast`）有个语法糖：调用要广播的函数时，在函数名和输入变量之间加一个 `.`。
#
# 比如：
# ```julia
# broadcast(f, [1, 2, 3])
# ```
# 就等价于
# ```julia
# f.([1, 2, 3])
# ```
# ------------------------------------------------------------------------------------------

f.([1, 2, 3])

# ------------------------------------------------------------------------------------------
# 再一次强调 `map` 和广播方式与如下直接调用函数的区别。
#
# ```julia
# f([1, 2, 3])
# ```
# 我们可以求向量中每个元素的平方，但是不能求向量的平方！
# ------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------
# 为了再讲清楚这一点，我们再看一下以下调用的区别
#
# ```julia
# f(A)
# ```
# 与
# ```julia
# f.(A)
# ```
# 其中 `A` 是个矩阵：
# ------------------------------------------------------------------------------------------

A = [i + 3*j for j in 0:2, i in 1:3]

f(A)

# ------------------------------------------------------------------------------------------
# 和之前一样，对于矩阵 `A` 来说
# ```
# f(A) = A^2 = A * A
# ```
#
# 另一方面，
# ------------------------------------------------------------------------------------------

B = f.(A)

# ------------------------------------------------------------------------------------------
# 结果包含了矩阵 `A` 中每个元素的平方
#
# 广播的点语法让比较复杂的元素间运算的表示更自然、更贴近数学表示。
#
# 例如：
# ------------------------------------------------------------------------------------------

C = A .+ 2 .* f.(A) ./ A

# ------------------------------------------------------------------------------------------
# 而不是
# ------------------------------------------------------------------------------------------

broadcast(x -> x + 2 * f(x) / x, A)

# ------------------------------------------------------------------------------------------
# 并且这么写仍然能获得和 C 语言一样高效的代码！
# ------------------------------------------------------------------------------------------
