# Kafka SASL

This is extended off the work in https://docs.confluent.io/3.3.0/installation/docker/docs/tutorials/clustered-deployment-sasl.html but using docker networking configuration instead of host networking.  There are still some issues with how kerberos tries to determine the hostname and how the docker network host resolves it.

There also might be some issues with versions of kerberos library dependencies in the different images so check the package version of krb5-workstation.  The defaut configuration and encryption is weak and this is only meant for development.

1. Build the Kerberos image locally.  This contains your kerberos database.
2. Configure the enviornment variable for the shared mount for your keytab/config files: KAFKA_SASL_SECRETS_DIR
3. docker-compose up to get the kerberos instance running
4. Run the generateKeytab.sh to generate the keytabs from the kerberos instance
5. Restart containers that failed because the keytabs weren't present

## Build Kerberos Image

```
docker build . -t kerberos:1.0
```

# kafkacat - utility, test simple consumer/producer locally
 
docker pull edenhill/kafkacat:1.6.0
 
List metadata from broker:
```
docker run -it --rm --network=host edenhill/kafkacat:1.6.0 -b localhost:9092 -L
```
 
Producer (winpty is only for windows):
```
docker run -it --rm --network=host edenhill/kafkacat:1.6.0 -b localhost:9092 -t topic1 -P
```
 
Consumer:
```
docker run -it --rm --network=host edenhill/kafkacat:1.6.0 -b localhost:9092 -t topic1 -C
