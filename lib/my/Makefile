SRC	=	$(shell find . -name "*.c" -type f)

OBJ	=	$(SRC:.o=.c)

NAME	=	libmy.a

all:	$(OBJ)
	ar rc $(NAME) $(OBJ)
	cp $(NAME) ..

clean:
	rm -rf "*.o"

fclean:	clean
	rm -rf ../$(NAME)
	rm -rf $(NAME)

re: fclean all
