docker build -t edwardjryanjr/multi-client:latest -t edwardjryanjr/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t edwardjryanjr/multi-server:latest -t edwardjryanjr/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t edwardjryanjr/multi-worker:latest -t edwardjryanjr/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push edwardjryanjr/multi-client:latest
docker push edwardjryanjr/multi-client:$SHA
docker push edwardjryanjr/multi-server:latest
docker push edwardjryanjr/multi-server:$SHA
docker push edwardjryanjr/multi-worker:latest
docker push edwardjryanjr/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=edwardjryanjr/multi-server:$SHA
kubectl set image deployments/client-deployment client=edwardjryanjr/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=edwardjryanjr/multi-worker:$SHA
