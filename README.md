## 安装数据库
docker run --name=psql2 -v morney-rails1-data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=morney -e POSTGRES_PASSWORD=123456 -d postgres:12.2