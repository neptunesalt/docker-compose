# Elasticsearch Enable X-Pack Security

1. In Kibana, go to Management -> License Management.  Enable Trial.
2. Login to elasticsearch container, run and setup default passwords:
```
bin/elasticsearch-setup-passwords interactive
```
3. elasticsearch container edit the config/elasticsearch.yml and add:
```
xpack.security.enabled: true
```
4. kibana container edit the config/kibana.yml and add:
```
elasticsearch.username: "kibana"
elasticsearch.password: "password"
```
5. stop and start containers
	
