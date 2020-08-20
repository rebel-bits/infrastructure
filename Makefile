ubuntu_20_docker:
	# build name dockerfile context
	docker build -t rbits/ubuntu_20_base_env -f platform/Dockerfile-ubuntu platform/ubuntu_20_context

toolchain_box: ubuntu_20_docker
	docker build -t rbits/toolchain -f tools/toolchain/Dockerfile tools/toolchain/

play_box: toolchain_box
	docker build -t rbits/play_box -f tools/ctfs/Dockerfile tools/ctfs/

run_base_docker: ubuntu_20_docker
		docker run --name "base_env" --hostname "base_env" -dit rbits/ubuntu_20_base_env

run_toolchain_box: toolchain_box
		docker run --name "toolchain_box" --hostname "toolchain_box" -dit rbits/toolchain

run_play_box: play_box
		docker run --name "play_box" --hostname "play_box" -dit rbits/play_box


