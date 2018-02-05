/******************************************************************************/
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/31 17:26:54 by lfabbro           #+#    #+#             */
/*   Updated: 2018/02/01 15:50:23 by lfabbro          ###   ########.fr       */
/*                                                                            */
/******************************************************************************/

#ifndef LIBFTS_H
# define LIBFTS_H

void		ft_bzero(void *ptr, int n);
char		*ft_strcat(char *restrict s1, const char *restrict s2);
int			ft_isalpha(int c);
int			ft_isdigit(int c);
int			ft_isalnum(int c);
int			ft_isascii(int c);
int			ft_isprint(int c);
int			ft_toupper(int c);
int			ft_tolower(int c);
int			ft_puts(const char *s);
size_t		ft_strlen(const char *s);
void		*ft_memset(void *b, int c, size_t len);
void		*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
char		*ft_strdup(const char *s1);
void		ft_cat(int fd);
/*
**	bonus
*/
void		*ft_memmove(void *dst, const void *src, size_t n);
int			ft_ipow(int nb, int pow);
unsigned int	ft_upow(unsigned int nb, unsigned int pow);


/*
 * Bonus
*/

#endif
