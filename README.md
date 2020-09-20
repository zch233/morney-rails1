## 安装数据库
```
docker run --name=psql2 -v morney-rails1-data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=morney -e POSTGRES_PASSWORD=123456 -d postgres:12.2
```
## 查看 Rails 有哪些命令
```
bin/rails -T
```
## 使用 rails 创建数据库
```
bin/rails db:create
bin/rails db:drop
```
## 使用 rails 创建表
```
bin/rails g model User
bin/rails g model User email:string password_digest:string
```
## 运行
```
bin/rails s
```