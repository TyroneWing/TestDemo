//
//  main.c
//  Algorithm
//
//  Created by yi on 17/5/5.
//  Copyright © 2017年 yi. All rights reserved.
//

#include <stdio.h>





/**
 
 题目：汉诺塔：河内之塔(Towers of Hanoi)是法国人M.Claus(Lucas)于1883年从泰国带至法国的，河内为越战时北越的首都，即现在的胡志明市；1883年法国数学家 Edouard Lucas曾提及这个故事，据说创世纪时Benares有一座波罗教塔，是由三支钻石棒（Pag）所支撑，开始时神在第一根棒上放置64个由上至下依由小至大排列的金盘（Disc），并命令僧侣将所有的金盘从第一根石棒移至第三根石棒，且搬运过程中遵守大盘子在小盘子之下的原则，若每日仅搬一个盘子，则当盘子全数搬运完毕之时，此塔将毁损，而也就是世界末日来临之时。
 
 思路：如果柱子标为ABC，要由A搬至C，在只有一个盘子时，就将它直接搬至C，当有两个盘子，就将B当作辅助柱。如果盘数超过2个，将第三个以下的盘子遮起来，就很简单了，每次处理两个盘子，也就是：A->B、A ->C、B->C这三个步骤，而被遮住的部份，其实就是进入程式的递回处理。事实上，若有n个盘子，则移动完毕所需之次数为2^n - 1
 */
void hanoi(int n, char A, char B, char C) {
    if(n == 1) {
        printf("移动%c柱上第1个到%c\n",A , C);
    } else {
        hanoi(n-1, A, C, B);
        printf("移动%c柱上第%d个到%c\n",A , n , C);
        hanoi(n-1, B, A, C);
    }
}


/**
 题目：假设你正在爬楼梯，需要走n阶楼梯才能到达顶部。但每次你只能爬一步或者两步，你能有多少种不同的方法爬到楼顶部？
 
 思路：假设要爬上10级，有两种做法：在第八级楼梯爬两步或者在第九级爬一步，即：f(10)=f(9)+f(8)，递归算法
 
 fibonacci 斐波那契数列 
 1 2 3 5 8 13 21 ...
 
 */
int fibonacci(int n) {
    int total = 0;
    if (n == 1 || n == 2)
        total = n;
    else
        total = fibonacci(n - 2) + fibonacci(n - 1);
    return total;
}


/**
 Fibonacci为1200年代的欧洲数学家，在他的着作中曾经提到：「若有一只免子每个月生一只小免子，一个月后小免子也开始生产。起初只有一只免子，一个月后就有两只免子，二个月后有三只免子，三个月后有五只免子（小免子投入生产）……。

 */
int fibonacciTest(int n) {
    
    int total = 0;
    if (n == 1 || n == 2)
        total = n+1;
    else
        total = fibonacciTest(n - 2) + fibonacciTest(n - 1);
    return total;
}



int main(int argc, const char * argv[]) {
    
//    printf("count = %d\n",fibonacci(5));
    
//    hanoi(3, 'A', 'B', 'C');
    
    printf("count = %d\n",fibonacciTest(5));

    
    return 0;
}




