# 1 链表

## 1.1 例1-链表逆序 ([206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/description/))

Reverse a singly linked list.

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        if (head == null) return null;
        ListNode asc = null;
        while (head != null) {
            ListNode temp = head;
            head = head.next;
            temp.next = asc;
            asc = temp;
        }
        return asc;
    }
}
```

## 1.2 例2-链表中间段逆序([92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/description/))


Reverse a linked list from position m to n. Do it in-place and in one-pass.

For example:
Given **1->2->3->4->5->NULL**, m = 2 and n = 4,

return **1->4->3->2->5->NULL**.

**Note:**

Given m, n satisfy the following condition:

1 ≤ m ≤ n ≤ length of list.

```java
class Solution {
     public ListNode reverseBetween(ListNode head, int m, int n) {
        if (head == null || head.next == null || m == n || m < 1 || n < 1) {
            return head;
        }
        ListNode root = new ListNode(0);
        root.next = head;
        ListNode start = root;
        while (m > 1 && head != null) {
            m--;
            n--;
            start = head;
            head = head.next;
        }
        ListNode asc = null;
        ListNode end = head;
        while (head != null && n >= 1) {
            n--;
            ListNode temp = head;
            head = head.next;
            temp.next = asc;
            asc = temp;
        }
        end.next = head;
        start.next = asc;
        return root.next;
    }
}
```

## 1.3 例3-求两个链表的交点([160. Intersection of Two Linked Lists](https://leetcode.com/problems/intersection-of-two-linked-lists/description/))

Write a program to find the node at which the intersection of two singly linked lists begins.

For example, the following two linked lists:

```
A:          a1 → a2
                   ↘
                     c1 → c2 → c3
                   ↗            
B:     b1 → b2 → b3
```

begin to intersect at node c1.

**Notes:**

* If the two linked lists have no intersection at all, return null.
* The linked lists must retain their original structure after the function returns.
* You may assume there are no cycles anywhere in the entire linked structure.
* Your code should preferably run in O(n) time and use only O(1) memory.

```java
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        int headALength = this.getLength(headA);
        int headBLength = this.getLength(headB);
        while (headALength > headBLength) {
            headA = headA.next;
            headALength--;
        }
        while (headALength < headBLength) {
            headB = headB.next;
            headBLength--;
        }
        while (headA != null) {
            if (headA.equals(headB)) return headA;
            headA = headA.next;
            headB = headB.next;
        }
        return null;
    }

    int getLength(ListNode node) {
        int length = 0;
        while (node != null)  {
            node = node.next;
            length++;
        }
        return length;
    }
}
```

## 1.4 例4-两个排序链表的合并([21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/description/))

Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

**Example:**

```
Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
```

```java
class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        ListNode listNode = new ListNode(0);
        ListNode temp = listNode;
        while (l1 != null && l2 != null) {
            if (l1.val < l2.val) {
                temp.next = l1;
                temp = l1;
                l1 = l1.next;
            } else {
                temp.next = l2;
                temp = l2;
                l2 = l2.next;
            }
        }
        if (l1 != null) temp.next = l1;
        else temp.next = l2;
        return listNode.next;
    }
}
```

## 1.5 例5-链表求环([142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/description/))

Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

**Note: **Do not modify the linked list.

**Follow up:**

Can you solve it without using extra space?

```java
class Solution {
    public ListNode detectCycle(ListNode head) {
        if (head == null || head.next == null) {
            return null;
        }
        // 快指针fp和慢指针sp，
        ListNode fp = head, sp = head;
        while (fp != null && fp.next != null) {
            sp = sp.next;
            fp = fp.next.next;
            if (fp == sp) {
                break;
            }
        }
        if (fp == null || fp.next == null) {
            return null;
        }
        sp = head;
        while (fp != sp) {
            sp = sp.next;
            fp = fp.next;
        }
        return sp;
    }
}
```

## 1.6 例6-链表划分([86. Partition List](https://leetcode.com/problems/partition-list/description/))

Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.

For example,

Given 1->4->3->2->5->2 and x = 3,

return 1->2->2->4->3->5.

```java
class Solution {
    public ListNode partition(ListNode head, int x) {
        if (head == null) return null;
        ListNode root = new ListNode(0);
        ListNode root1 = new ListNode(0);
        ListNode asc = root;
        ListNode asc1 = root1;
        while (head != null) {
            if (head.val < x) {
                asc.next = head;
                asc = asc.next;
            } else {
                asc1.next = head;
                asc1 = asc1.next;
            }
            head = head.next;
        }
        asc.next = root1.next;
        asc1.next = null;
        return root.next;
    }
}
```

## 1.7 例7-复杂链表的深度拷贝([138. Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer/description/))

A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.

```java
/**
 * Definition for singly-linked list with a random pointer.
 * class RandomListNode {
 *     int label;
 *     RandomListNode next, random;
 *     RandomListNode(int x) { this.label = x; }
 * };
 */
class Solution {

    private Map<RandomListNode, RandomListNode> cache = new HashMap<>();

    public RandomListNode copyRandomList(RandomListNode head) {
        if (head == null) return null;
        RandomListNode copy = this.cache.get(head);
        if (copy == null) {
            copy = new RandomListNode(head.label);
            this.cache.put(head, copy);
            copy.next = this.copyRandomList(head.next);
            copy.random = this.copyRandomList(head.random);
        }
        return copy;
    }
}
```
 
# 2 栈、队列与堆（6）

## 2.1 例1-使用队列实现栈 ([225. Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues/description/))

Implement the following operations of a stack using queues.

* push(x) -- Push element x onto stack.
* pop() -- Removes the element on top of the stack.
* top() -- Get the top element.
* empty() -- Return whether the stack is empty.
 
**Notes:**

* You must use only standard operations of a queue -- which means only push to back, peek/pop from front, size, and is empty operations are valid.
* Depending on your language, queue may not be supported natively. You may simulate a queue by using a list or deque (double-ended queue), as long as you use only standard operations of a queue.
* You may assume that all operations are valid (for example, no pop or top operations will be called on an empty stack).

```java
class MyStack {

    /** Initialize your data structure here. */
    Queue<Integer> queue = new LinkedList<>();


    /** Push element x onto stack. */
    public void push(int x) {
        int size = queue.size();
        queue.offer(x);
        while (size-- > 0) {
            queue.offer(queue.poll());
        }

    }

    /** Removes the element on top of the stack and returns that element. */
    public int pop() {
        return queue.poll();
    }

    /** Get the top element. */
    public int top() {
        return queue.peek();
    }

    /** Returns whether the stack is empty. */
    public boolean empty() {
        return queue.isEmpty();
    }
}
```

## 2.2 例2-使用栈实现队列 ([232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/description/))

Implement the following operations of a queue using stacks.

* push(x) -- Push element x to the back of queue.
* pop() -- Removes the element from in front of queue.
* peek() -- Get the front element.
* empty() -- Return whether the queue is empty.

**Notes:**

* You must use only standard operations of a stack -- which means only push to top, peek/pop from top, size, and is empty operations are valid.
* Depending on your language, stack may not be supported natively. You may simulate a stack by using a list or deque (double-ended queue), as long as you use only standard operations of a stack.
* You may assume that all operations are valid (for example, no pop or peek operations will be called on an empty queue).

```java
class MyQueue {

    Stack<Integer> input = new Stack();
    Stack<Integer> output = new Stack();

    public void push(int x) {
        input.push(x);
    }

    public int pop() {
        peek();
        return output.pop();
    }

    public int peek() {
        if (output.empty())
            while (!input.empty())
                output.push(input.pop());
        return output.peek();
    }

    public boolean empty() {
        return input.empty() && output.empty();
    }
}
```

## 2.3 例3-包含min函数的栈 ([155. Min Stack])(https://leetcode.com/problems/min-stack/description/)

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

* push(x) -- Push element x onto stack.
* pop() -- Removes the element on top of the stack.
* top() -- Get the top element.
* getMin() -- Retrieve the minimum element in the stack.

**Example:**

```
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```
	  
```java
class MinStack {

    private Stack<Integer> root = new Stack<>();
    private Stack<Integer> min = new Stack<>();

    public void push(int x) {
        this.root.push(x);
        if (this.min.empty() || this.min.peek() >= x) this.min.push(x);
    }

    public void pop() {
        int pop = this.root.pop();
        if (this.min.peek() == pop) this.min.pop();
    }

    public int top() {
        return this.root.peek();
    }

    public int getMin() {
        return this.min.peek();
    }
}
```

## 2.4 例4-合法的出栈序列(POJ1363)

输入两个整数序列，第一个序列表示找的压入顺序，请判断第二个序列是否为该栈的弹出顺序。

假设压入栈的所有数字均不想等。

例如压入顺序是 [1,2,3,4,5]，其弹出序列可以是 [4,5,3,2,1]，不能是[4, 3, 5, 1, 2]。

```java
class Solution {
    
    public boolean isPopOrder(List<Integer> pushArray, List<Integer> popArray) {
        if (pushArray == null || popArray == null || pushArray.size() != popArray.size()) return false;
        Stack<Integer> pushStack = new Stack();
        for (int item : pushArray) {
            if (item == popArray.indexOf(0)) {
                popArray.remove(0);
                while (pushStack.peek() == popArray.indexOf(0)) {
                    pushStack.pop();
                    popArray.remove(0);
                }
            } else {
                pushStack.add(item);
            }
        }
        return pushStack.empty() && popArray.isEmpty();
    }
    
}
```

## 2.5 例5-数组中的第K大的数 ([215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/description/))

Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
For example,

Given [3,2,1,5,6,4] and k = 2, return 5.

**Note:** 

You may assume k is always valid, 1 ≤ k ≤ array's length.

```Java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        Arrays.sort(nums);
        return nums[nums.length - k];
    }
}
```

## 2.6 例6-寻找中位数 ([295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/description/))

Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

Examples: 

[2,3,4] , the median is 3

[2,3], the median is (2 + 3) / 2 = 2.5

Design a data structure that supports the following two operations:

* void addNum(int num) - Add a integer number from the data stream to the data structure.
* double findMedian() - Return the median of all elements so far.

For example:

```
addNum(1)
addNum(2)
findMedian() -> 1.5
addNum(3) 
findMedian() -> 2
```

```Java
class MedianFinder {

    private Queue<Integer> maxQueue;
    private Queue<Integer> minQueue;

    public MedianFinder() {
        maxQueue = new PriorityQueue<>((o1, o2) -> o2 - o1);
        minQueue = new PriorityQueue<>((o1, o2) -> o1 - o2);
    }

    public void addNum(int num) {
        if (maxQueue.size() < 1 || num <= maxQueue.peek()) {
            maxQueue.add(num);
        } else {
            minQueue.add(num);
        }
        if (maxQueue.size() + 2 == minQueue.size()) {
            maxQueue.add(minQueue.poll());
        } else if (minQueue.size() + 2 == maxQueue.size()) {
            minQueue.add(maxQueue.poll());
        }
    }

    public double findMedian() {
        if (maxQueue.size() == minQueue.size()) {
            return (maxQueue.peek() + minQueue.peek()) / 2.0;
        } else if (maxQueue.size() > minQueue.size()) {
            return maxQueue.peek();
        } else {
            return minQueue.peek();
        }
    }
}
```
 
# 3 贪心（6）

## 3.1 例1-分糖果 ([455. Assign Cookies](https://leetcode.com/problems/assign-cookies/description/))

Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with; and each cookie j has a size sj. If sj >= gi, we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.

**Note:**

You may assume the greed factor is always positive. 

You cannot assign more than one cookie to one child.

**Example 1:**

```
Input: [1,2,3], [1,1]

Output: 1

Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3. 
And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
You need to output 1.
```

**Example 2:**

```
Input: [1,2], [1,2,3]

Output: 2

Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2. 
You have 3 cookies and their sizes are big enough to gratify all of the children, 
You need to output 2.
```
	
```Java
class Solution {
    public int findContentChildren(int[] g, int[] s) {
        if (g == null || s == null) return 0;
        Arrays.sort(g);
        Arrays.sort(s);
        int i = 0, j = 0;
        int count = 0;
        while (i < g.length && j < s.length) {
            if (g[i] <= s[j]) {
                i++;
                count++;
            }
            j++;         
        }
        return count;
    }
}
```

## 3.2 例2-摇摆序列 ([376. Wiggle Subsequence](https://leetcode.com/problems/wiggle-subsequence/description/))

A sequence of numbers is called a wiggle sequence if the differences between successive numbers strictly alternate between positive and negative. The first difference (if one exists) may be either positive or negative. A sequence with fewer than two elements is trivially a wiggle sequence.

For example, [1,7,4,9,2,5] is a wiggle sequence because the differences (6,-3,5,-7,3) are alternately positive and negative. In contrast, [1,4,7,2,5] and [1,7,4,5,5] are not wiggle sequences, the first because its first two differences are positive and the second because its last difference is zero.

Given a sequence of integers, return the length of the longest subsequence that is a wiggle sequence. A subsequence is obtained by deleting some number of elements (eventually, also zero) from the original sequence, leaving the remaining elements in their original order.

**Examples:**

```
Input: [1,7,4,9,2,5]
Output: 6
The entire sequence is a wiggle sequence.

Input: [1,17,5,10,13,15,10,5,16,8]
Output: 7
There are several subsequences that achieve this length. One is [1,17,10,13,10,16,8].

Input: [1,2,3,4,5,6,7,8,9]
Output: 2
```

**Follow up:**

Can you do it in O(n) time?

```Java
class Solution {
    public int wiggleMaxLength(int[] nums) {
        if (nums.length < 2)
            return nums.length;
        int down = 1, up = 1;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] > nums[i - 1])
                up = down + 1;
            else if (nums[i] < nums[i - 1])
                down = up + 1;
        }
        return Math.max(down, up);
    }
}
```

## 3.3 例3-移除K个数字 ([402. Remove K Digits](https://leetcode.com/problems/remove-k-digits/description/))

Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

**Note:**

* The length of num is less than 10002 and will be ≥ k.
* The given num does not contain any leading zero.

**Example 1:**

```
Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
```

**Example 2:**

```
Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
```

**Example 3:**

```
Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.
```

```Java
class Solution {
    public String removeKdigits(String num, int k) {
        if (num == null || num.length() <= k) return "0";
        char[] res = new char[num.length()];
        int last = 0;
        for (char ch : num.toCharArray()) {
            while (k > 0 && last > 0 && res[last - 1] > ch) {
                --last;
                --k;
            }
            res[last++] = ch;
        }
        last -= k;
        int offset = 0;
        while (offset < last && res[offset] == '0') offset++;
        return offset == last ? "0" : new String(res, offset, last - offset);
    }
}
```

## 3.4 例4-跳跃游戏1 ([55. Jump Game](https://leetcode.com/problems/jump-game/description/))

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:

A = [2,3,1,1,4], return true.

A = [3,2,1,0,4], return false.

```Java
public class Solution {
    public boolean canJump(int[] nums) {
        int lastPos = nums.length - 1;
        for (int i = nums.length - 2; i >= 0; i--) {
            if (i + nums[i] >= lastPos) {
                lastPos = i;
            }
        }
        return lastPos == 0;
    }
}
```

## 3.5 例5-跳跃游戏2 ([45. Jump Game II](https://leetcode.com/problems/jump-game-ii/description/))

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Your goal is to reach the last index in the minimum number of jumps.

**For example:**

Given array A = [2,3,1,1,4]

The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)

**Note:**

You can assume that you can always reach the last index.

```Java
class Solution {
    public int jump(int[] nums) {
        if (nums == null || nums.length <= 1) return 0;
        int curMax = nums[0];
        int nextMax = curMax;
        int curStep = 1;
        for (int i = 1; i < nums.length; i++) {
            if (i > curMax) {
                curMax = nextMax;
                curStep++;
            }
            nextMax = Math.max(nextMax, i + nums[i]);
        }
        return curStep;
    }
}
```

## 3.6 例6-射击气球 ([452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/)) 

There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.

An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.

**Example:**

```
Input:
[[10,16], [2,8], [1,6], [7,12]]

Output:
2

Explanation:
One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).
```
	
```Java
class Solution {
    public int findMinArrowShots(int[][] points) {
        if (points.length == 0) {
            return 0;
        }
        Arrays.sort(points, (a, b) -> a[1] - b[1]);
        int arrowPos = points[0][1];
        int arrowCnt = 1;
        for (int i = 1; i < points.length; i++) {
            if (arrowPos >= points[i][0]) {
                continue;
            }
            arrowCnt++;
            arrowPos = points[i][1];
        }
        return arrowCnt;
    }
}
```
 
# 4 递归与回溯搜索

## 4.1 例1-求子集 ([78. Subsets](https://leetcode.com/problems/subsets/description/))

Given a set of distinct integers, nums, return all possible subsets (the power set).

**Note:** The solution set must not contain duplicate subsets.

For example,

If nums = [1,2,3], a solution is:

```
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
```

```Java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> list = new ArrayList<>();
        Arrays.sort(nums);
        backtrack(list, new ArrayList<>(), nums, 0);
        return list;
    }

    void backtrack(List<List<Integer>> list, List<Integer> tempList, int[] nums, int start) {
        list.add(new ArrayList<>(tempList));
        for (int i = start; i < nums.length; i++) {
            tempList.add(nums[i]);
            backtrack(list, tempList, nums, i + 1);
            tempList.remove(tempList.size() - 1);
        }
    }
}
```

## 4.2 例2-求子集2 ([90. Subsets II](https://leetcode.com/problems/subsets-ii/description/))

Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

**Note:** The solution set must not contain duplicate subsets.

For example,
If nums = [1,2,2], a solution is:

```
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]
```

```Java
class Solution {
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();
        Arrays.sort(nums);
        this.backtrack(result, new ArrayList<Integer>(), nums, 0);
        return result;
    }

    void backtrack(List<List<Integer>> list, ArrayList<Integer> tempList, int[] nums, int start) {
        list.add(new ArrayList<Integer>(tempList));
        for (int i = start; i < nums.length; i++) {
            if (i > 0 && i != start && nums[i] == nums[i - 1]) {
                continue;
            }
            tempList.add(nums[i]);
            this.backtrack(list, tempList, nums, i + 1);
            tempList.remove(tempList.size() - 1);
        }
    }
}
```

## 4.3 例3-组合数之和([40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/description/))

Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

Each number in C may only be used once in the combination.

**Note:**

* All numbers (including target) will be positive integers.
* The solution set must not contain duplicate combinations.

For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8, 

A solution set is: 

```
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]
```
	
```Java
class Solution {
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        List<List<Integer>> result = new ArrayList<>();
        Arrays.sort(candidates);
        this.backtrack(result, new ArrayList<Integer>(), candidates, target, 0);
        return result;
    }

    void backtrack(List<List<Integer>> list, ArrayList<Integer> tempList, int[] candidates, int target, int start) {
        if (target < 0) return;
        if (target == 0) {
            list.add(new ArrayList<Integer>(tempList));
            return;
        }
        for (int i = start; i < candidates.length; i++) {
            if (i > 0 && i != start && candidates[i] == candidates[i - 1]) {
                continue;
            }
            tempList.add(candidates[i]);
            target -= candidates[i];
            this.backtrack(list, tempList, candidates, target, i + 1);
            target += candidates[i];
            tempList.remove(tempList.size() - 1);
        }
    }
}
```

## 4.4 例4-生成括号([22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/description/))

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:

```
[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
```

```Java
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> ans = new ArrayList();
        if (n <= 0) {
            ans.add("");
        } else {
            for (int i = 0; i < n; i++) {
                for (String left : generateParenthesis(i)) {
                    for (String right : generateParenthesis(n - 1 - i)) {
                        ans.add(left + "(" + right + ")");
                    }
                }
            }
        }
        return ans;
    }
}
```

## 4.5 例5-N皇后 ([51. N-Queens](https://leetcode.com/problems/n-queens/description/))

The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

![](https://raw.githubusercontent.com/937447974/Blog/master/Resources/2018030101.png)

Given an integer n, return all distinct solutions to the n-queens puzzle.

Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

For example,There exist two distinct solutions to the 4-queens puzzle:

```
[
 [".Q..",  // Solution 1
  "...Q",
  "Q...",
  "..Q."],

 ["..Q.",  // Solution 2
  "Q...",
  "...Q",
  ".Q.."]
]
```
	
```Java
class Solution {
    public List<List<String>> solveNQueens(int n) {
        char[][] board = new char[n][n];
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                board[i][j] = '.';
        List<List<String>> asc = new ArrayList<List<String>>();
        this.dfs(asc, board, 0);
        return asc;
    }

    private void dfs(List<List<String>> asc, char[][] board, int i) {
        if (i == board.length) {
            asc.add(this.construct(board));
            return;
        }
        for (int j = 0; j < board.length; j++) {
            if (this.validate(board, i, j)) {
                board[i][j] = 'Q';
                dfs(asc, board, i + 1);
                board[i][j] = '.';
            }
        }
    }

    private boolean validate(char[][] board, int i, int j) {
        int i1 = i - 1, j1 = j - 1;
        while (i1 >= 0 && j1 >= 0) {
            if (board[i1][j1] == 'Q') return false;
            i1--;
            j1--;
        }
        int i2 = i - 1;
        while (i2 >= 0) {
            if (board[i2][j] == 'Q') return false;
            i2--;
        }
        int i3 = i - 1, j3 = j + 1;
        while (i3 >= 0 && j3 < board.length) {
            if (board[i3][j3] == 'Q') return false;
            i3--;
            j3++;
        }
        return true;
    }
    
    private List<String> construct(char[][] board) {
        List<String> res = new ArrayList<>();
        for (int i = 0; i < board.length; i++) {
            res.add(new String(board[i]));
        }
        return res;
    }

}
```

## 4.6 例6-火柴棍摆正方形 ([473. Matchsticks to Square](https://leetcode.com/problems/matchsticks-to-square/description/))

Remember the story of Little Match Girl? By now, you know exactly what matchsticks the little match girl has, please find out a way you can make one square by using up all those matchsticks. You should not break any stick, but you can link them up, and each matchstick must be used exactly one time.

Your input will be several matchsticks the girl has, represented with their stick length. Your output will either be true or false, to represent whether you could make one square using all the matchsticks the little match girl has.

**Example 1:**

```
Input: [1,1,2,2,2]
Output: true

Explanation: You can form a square with length 2, one side of the square came two sticks with length 1.
```

**Example 2:**

```
Input: [3,3,3,3,4]
Output: false

Explanation: You cannot find a way to form a square with all the matchsticks.
```

**Note:**

1. The length sum of the given matchsticks is in the range of 0 to 10^9.
2. The length of the given matchstick array will not exceed 15.

```Java
class Solution {
    public boolean makesquare(int[] nums) {
        if (nums == null || nums.length < 4) return false;
        int sum = 0;
        for (int i : nums) sum += i;
        if (sum % 4 != 0) return false;
        Arrays.sort(nums);
        int target = sum / 4;
        if (nums[nums.length - 1] > target) return false;
        return this.dfs(target, nums, 0, nums.length - 1) == 1;
    }

    int dfs(int target, int[] nums, int cur, int index) {
        if (index == -1) return 1;
        int result = 0;
        for (int i = index; i >= 0; i--) {
            int total = cur + nums[i];
            if (total <= target) {
                this.exchange(nums, i, index);
                if (total == target) {
                    result = this.dfs(target, nums, 0, index - 1);
                } else if (total < target) {
                    result = this.dfs(target, nums, total, index - 1);
                }
                this.exchange(nums, i, index);
                if (result == 1) return 1;
                else if (result == -1) return 0;
            }
        }
        return -1;
    }

    void exchange(int[] nums, int x, int y) {
        if (x == y) return;
        int temp = nums[x];
        nums[x] = nums[y];
        nums[y] = temp;
    }

}
```
# 5 二分查找与分制算法

## 5.1 例1-插入位置(LeetCode 35)
## 5.2 例2-区间查找(LeetCode 34)
## 5.3 例3-旋转数组查找(LeetCode 33)
## 5.4 例4-K个排序链表的合并(LeetCode 23)
## 5.5 例5-逆序数计算 (LeetCode 315)
## 5.6 例6-不同的括号方法 (LeetCode 241)
 
# 6 二叉树（6）

2.  例1-路径之和2 (LeetCode 113)
3.  例2-最近的公共祖先 (LeetCode 236)
4.  例3-二叉树转链表(LeetCode 114)
7.  例4-侧面观察二叉树 (LeetCode 199)
8.  例5-根据前序与中序遍历顺序构造二叉树(LeetCode 105)
9.  例6-根据后续与中序遍历顺序构造二叉树(LeetCode 106)
 
# 7 图与二叉查找树（5）

3.  例1-课程安排 (LeetCode 207e)
4.  例2-最小高度的树 (LeetCode 310)
6.  例3-二叉查找树中的第K小的数(LeetCode 230)
7.  例4-二叉查找树编码与解码(LeetCode 449)
8.  例5-逆序数 (LeetCode 315)
 
# 8 哈希表与字符串（6）

2.  例1-最长回文串(LeetCode 409)
3.  例2-词语模式 (LeetCode 290)
4.  例3-同字符词语分组 (LeetCode 49)
5.  例4-无重复字符的最长子串 (LeetCode 3)
6.  例5-重复的DNA序列 (LeetCode 187)
7.  例6-最小窗口子串(LeetCode 76)
 
# 9 宽度优先搜索（6）

1.  例1-岛屿数量 (LeetCode 200)
2.  例2-词语阶梯(LeetCode 127)
3.  例3-词语阶梯2 (LeetCode 126)
4.  例4-01矩阵 (LeetCode 542)
5.  例5-太平洋与大西洋的水流 (LeetCode 417)
6.  例6-收集雨水2 (LeetCode 407)
 
# 10 动态规划（8）

1.  例1-爬楼梯 (LeetCode 70)
2.  例2-打家劫舍 (LeetCode 198）
3.  例3-最大字段和(LeetCode 53)
4.  例4-找零钱(LeetCode 322)
5.  例5-三角形(LeetCode 120)
6.  例6-最长上升子序列 (LeetCode 300)
7.  例7-最小路径和(LeetCode 64)
8.  例8-地牢游戏(LeetCode 174)
  
# 11 复杂数据结构（5）

2. 实现trie树 (LeetCode 208)
3. 添加与查找单词 (LeetCode 211）
5. 朋友圈 (LeetCode 547)
7. 区域和查询(LeetCode 307)
8. 逆序数 (LeetCode 315)
 
# 12 难题选讲（6）

1. 两数组的中位数(LeetCode 4)
2. 燃烧气球(LeetCode 312)
3. 最优加油方法(poj2431）
4. 最长合法括号 (LeetCode 32 )
5. 单词搜索2 (LeetCode 212)
6. 简单的计算器  (LeetCode 224)

----------

# Copyright

CSDN：[http://blog.csdn.net/y550918116j](http://blog.csdn.net/y550918116j)

GitHub：[https://github.com/937447974](https://github.com/937447974)