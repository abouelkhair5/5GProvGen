This code is adapted from the authors repo: https://github.com/DART-Laboratory/Flash-IDS.git

# FLASH 

Welcome to the FLASH repository. Here, we offer the implementation details of the method introduced in our research paper titled "_FLASH: A Comprehensive Approach to Intrusion Detection via Provenance Graph Representation Learning_".

## Prerequisites
To run Flash you need to install Jupyter Notebook. More detailed instructions on installing and running Jupyter Notebooks can be found at this [Link](https://jupyter.org/install).

## Installation
We have provided a requirements.txt file detailing the specific dependency versions. Use the following command to install the required libraries.
```bash
pip install -r requirements.txt
```

## Datasets
We evaluate Flash on our 5G dataset. More can be found in 5GProvGen Readme. 

## Code Structure
The parsers for each dataset are integrated within their respective Jupyter Notebooks. For every dataset, there is a dedicated Notebook designed for evaluation. These Notebooks handle the downloading, parsing, and executing evaluations on their respective datasets. We have provided pre-trained model weights to run evaluations. Each notebook has parameters to control different components of the system. More detailed instructions are given in the Notebooks. After running these Notebooks, the results will be displayed at the end of each execution.

