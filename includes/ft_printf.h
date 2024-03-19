/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anchikri <anchikri@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/30 08:20:21 by anchikri          #+#    #+#             */
/*   Updated: 2023/11/16 12:06:19 by anchikri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <unistd.h>
# include <stdarg.h>

int		ft_printf(const char *s, ...);
int		ft_print_char(int c);
int		ft_print_str(char *s);
int		ft_puthex(unsigned long n, char *hex, int ptr);
int		ft_putnbr(int n);
int		ft_uputnbr(unsigned int n);
size_t	ft_strlen(const char *s);

#endif