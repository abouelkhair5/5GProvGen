import subprocess
from kubernetes import client, config
import yaml

class BenignActivity:
    def __init__(self):
        self.config_file = yaml.safe_load("open5gs-k8s/open5gs/kustomization.yaml") 
        config.load_kube_config()
        self.apps_api = client.AppsV1Api()
     
    def start(self):
        self.apps_api.create_namespaced_deployment(self.config_file, namespace='open5gs')
        
    
    def stop(self):
        self.apps_api.delete_namespaced_deployment(self.config_file, namespace='open5gs')