CC	=	gcc

SRC	=	$(shell find src/ -name "*.c" ! -name main.c -type f)

OBJ	=	$(SRC:.c=.o)

NAME	=	my_paint

LIB	=	-L lib/ -lmy -lcsfml-graphics -lcsfml-window -lcsfml-system -lcsfml-audio

FLAG	=	-W -Wall -Wextra -Werror -I ./include

UNIT_TESTS	=	-lcriterion --coverage

UNIT_NAME	=	unit_tests

all:	$(OBJ)
	make -C lib/my/ all
	$(CC) -o $(NAME) src/main.c $(OBJ) $(FLAG) $(LIB)

clean:
	find . -name "*.o" -delete -o -name "*.gcda" -delete -o -name "*.gcno" -delete

fclean:	clean
	rm -rf $(NAME)
	make -C lib/my fclean

re: fclean all

tests_run:	$(OBJ)
	$(CC) -o $(UNIT_NAME) $(OBJ) $(FLAG) $(LIB) $(UNIT_TESTS)
