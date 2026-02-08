/*
 * forkpty-linux.c - Linux/musl forkpty implementation using POSIX PTY.
 */

#include <sys/types.h>
#include <sys/ioctl.h>

#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "tmux.h"

pid_t
forkpty(int *master, char *name, struct termios *tio, struct winsize *ws)
{
	int	slave = -1;
	char   *path;
	pid_t	pid;

	if ((*master = posix_openpt(O_RDWR|O_NOCTTY)) == -1)
		return (-1);
	if (grantpt(*master) != 0)
		goto out;
	if (unlockpt(*master) != 0)
		goto out;

	if ((path = ptsname(*master)) == NULL)
		goto out;
	if (name != NULL)
		strlcpy(name, path, TTY_NAME_MAX);
	if ((slave = open(path, O_RDWR|O_NOCTTY)) == -1)
		goto out;

	switch (pid = fork()) {
	case -1:
		goto out;
	case 0:
		close(*master);

		setsid();
#ifdef TIOCSCTTY
		if (ioctl(slave, TIOCSCTTY, NULL) == -1)
			fatal("ioctl failed");
#endif

		if (tio != NULL && tcsetattr(slave, TCSAFLUSH, tio) == -1)
			fatal("tcsetattr failed");
		if (ioctl(slave, TIOCSWINSZ, ws) == -1)
			fatal("ioctl failed");

		dup2(slave, 0);
		dup2(slave, 1);
		dup2(slave, 2);
		if (slave > 2)
			close(slave);
		return (0);
	}

	close(slave);
	return (pid);

out:
	if (*master != -1)
		close(*master);
	if (slave != -1)
		close(slave);
	return (-1);
}
