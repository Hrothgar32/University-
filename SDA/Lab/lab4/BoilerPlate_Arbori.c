#include <stdio.h>
#include <stdlib.h>
typedef struct node_type
{
    int id; /* numele nodului */
    struct node_type *left, *right;
} NodeT;

void fatalError( const char *msg )
{
    printf( msg );
    printf( "\n" );
    exit ( 1 );
}

void postorder( NodeT *p ){
    if(p != NULL){
        postorder(p->left);
        postorder(p->right);
        printf("%d \n", p->id);
    }

}

NodeT* search(NodeT* root, int key){
    if(root == NULL)
        return NULL;
    if(root != NULL && root->id == key)
        return root;
    NodeT* leftSearch = search(root->left, key);
    NodeT* rightSearch = search(root->right, key);
    if(leftSearch != NULL)
        return leftSearch;
    if(rightSearch != NULL)
        return rightSearch;
    return NULL;
}

void inorder( NodeT *p ){
    if(p != NULL){
        inorder(p->left);
        printf("%d \n", p->id);
        inorder(p->right);
    }
}

int leaf_node(NodeT *node){
    if (node == NULL)
        return 0;
    if(node->left == NULL && node->right == NULL)
        return 1;
    return leaf_node(node->left) + leaf_node(node->right);
}

int noduri_interne(NodeT *node){
    if(node == NULL || (node->left == NULL && node->right == NULL))
        return 0;
    return 1 + noduri_interne(node->left) + noduri_interne(node->right);
}

int maxim(int a, int b){
    if(a > b)
        return a;
    return b;
}

int inaltime(NodeT *node){
    if(node == NULL)
        return -1;
    return 1 + maxim(inaltime(node->left), inaltime(node->right));
}


void preorder( NodeT *p )
/*
*/
{
    if ( p != NULL )
    {
        printf( "%d \n", p->id );
        preorder( p->left);
        preorder( p->right);
    }
}
//creaza un arbore binar prin citirea de la tastatura
NodeT *createBinTree( int branch, NodeT *parent )
{
    NodeT *p;
    int id;

    /* read node id */
    if ( branch == 0 )
        printf( "Valoarea pentru radacina [0 pt null] =" );
    else if ( branch == 1 )
        printf( "Fiul stang al nodului cu valoarea %d [0 pt null] =",
                parent->id );
    else
        printf( "Fiul drept al nodului cu valoarea %d [0 pt null] =",
                parent->id );
    scanf("%d", &id);
    if ( id == 0 )
        return NULL;
    else
    {
        /* construim nodul la care pointeaza p */
        p = ( NodeT *)malloc(sizeof( NodeT ));
        if ( p == NULL ){
            printf( "Nu mai avem memorie in createBinTree" );
            exit(1);
        }
        /* fill in node */
        p->id = id;
        p->left = createBinTree( 1, p );
        p->right = createBinTree( 2, p );
    }
    return p;
}
NodeT *createBinTreeFromFile(FILE* f)
{
  NodeT *p;
  int c;

  /* se citeste id-ul nodului */
  fscanf(f, "%d", &c);
  if ( c == 0 )
    return NULL; /* arbore vid, nu facem nimic */
  else /* else inclus pentru claritate */
  { /* construim nodul la care pointeaza p */
    p = ( NodeT *) malloc( sizeof( NodeT ));
    if ( p == NULL )
      fatalError( "Nu mai avem memorie in createBinTree" );
    /* se populeaza nodul */
    p->id = c;
    p->left = createBinTreeFromFile(f);
    p->right = createBinTreeFromFile(f);
  }
  return p;
}


int main()
{
    NodeT *root;
    FILE *f = fopen("ArboreBinar.txt", "r");
    if (!f){
        printf("Nu se poate deschide fisierul ArboreBinar.txt\n");
        return -1;
    }
    root = createBinTreeFromFile(f);
    fclose(f);


    printf( "\nParcurgere in preordine\n" );
    preorder( root );

	//TODO
	postorder(root);

	inorder(root);

	int nr_frunze = leaf_node(root);
	printf("Numarul de frunze este %d\n", nr_frunze);//3

    printf("Noduri interne = %d \n", noduri_interne(root));//5

    printf("Inaltimea arborelui = %d \n", inaltime(root)); //3
    return 0;
}
