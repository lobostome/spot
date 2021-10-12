POD := $(shell kubectl get pods -n workshop -l app=spot --no-headers -o=custom-columns=NAME:.metadata.name | head -n 1)

apply:
	kubectl apply -f k8s.yml

delete:
	kubectl delete -f k8s.yml

port:
	kubectl port-forward deployment/spot-app 9090:8080 -n workshop

pods:
	kubectl get pods -n workshop -l app=spot

deploy:
	kubectl get deployments -n workshop

rs:
	kubectl get replicasets -n workshop

logs:
	kubectl logs -f -n workshop -l app=spot

logs-first:
	kubectl logs -f pod/$(POD) -n workshop

status:
	kubectl rollout status deployment/spot-app -n workshop

history:
	kubectl rollout history deployment/spot-app -n workshop

pod-describe:
	kubectl describe pod/$(POD) -n workshop

pod-delete:
	kubectl delete pod/$(POD) -n workshop

deploy-describe:
	kubectl describe deployment/spot-app -n workshop

rollback:
	kubectl rollout undo deployment/spot-app -n workshop

scale-up:
	kubectl scale deployment/spot-app -n workshop --replicas=10

scale-down:
	kubectl scale deployment/spot-app -n workshop --replicas=4

curl:
	curl -i localhost:9090

curl-health:
	curl -i localhost:9090/health
