# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anchikri <anchikri@42mulhouse.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/18 14:26:25 by anchikri          #+#    #+#              #
#    Updated: 2024/03/15 01:23:52 by anchikri         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

# ==================== SOURCES ==================== #

SRC_CHECK =		src/check/ft_isalnum.c \
				src/check/ft_isalpha.c \
				src/check/ft_isascii.c \
				src/check/ft_isdigit.c \
				src/check/ft_isprint.c

SRC_CONVERT =	src/convert/ft_atoi.c \
				src/convert/ft_itoa.c \
				src/convert/ft_toupper.c \
				src/convert/ft_tolower.c

SRC_FD =		src/fd/ft_putchar_fd.c \
				src/fd/ft_putendl_fd.c \
				src/fd/ft_putnbr_fd.c \
				src/fd/ft_putstr_fd.c 
				 
SRC_GNL =		src/get_next_line/get_next_line.c \
				src/get_next_line/get_next_line_utils.c


SRC_LIST =		src/list/ft_lstnew_bonus.c \
				src/list/ft_lstadd_front_bonus.c \
				src/list/ft_lstsize_bonus.c \
				src/list/ft_lstlast_bonus.c \
				src/list/ft_lstadd_back_bonus.c \
				src/list/ft_lstdelone_bonus.c \
				src/list/ft_lstclear_bonus.c \
				src/list/ft_lstiter_bonus.c \
				src/list/ft_lstmap_bonus.c

SRC_MEMORY =	src/memory/ft_bzero.c \
				src/memory/ft_calloc.c \
				src/memory/ft_memchr.c \
				src/memory/ft_memcmp.c \
				src/memory/ft_memcpy.c \
				src/memory/ft_memmove.c \
				src/memory/ft_memset.c 

SRC_STRING =	src/string/ft_strchr.c \
				src/string/ft_strdup.c \
				src/string/ft_strlcat.c \
				src/string/ft_strlcpy.c \
				src/string/ft_strlen.c \
				src/string/ft_strncmp.c \
				src/string/ft_strnstr.c \
				src/string/ft_strrchr.c \
				src/string/ft_strjoin.c \
				src/string/ft_strmapi.c \
				src/string/ft_strtrim.c \
				src/string/ft_substr.c \
				src/string/ft_split.c \
				src/string/ft_striteri.c

SRCS =			${SRC_CHECK} \
				${SRC_CONVERT} \
				${SRC_FD} \
				${SRC_GNL} \
				${SRC_LIST} \
				${SRC_MEMORY} \
				${SRC_STRING}

OBJDIR =		.obj/

OBJS =			${SRCS:%.c=${OBJDIR}%.o}

# ==================== FLAGS ==================== #

CC = cc
CFLAGS = -Wall -Werror -Wextra
RM = rm -rf
AR = ar rcs

# ==================== RULES ==================== #

all: libft $(NAME)

libft:
	@printf "$(CYAN)"
	@echo "╔═════════════════╗"
	@echo "║  ╦  ╦╔╗ ╔═╗╔╦╗  ║"
	@echo "║  ║  ║╠╩╗╠╣  ║   ║"
	@echo "║  ╩═╝╩╚═╝╚   ╩   ║"
	@echo "╚═════════════════╝\n"

${OBJDIR}%.o: %.c
	@mkdir -p ${@D}
	@printf "\r${GREEN}Compilation of $(CYAN)libft${RESET}..."
	@${CC} ${CFLAGS} -c $< -o $@

$(NAME):	${OBJS}
	@$(AR) $(NAME) $(OBJS) 
	@echo "\n$(CYAN)${NAME}$(RESET) $(GREEN)has been created $(RESET)✔️"

clean:
	@${RM} ${OBJDIR}
	@echo "$(RED)Deleting $(CYAN)libft $(YELLOW)objs$(RESET) ✔️"

fclean:	clean
	@${RM} ${NAME}
	@echo "$(RED)Deleting $(CYAN)$(NAME)$(RESET) ✔️"

re:		fclean all

.PHONY: all clean fclean re bonus

# ==================== COLOR ==================== #

RED 	:= \033[1;31m
GREEN 	:= \033[1;32m
YELLOW 	:= \033[1;33m
CYAN 	:= \033[1;36m
RESET 	:= \033[0m