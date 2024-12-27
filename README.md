# KubeDiagrams

Generate Kubernetes architecture diagrams from Kubernetes manifest files.

There are several tools to generate Kubernetes architecture diagrams (see **[here](https://github.com/philippemerle/Awesome-Kubernetes-Architecture-Diagrams)**).
The main originality of **KubeDiagrams** is its **[configurability](bin/kube-diagrams.yaml)** allowing for instance to deal with custom Kubernetes resources.

## Prerequisites

* [Python 3.x](https://www.python.org/)
* [Diagrams](https://diagrams.mingrammer.com/)
  ```sh
  $ pip install diagrams
  ```
* `dot` command ([Graphviz](https://www.graphviz.org/))

## Usage

```sh
$ kube-diagrams -h
usage: kube-diagrams [-h] [-o OUTPUT] [-f FORMAT] [-v] filename

Generate Kubernetes architecture diagrams from Kubernetes manifest files

positional arguments:
  filename              the Kubernetes manifest filename to process

options:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        output diagram filename
  -f FORMAT, --format FORMAT
                        output format, allowed formats are png (default), jpg, svg, pdf, and dot
  -c CONFIG, --config CONFIG
                        custom kube-diagrams configuration file
  -v, --verbose         verbosity, set to false by default
```

## Examples

* [official Kubernetes Cassandra example](examples/cassandra/)
* [minikube architecture diagrams](examples/minikube/)

## License

This project is licensed under the GPL-3.0 license - see the [LICENSE](LICENSE) file for details.

## Todo List

* Add more examples
* Add missed Kubernetes resource types: NetworkPolicy and Endpoint
* Make `nodes/*/edges` more declarative
* Add diagram node icon for IngressClass
