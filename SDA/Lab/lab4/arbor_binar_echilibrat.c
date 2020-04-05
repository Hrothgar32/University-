#include <stdio.h>
#include <stdlib.h>

typedef struct node_type{
    int id;
    struct node_type *left, *right;
}NodeT;

NodeT* createBalancedBinaryTree(int nodeNumber){
    NodeT* p;
    int nodeLeft, nodeRight;
    if(nodeNumber <= 0)
        return NULL;
    nodeLeft = nodeNumber / 2;
    nodeRight = nodeNumber - nodeLeft -1;
    p = (NodeT*) malloc(sizeof(NodeT));
    scanf("%d", &(p->id));
    p->left = createBalancedBinaryTree(nodeLeft);
    p->right = createBalancedBinaryTree(nodeRight);
    return p;
}

int main(){
    NodeT* root = NULL;
    int nodeNumber;
    printf("Numarul nodurilor este:");
    scanf("%d", &nodeNumber);
    root = createBalancedBinaryTree(nodeNumber);
    return 0;
}
