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
	docker run --name "play_box" --hostname "play_box" -v $(REPO):/root/shared -dit rbits/play_box

pull_ghidra_image:
	docker pull blacktop/ghidra 

run_ghidra_server: pull_ghidra_image
	docker run --init -it --rm \
             --name ghidra-server \
             --cpus 2 \
             --memory 500m \
             -e MAXMEM=500M \
             -e GHIDRA_USERS="root rbits" \
             -v $(REPO):/shared \
             blacktop/ghidra server

run_ghidra: pull_ghidra_image	
	docker run --init -it --rm \
             --name ghidra \
             --cpus 2 \
             --memory 4g \
             -e MAXMEM=4G \
			 --net=host \
             -e "DISPLAY" \
			 -v="/run/user/1000/gdm/Xauthority:/root/.Xauthority:rw" \
             -v $(REPO):/shared \
             blacktop/ghidra
