#include <stdio.h>
#include <dirent.h>

int main(){
	DIR* dir;
	struct dirent* dirs;

	dir = opendir(".");
	if(dir == NULL){
		perror("open current directory is failed.");
		return -1;
	}

	for(dirs=readdir(dir); dirs!=NULL; dirs=readdir(dir))
		printf("%s\n", dirs->d_name);

	closedir(dir);
	return 0;
}
