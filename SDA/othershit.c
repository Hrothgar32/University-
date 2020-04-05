#include <stdio.h>
#include <stdlib.h>

struct node{
    int data;
    struct node* next;
};

int main(){
    struct node* firstShit = (struct node*) malloc(sizeof(struct node));
    firstShit->data = 5;
    printf("%d\n", firstShit->data);
    return 0;
}
