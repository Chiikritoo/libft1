/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_nbr.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anchikri <anchikri@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/09 19:42:49 by anchikri          #+#    #+#             */
/*   Updated: 2024/03/15 12:17:30 by anchikri         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/ft_printf.h"

int	ft_len(unsigned int n)
{
	int	len;

	if (n == 0)
		len = 1;
	else
		len = 0;
	while (n)
	{
		n /= 10;
		len++;
	}
	return (len);
}

int	ft_putnbr(int n)
{
	int	len;

	len = 0;
	if (n == -2147483648)
		return (ft_print_str("-2147483648"));
	else if (n < 0)
	{
		write(1, "-", 1);
		len = 1;
		n *= -1;
	}
	len += ft_len(n);
	if (n > 9)
		ft_putnbr(n / 10);
	ft_print_char((n % 10) + 48);
	return (len);
}

int	ft_uputnbr(unsigned int n)
{
	int	len;

	len = ft_len(n);
	if (n > 9)
		ft_putnbr(n / 10);
	ft_print_char((n % 10) + 48);
	return (len);
}

int	ft_puthex(unsigned long n, char *hex, int ptr)
{
	int	len;

	len = 0;
	if (ptr)
	{
		ft_print_str("0x");
		len += 2;
	}
	if (n >= 16)
		len += ft_puthex(n / 16, hex, 0);
	ft_print_char(hex[n % 16]);
	len++;
	return (len);
}
