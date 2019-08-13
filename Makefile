.PHONY: prepare build

prepare:
	sudo easy_install pip
	sudo pip install invoke semver pyyaml
	go get github.com/estesp/manifest-tool

build:
	inv push-multiarch --binaries=speaker --tag=master --docker-user=metallb
	docker tag metallb/speaker:master-amd64 registry-local.kubeup.cn/library/speaker:v0.8.1-u1
	docker push registry-local.kubeup.cn/library/speaker:v0.8.1-u1