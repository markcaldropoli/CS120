#include <stdio.h>
#include <stdlib.h>

typedef struct node_struct {
  int value;
  struct node_struct *next;
} node;

node *insert(node *list, int value) {
  node *newNode = (node *)malloc(sizeof(node));
  /* Don't worry about malloc. Assume new pointer is passed back in v0.
  * jal malloc
  */
  newNode->value = value;
  /* sw $a1, 0($v0) */
  newNode->next = list;
  /* sw $a0, 4($v0) */
  return newNode;
}

void printList(node *list) { /* list is in $a0 */
  /* loop: beq $a0, $0, done */
  while (list != NULL) {
    printf("Node at %p holds %d, next is %p\n", list, list->value, list->next);
    /* Don't worry about what happens in printf */
    list = list->next;
    /* lw $a0, 4($a0) */
  }
}

int main() {
  node *list = NULL;
  list = insert(list, 5);
  list = insert(list, 10);
  list = insert(list, 20);
  printList(list);
  /* List Prints:
   * Node at ... holds 20, next is ...
   * Node at ... holds 10, next is ...
   * Node at ... holds 5, next is 0x0
   */
}
