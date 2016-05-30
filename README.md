# nginx-gulp

For Production use create docker file with this imagas as Base image
The nginxs root\_dir is /workspace/dist
In Production mode the gulp build is executed

In development mode gulp serve is executed.

e.g:

```Dockerfile
FROM captndev/nginx-gulp

ADD . /workspace

CMD ["production"]
```
