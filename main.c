
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "libfts.h"

static int		test_bzero(int n);
static int		test_isalpha();
static int		test_isdigit();
static int		test_isalnum();
static int		test_isascii();
static int		test_isprint();
static int		test_toupper();
static int		test_tolower();
static int		test_puts(char *str);
static int		test_strcat(char *dst, char *src, int n);

int		main(int ac, char **av)
{
	char	*ptr;

	(void)ac;
	(void)av;
	ptr = NULL;
/*
 *		ft_bzero
 */
	printf("\nTest ft_bzero: \n");
	test_bzero(30);
	test_bzero(1000);

/*
 *		ft_strcat
 */
	printf("\nTest ft_strcat: \n");
	test_strcat("Hello", " World!\n", 15);

/*
 *		ft_isalpha
 */
	printf("\nTest ft_isalpha: \n");
	test_isalpha();

/*
 *		ft_isdigit
 */
	printf("\nTest ft_isdigit: \n");
	test_isdigit();

/*
 *		ft_isalnum
 */
	printf("\nTest ft_isalnum: \n");
	test_isalnum();

/*
 *		ft_isascii
 */
	printf("\nTest ft_isascii: \n");
	test_isascii();

/*
 *		ft_isprint
 */
	printf("\nTest ft_isprint: \n");
	test_isprint();

/*
 *		ft_toupper
 */
	printf("\nTest ft_toupper: \n");
	test_toupper();

/*
 *		ft_tolower
 */
	printf("\nTest ft_tolower: \n");
	test_tolower();

/*
 *		ft_puts
 */
	printf("\nTest ft_puts: \n");
	test_puts("Hello! We are testing ft_puts!");

	free(ptr);
	return (0);
}

static int		test_bzero(int n)
{
	char	*ptr;
	int		i = 0;

	ptr = malloc(n);
	memset(ptr, 'a', n); //here
	ft_bzero(ptr, n);
	while (i < n)
	{
		if (ptr[i] != 0)
			return (printf("ft_bzero does not initialize correctly (n: %d, i: %d)!\n", n, i));
		++i;
	}
	free(ptr);
	return (0);
}

static int		test_strcat(char *dst, char *src, int n)
{
	void	*ptr;
	void	*tmp;

	ptr = malloc(n);
	tmp = malloc(n);
	ft_bzero(ptr, n);
	ft_bzero(tmp, n);
	ft_strcat(ptr, dst);
	ptr = ft_strcat(ptr, src);
	strcat(tmp, dst);
	tmp = strcat(tmp, src);
	if (strcmp(ptr, tmp))
		return (printf("ERROR: ft_strcat and strcat ouput differs!\n"));
	printf("%s", ptr);
	free(ptr);
	free(tmp);
	return (0);
}

static int		test_isdigit()
{
	int		i;

	i = 0;
	while (i <= '~')
	{
		if (ft_isdigit(i) && !isdigit(i))
			return (printf("ERROR: %d is not digit!\n", i));
		if (!ft_isdigit(i) && isdigit(i))
			return (printf("ERROR: %d is digit!\n", i));
		++i;
	}
	return (0);
}

static int		test_isalpha()
{
	int		i;

	i = 0;
	while (i <= '~')
	{
		if (ft_isalpha(i) && !isalpha(i))
			return (printf("ERROR: %d is not alpha!\n", i));
		if (!ft_isalpha(i) && isalpha(i))
			return (printf("ERROR: %d is alpha!\n", i));
		++i;
	}
	return (0);
}

static int		test_isalnum()
{
	int		i;

	i = 0;
	while (i <= '~')
	{
		if (ft_isalnum(i) && !isalnum(i))
			return (printf("ERROR: %d is not alnum!\n", i));
		if (!ft_isalnum(i) && isalnum(i))
			return (printf("ERROR: %d is alnum!\n", i));
		++i;
	}
	return (0);
}

static int		test_isascii()
{
	int		i;

	i = 0;
	while (i <= '~')
	{
		if (ft_isascii(i) && !isascii(i))
			return (printf("ERROR: %d is not ascii!\n", i));
		if (!ft_isascii(i) && isascii(i))
			return (printf("ERROR: %d is ascii!\n", i));
		++i;
	}
	return (0);
}

static int		test_isprint()
{
	int		i;

	i = 0;
	while (i <= '~')
	{
		if (ft_isprint(i) && !isprint(i))
			return (printf("ERROR: %d is not print!\n", i));
		if (!ft_isprint(i) && isprint(i))
			return (printf("ERROR: %d is print!\n", i));
		++i;
	}
	return (0);
}

static int		test_toupper()
{
	char	i;
	char	j;
	char	k;

	i = 0;
	while (i <= '~')
	{
		k = ft_toupper(i);
		j = toupper(i);
		if (k != j)
			return (printf("ERROR: %c != %c tolower does not work!\n", j, k));
		++i;
	}
	return (0);
}

static int		test_tolower()
{
	char	i;
	char	j;
	char	k;

	i = 0;
	while (i <= '~')
	{
		k = ft_tolower(i);
		j = tolower(i);
		if (k != j)
			return (printf("ERROR: %c != %c tolower does not work!\n", j, k));
		++i;
	}
	return (0);
}

static int		test_puts(char *str)
{
	ft_puts(str);
	return (0);
}
