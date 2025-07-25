echo "Criando as imagens..........."

docker build -t rduarte12/projeto-backend:1.0 backend/.
docker build -t rduarte12/prpjeto=database:1.0 database/.


echo "Realizando o push das imagens......"

docker push rduarte12/projeto-backend:1.0
docker push rduarte12/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubctl apply -f ./services.yml

echo "Criando os deployments......."

kubectl apply -f ./deployment.yml

