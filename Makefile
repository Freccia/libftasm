# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfabbro <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/04 15:18:12 by lfabbro           #+#    #+#              #
#    Updated: 2018/01/23 16:48:57 by lfabbro          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# nasm -f macho64 libc.s -o libc.o
# ld libc.o -macosx_min_version 10.8 -lSystem
#$(LD) $(LDFLAGS) $^ -o $@

NAME		= libfts.a

SRC_NAME	= ft_bzero.s \
			  ft_strcat.s \
			  ft_isalpha.s \
			  ft_isdigit.s \
			  ft_isalnum.s \
			  ft_isascii.s \
			  ft_isprint.s \
			  ft_toupper.s \
			  ft_tolower.s \
			  ft_puts.s \
			  ft_strlen.s \
			  ft_memset.s \
			  ft_memcpy.s \
			  ft_strdup.s \
			  ft_cat.s

TEST		= test_libfts
TEST_SRC	= main.c

SRC_DIR		= src
OBJ_DIR		= obj
INC_DIR		= inc
LIB_DIR		= .

AS			=  /usr/local/bin/nasm
ASFLAGS		+= -f macho64
CC			= clang
CFLAGS		= -Wall -Wextra -Werror -g
LD			=  ld
LDFLAGS		+= -macosx_version_min 10.8 -lSystem

INC			= $(addprefix -I./,$(INC_DIR))
LIBS		= $(addprefix -L,$(LIB_DIR))
LIBS		+= -lfts

SRC_ASM		= $(addprefix $(SRC_DIR)/,$(SRC_NAME))
OBJ_ASM		= $(patsubst $(SRC_DIR)/%.s,$(OBJ_DIR)/%.o,$(SRC_ASM))

RED			= \033[0;31m
GREEN		= \033[0;32m
YELLOW		= \033[0;33m
WHITE		= \033[1;37m
ENDC		= \033[0m

.PHONY:	all clean fclean re $(TEST)

all: $(NAME) test

$(NAME): $(OBJ_ASM) 
	ar rc $(NAME) $^
	@printf "$(WHITE) [ $(GREEN)OK $(WHITE)] $(NAME) $(ENDC)\n"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(AS) $(ASFLAGS) $^ -o $@

test:
	$(CC) $(CFLAGS) $(INC) $(TEST_SRC) $(LIBS) -o $(TEST)

clean:
	@printf "$(WHITE) [ $()CLEAN $(WHITE)]$(ENDC)\n"
	@rm -fvr $(OBJ_DIR) $(TEST)

fclean: clean
	@printf "$(WHITE) [ $(RED)FCLEAN $(WHITE)]$(ENDC)\n"
	@rm -frv $(NAME) *.dSYM

re: fclean all

