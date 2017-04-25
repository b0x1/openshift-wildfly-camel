# Apache Camel on Red Hat Wildfly on OpenShift

Instruction:

1. Clone this repository
2. Run Docker build (`docker build -t camelshift:0.0.1 .`)
3. Run Docker container (`docker run -p 8080:8080 camelshift:0.0.1`)
4. Follow the instructions on 
	1. https://github.com/wildfly-extras/wildfly-camel-examples/blob/master/camel-cdi/README.md
	2. https://github.com/wildfly-extras/wildfly-camel-examples/blob/master/camel-cxf-jaxrs/README.md
	3. https://github.com/wildfly-extras/wildfly-camel-examples/tree/master/camel-cxf-jaxws
  
