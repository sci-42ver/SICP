format:
	# https://unix.stackexchange.com/a/732101/568529
	find ~/SICP -name "*.scm" | grep -v sdf | xargs -o -I{} vim -c "execute 'normal gg=G' | update | quitall" {}
