# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anchikri <anchikri@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/18 14:26:25 by anchikri          #+#    #+#              #
#    Updated: 2024/03/19 19:05:18 by anchikri         ###   ########.fr        #
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
				 
SRC_PRINTF =	src/ft_printf/ft_printf.c \
				src/ft_printf/ft_print_nbr.c \
				src/ft_printf/ft_print.c

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
				${SRC_PRINTF} \
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

TOTAL = $(words $(SRCS))
CURRENT = 0
NORM = $(shell norminette | grep -c "Error")

# ==================== RULES ==================== #

all: libft norm ${NAME}

libft:
	@printf "$(CYAN)"
	@echo "╔═════════════════╗"
	@echo "║  ╦  ╦╔╗ ╔═╗╔╦╗  ║"
	@echo "║  ║  ║╠╩╗╠╣  ║   ║"
	@echo "║  ╩═╝╩╚═╝╚   ╩   ║"
	@echo "╚═════════════════╝\n"


define color_progress
$(if $(shell test $(1) -gt 66 && echo true),$(GREEN),$(if $(shell test $(1) -gt 33 && echo true),$(YELLOW),$(RED)))
endef

define progress_bar
	@$(eval COMPILED=$(shell echo $$(($(COMPILED)+1))))
	@$(eval PROGRESS_PERCENT=$(shell echo $$((($(COMPILED) * 100) / $(TOTAL)))))
	@printf "$(MAGENTA)["
	@for number in $$(seq 1 $(COMPILED)); do printf "$(call color_progress,$(PROGRESS_PERCENT))▓"; done
	@for number in $$(seq 1 $$(($(TOTAL) - $(COMPILED)))); do printf "$(GRAY)."; done
	@printf "$(CYAN)] [$(COMPILED)/$(TOTAL)]$(RESET)\r"
endef

$(OBJDIR)%.o: %.c 
	@mkdir -p $(@D)
	@${CC} ${CFLAGS} -c $< -o $@
	$(call progress_bar)

norm:
	@printf "Norminette : "
	@if [ $(NORM) -eq 0 ]; then \
		printf "${GREEN}OK${RESET}"; \
	else \
		printf "${RED}KO\n"; \
		norminette | grep "Error"; \
	fi
	@printf "\n"


$(NAME): ${OBJS} 
	@$(AR) $(NAME) $(OBJS) 
	@echo "\n$(GREEN)The archive $(CYAN)${NAME} $(GREEN)has been created $(RESET)✔️"

clean:
	@${RM} ${OBJDIR}
	@echo "$(RED)Deleting $(CYAN)libft $(YELLOW)objs$(RESET) ✔️"

fclean:	clean
	@${RM} ${NAME}
	@echo "$(RED)Deleting $(CYAN)$(NAME)$(RESET) ✔️"

re:		fclean all

.PHONY: all clean fclean re bonus

# ==================== COLOR ==================== #

RED := \033[1;31m
GREEN := \033[1;32m
YELLOW := \033[1;33m
CYAN := \033[1;36m
GRAY := \033[1;30m
RESET := \033[0m