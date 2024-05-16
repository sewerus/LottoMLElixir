# LottoPhoenix

This is an application about lotto and pure evolutionary machine learning in Elixir.

What's NOT a goal to achieve by this evolutionary algorithm?
* finding a model to predict results of the next lotto draw

So what IS a goal of it?
* good fun with Elixir and machine learning
* finding a model that will statistically predict as many numbers as possible for a series of many draws

# Setup

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

# Running in terminal

Firstly, start your phoenix console:
```
iex -S mix phx.server
```

Then you can start running calculations with passing number of generations:
```
Scripts.LottoTerminal.run(50)
```

In your console, you will see results similar to below:

```
Generation 2 / 3

Score: 2706.0

Present weights:
#Matrex[30×49]
┌                                                 ┐
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄ ▄▄│
│▄▄▄▄▄▄▄▄ ▄▄ ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄│
│▄ ▄▄ ▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄ │
│▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄ ▄  ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄ ▄▄▄▄▄▄▄▄▄▄│
│ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
└                                                 ┘
Absent weights:
#Matrex[30×49]
┌                                                 ┐
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄ ▄▄ ▄▄▄▄  ▄▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄ ▄ ▄▄ ▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄ │
│▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄ ▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄│
│▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
│▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ │
│ ▄▄▄ ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄ │
│▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄ ▄▄ ▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄│
└                                                 ┘
```

# Phoenix application

It's in progress, honey...
In plans:
* implementing a form, where you can pass optional arguments (like number of generations, size of testing set, etc.)
* running and pausing calculations and saving results
* rendering results with LiveView
* expanding this algorithm to predict number for both "Duży Lotto" and "Lotto Plus" at once

# More about developed ML algorithm

Let's assume, that each number that can appear in a draw results has it's own pattern of probability that depends if it was in last few results or not.

So we're calculating a score for each number basing on `n` last draws.

For example, let's take `n=4` - we're analyzing last 4 draws.

Now, if we're going to calculate sum of weights from last `n=4` draws. We've got prepared weights:

`A = [a_1, a_2, a_3, a_4]` - a weight `a_i` is used if our number was present in `i-th` draw

`B = [b_1, b_2, b_3, b_4]` - a weight `b_i` is used if our number was absent in `i-th` draw

When it comes to results:

`r_ai` = 1 if was present, 0 if was absent

`r_bi` = 0 if was present, 1 if was absent

So in `i-th` draw the sum of weights can be calculated by: `a_i * r_ai + b_i * r_bi`.

In this way we can calculate a "score" for each number. Numbers with the greatest scores are the predicted ones.

So, for more complex example, now let's take `n=2` and 6 numbers in each draw. Our model would look like below:

```
A = 
┌                                                 ┐
│     1.0     2.0     3.0     4.0     5.0     6.0 │
│     7.0     8.0     9.0    10.0    11.0    12.0 │
└                                                 ┘

B = 
┌                                                 ┐
│    12.0    11.0    10.0     9.0     8.0     7.0 │
│     6.0     5.0     4.0     3.0     2.0     1.0 │
└                                                 ┘

```

In the first draw results are: 1, 2, 3. In the second draw results are: 2, 3, 4.
So, results can be represented by matrix:
```
  ┌                                                 ┐
  │     1.0     1.0     1.0     0.0     0.0     0.0 │
  │     0.0     1.0     1.0     1.0     0.0     0.0 │
  └                                                 ┘
```

Calculated scores are:
```
1: 1*1.0 + 0*12.0 + 0*7.0 + 1*6.0 = 7.0
2: 1*2.0 + 0*11.0 + 1*8.0 + 0*5.0 = 10.0
3: 1*3.0 + 0*10.0 + 1*9.0 + 0*4.0 = 12.0
4: 0*4.0 + 1*9.0 + 1*10.0 + 0*3.0 = 19.0
5: 0*5.0 + 1*8.0 + 0*11.0 + 1*2.0 = 10.0
6: 0*6.0 + 1*7.0 + 0*12.0 + 1*1.0 = 8.0
```

Predicted elements are: 4, 3, 2 or 4, 3, 5 -> in this case we're taking 4, 3, 2

In short, out model consists of 2 sets of weights:
* `A` called "present weights"
* `B` called "absent weights"

We're going to calculate `A` and `B` that will statistically predict as many numbers as possible for a series of many draws.
