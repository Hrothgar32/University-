#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int key;
    struct node *next;
} NodeT;

NodeT *search(NodeT *head, int givenKey) {
    while(head != NULL && head->key != givenKey){
        head = head->next;
    }
    return head;
}

void print_list(NodeT *head){
    while(head != NULL){
        printf("%d ", head->key);
        head = head->next;
    }
    printf("\n");
}

void insert_first(NodeT **head, NodeT **tail, int givenKey) {
    if(*head == NULL){
        *head = (NodeT*) malloc(sizeof(NodeT));
        (*head)->key = givenKey;
        (*head)->next = NULL;
        *tail = *head;
    }
    else{
        NodeT* newElement = (NodeT*) malloc(sizeof(NodeT));
        newElement->key = givenKey;
        newElement->next = (*head);
        (*head) = newElement;
    }

}

void insert_last(NodeT **head, NodeT **tail, int givenKey) {
    if(*head == NULL){
        *head = (NodeT*) malloc(sizeof(NodeT));
        (*head)->key = givenKey;
        (*head)->next = NULL;
        *tail = *head;
    }
    else{
        NodeT* newElement = (NodeT*) malloc(sizeof(NodeT));
        newElement->key = givenKey;
        (*tail)->next = newElement;
        newElement->next = NULL;
        *tail = newElement;
    }

    //TODO: insert the given key in the last position of the list given by head and tail;
}

void insert_after_key(NodeT** head, NodeT** tail, int afterKey, int givenKey){
    //TODO: insert the given key after afterKey, in list given by head and tail;
    NodeT* traversingKey = *head;
    while(traversingKey->key != afterKey && traversingKey != NULL)
        traversingKey = traversingKey->next;
    if(traversingKey != NULL && traversingKey->next == NULL)
        insert_last(head, tail, givenKey);
    else if(traversingKey != NULL){
        NodeT* newElement = (NodeT*) malloc(sizeof(NodeT));
        newElement->key = givenKey;
        newElement->next = traversingKey->next;
        traversingKey->next = newElement;
    }
}

void delete_first(NodeT** head, NodeT** tail){
    //TODO: delete first list element
    if(*head == *tail){
        free(*head);
        *head = NULL;
        *tail = NULL;
    }
    else{
     NodeT* dummy = *head;
    (*head) = (*head)->next;
    free(dummy);
    }
}

void delete_last(NodeT** head, NodeT** tail){
    //TODO: delete last list element
     if(*head == *tail){
        free(*head);
        *head = NULL;
        *tail = NULL;
     }
     else{
         NodeT* dummy = *head;
         while(dummy->next != *tail)
             dummy = dummy->next;
         free(dummy->next);
         dummy->next = NULL;
         *tail = dummy;

     }
}

void delete_key(NodeT** first, NodeT** last, int givenKey){
    //TODO: delete element having given key
    if((*first)->key == givenKey)
        delete_first(first, last);
    else if((*last)->key == givenKey)
        delete_last(first, last);
    else{
        NodeT* dummy = *first;
        while(dummy->next != NULL && dummy->next->key != givenKey){
            dummy = dummy->next;
        }
        if(dummy->next == NULL){
            printf("We couldn't find the specified value.\n");
            return;
        }
        NodeT* dummy2 = dummy->next;
        dummy->next = dummy2->next;
        free(dummy2);
    }
}

void invert_list(NodeT** first, NodeT** last){
    if(*first == NULL)
        return;
    int data = (*first)->key;
    delete_first(first, last);
    invert_list(first, last);
    insert_last(first, last, data);
}

int main() {
    NodeT *first = NULL;
    NodeT *last  = NULL;

    //perform several insertions
    insert_first(&first, &last, 4);
    insert_first(&first, &last, 1);
    insert_last(&first, &last, 3);
    insert_after_key(&first, &last, 4, 5);
    print_list(first);
    int toSearch = 2;
    NodeT *foundNode = search(first, toSearch);
    if (foundNode == NULL) {
        printf("Node %d not found!\n", toSearch);
    } else {
        printf("%d found!", foundNode->key);
    }
    //perform some insertions
    insert_after_key(&first, &last, 4, 22);
    print_list(first);
    insert_after_key(&first, &last, 3, 25);
    print_list(first);
    invert_list(&first, &last);
    print_list(first);


    //print list contents

    //perform some deletions
    delete_first(&first,&last);
    delete_last(&first, &last);
    delete_key(&first, &last, 22);
    delete_key(&first, &last, 8);


    //print list contents
    print_list(first);

    return 0;
}
