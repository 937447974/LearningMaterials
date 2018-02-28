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

2.  例1-使用队列实现栈 (LeetCode 225)
3.  例2-使用栈实现队列 (LeetCode 232)
4.  例3-包含min函数的栈(LeetCode 155)
5.  例4-合法的出栈序列(POJ1363)
7.  例5-数组中的第K大的数 (LeetCode 215)
8.  例6-寻找中位数(LeetCode 295)
 
# 3 贪心（6）

2.  例1-分糖果 (LeetCode 455)
3.  例2-摇摆序列(LeetCode 376)
4.  例3-移除K个数字(LeetCode 402)
5.  例4-跳跃游戏1 (LeetCode 55)
6.  例5-跳跃游戏2 (LeetCode 45)
7.  例6-射击气球(LeetCode 452) 
 
# 4 递归与回溯搜索（6）

2.  例1-求子集 (LeetCode 78)
3.  例2-求子集2 (LeetCode 90)
4.  例3-组合数之和(LeetCode 40)
5.  例4-生成括号(LeetCode 22)
6.  例5-N皇后(LeetCode 51)
7.  例6-火柴棍摆正方形(LeetCode 473)
 
# 5 二分查找与分制算法（6）

2.  例1-插入位置(LeetCode 35)
3.  例2-区间查找(LeetCode 34)
4.  例3-旋转数组查找(LeetCode 33)
6.  例4-K个排序链表的合并(LeetCode 23)
7.  例5-逆序数计算 (LeetCode 315)
8.  例6-不同的括号方法 (LeetCode 241)
 
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