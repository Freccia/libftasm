
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>

#include "libfts.h"

static int		test_bzero(int n);
static int		test_strcat(char *dst, char *src, int n);
static int		test_isalpha();
static int		test_isdigit();
static int		test_isalnum();
static int		test_isascii();
static int		test_isprint();
static int		test_toupper();
static int		test_tolower();
static int		test_puts(char *str);
static int		test_strlen(char *str);
static int		test_memset(int c, int n);
static int		test_memcpy(char *s, size_t n);
static int		test_strdup(char *s);
static int		test_cat(char *path);

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
 *		ft_strlen
 */
	printf("\nTest ft_strlen: \n");
	test_strlen("Hello! We are testing ft_strlen!");
	test_strlen("Hello! lol\t lol lol\n");

/*
 *		ft_puts
 */
	printf("\nTest ft_puts: \n");
	test_puts("Hello! We are testing ft_puts!");
	test_puts("");

/*
 *		ft_memset
 */
	printf("\nTest ft_memset: \n");
	test_memset('a', 10);
	test_memset(16, 50);

/*
 *		ft_memcpy
 */
	printf("\nTest ft_memcpy: \n");
	test_memcpy("Hello World!\n", 13);
	test_memcpy("Falalalalalalalalalalalalalalalalalalalalalalalal", 4*12+1);

/*
 *		ft_strdup
 */
	printf("\nTest ft_strcpy: \n");
	test_strdup("Hello World!\n");
	test_strdup("Falalalalalalalalalalalalalalalalalalalalalalalal");
	ft_strdup(NULL);

/*
 *		ft_cat
 */
	printf("\nTest ft_cat:\n");
	if (ac > 1)
		test_cat(av[1]);
	else if (ac > 2)
		test_cat(av[2]);
	test_cat("-");

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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
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
	printf("OK\n");
	return (0);
}

static int		test_strlen(char *str)
{
	char	j;
	char	k;

	k = ft_strlen(str);
	j = strlen(str);
	if (k != j)
		return (printf("ERROR: %d != %d strlen does not work!\n", j, k));
	printf("OK\n");
	return (0);
}

static int		test_puts(char *str)
{
	int		j;
	int		k;

	j = ft_puts(str);
	k = puts(str);
	if ((j > 0 && k <= 0) || (j <= 0 && k > 0))
		return (printf("ERROR: %d != %d puts does not work!\n", j, k));
	printf("OK  - len: %d\n", j);
	return (0);
}

static int			test_memset(int c, int n)
{
	char	*ptr;
	char	*tmp;
	int		i = 0;

	ptr = malloc(n);
	tmp = malloc(n);
	ptr = ft_memset(ptr, c, n);
	tmp = memset(tmp, c, n);
	while (i < n)
	{
		/*
		printf("ptr[%d]: %d\n", i, ptr[i]);
		*/
		if (ptr[i] != tmp[i])
			return (printf("ERROR: ptr[%d]: %d != %d\n", i, ptr[i], tmp[i]));
		++i;
	}
	printf("OK\n");
	free(ptr);
	free(tmp);
	return (0);
}

static int			test_memcpy(char *s, size_t n)
{
	char	*ptr;
	char	*tmp;
	size_t	i = 0;

	ptr = malloc(n);
	tmp = malloc(n);
	ptr = ft_memcpy(ptr, s, n);
	tmp = memcpy(tmp, s, n);
	while (i < n)
	{
		/*
		printf("ptr[%ld]: %d\n", i, ptr[i]);
		*/
		if (ptr[i] != tmp[i])
			return (printf("ERROR: ptr[%ld]: %d != %d (%s)\n", i, ptr[i], tmp[i], s));
		++i;
	}
	printf("OK\n");
	free(ptr);
	free(tmp);
	return (0);
}

static int			test_strdup(char *s)
{
	char	*ptr;
	char	*tmp;
	size_t	i = 0;
	size_t	len = strlen(s);

	tmp = strdup(s);
	ptr = ft_strdup(s);
	while (i < len)
	{
		/*
		printf("ptr[%ld]: %d\n", i, ptr[i]);
		*/
		if (ptr[i] != tmp[i])
			return (printf("ERROR: ptr[%ld]: %d != %d (%s)\n", i, ptr[i], tmp[i], s));
		++i;
	}
	//printf("%s -- %s\n", ptr, tmp);
	printf("OK\n");
	free(ptr);
	free(tmp);
	return (0);
}

static int			test_cat(char *path)
{
	int		fd;
	
	if (path && path[0] == '-')
		fd = 0;
	else if ((fd = open(path, O_RDONLY)) < 0)
			return (printf("Failed to open fd.\n"));
	write(1, "Enter the void\n", 15);
	ft_cat(fd);
	if (fd > 2)
		close(fd);
	return (0);
}
