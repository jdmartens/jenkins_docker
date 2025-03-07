jenkins-docker:
	jenkins_docker % docker run --name jenkins-docker --rm --detach \                   
	--privileged --network jenkins --network-alias docker \
	--env DOCKER_TLS_CERTDIR=/certs \                               
	--volume jenkins-docker-certs:/certs/client \   
	--volume jenkins-data:/var/jenkins_home \       
	--publish 2376:2376 \        
	docker:dind --storage-driver overlay2

jenkins-blue
	docker run --name jenkins-blueocean --restart=on-failure --detach \
	--network jenkins --env DOCKER_HOST=tcp://docker:2376 \
	--env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
	--publish 8081:8080 --publish 50000:50000 \  
	--volume jenkins-data:/var/jenkins_home \
	--volume jenkins-docker-certs:/certs/client:ro \
	myjenkins-blueocean:2.492.1-1 

clean-jenkins-data:
	docker volume rm jenkins-data
