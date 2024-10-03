#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
  int number;
  struct Node* next;
} Node;

void Push(Node** head, int A)
{
  Node* n = malloc(sizeof(Node));
  n->number = A;
  n->next = *head;
  *head = n;
}

void deleteN(Node** head, int position)
{
  Node* temp;
  Node* prev;
  temp = *head;
  prev = *head;
  for (int i = 0; i < position; i++) {
    if (i == 0 && position == 1) {
      *head = (*head)->next;
      free(temp);
    }
    else {
      if (i == position - 1 && temp) {
        prev->next = temp->next;
        free(temp);
      }
      else {
        prev = temp;
        if (prev == NULL)
          break;
        temp = temp->next;
      }
    }
  }
}

void printList(Node* head)
{
  while (head) {
    printf("[%i] [%p]->%p\n", head->number, (void *)head,
           (void *)head->next);
    head = head->next;
  }
  printf("\n\n");
}

int main()
{
  Node* list = malloc(sizeof(Node));
  list->next = NULL;

  Push(&list, 1); 
  Push(&list, 2); 
  Push(&list, 3); 

  printf("Initial list:\n");
  printList(list);

  printf("Delete position 1:\n");
  deleteN(&list, 1);
  printList(list);

  printf("Delete position 1 again:\n");
  deleteN(&list, 1);
  printList(list);

  Push(&list, 4); 
  Push(&list, 5);

  printf("List after adding more nodes:\n");
  printList(list);

  printf("Delete position 3 (last node):\n");
  deleteN(&list, 3);
  printList(list);

  printf("Attempt to delete a node beyond the list length (position 5):\n");
  deleteN(&list, 5);
  printList(list);

  printf("Delete remaining nodes:\n");
  deleteN(&list, 1);
  deleteN(&list, 1);
  printList(list);

  return 0;
}
