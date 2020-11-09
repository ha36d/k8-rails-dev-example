# level 4

The application is now running in production withing a secure network, monitoring and logging are also implemented.
What could go wrong with the application, is there anything to check within the code of the application ?
Could we improve the security, performance, resilience and recovery from a disaster ?

- Specify here the list of things you would want to check / implement.

First the things that I did rapidly, and should be checked:
- Kibana+Elasticsearch communication
- I added the support  of minIO, but couldn't find something to add in the storage

Then, best practices:
- The database should be out of this game (even graceful shutdown, etc is not recommended for a db). If it is cloud, EC2 (+barman) or RDS should be used.
- We should use K8s secret. All the passwords are in the app, or chart, but should be migrated to k8s secrets.
- There was no security checks on the inputs (for example Post controller)
- Single redis is not recommended for k8s.s
-
