import subprocess

class Collector:
    def __init__(self, dir) -> None:
        self.dir = dir
        pass
    
    def start(self):
        enable_collection = ['sudo', 'camflow', '-a', 'true']
        enable_whole_prov =  ['sudo', 'camflow', '-e', 'true']
        result = subprocess.run(enable_collection)
        result = subprocess.run(enable_whole_prov)
        pass
    
    def stop(self):
        disable_collection = ['sudo', 'camflow', '-a', 'false']
        disable_whole_prov =  ['sudo', 'camflow', '-e', 'false']
        result = subprocess.run(disable_collection)
        result = subprocess.run(disable_whole_prov)
        pass
    
    def move_log(self):
        src_dir = '/tmp/audit.json'
        dst = self.dir
        cmd = ['mv', src_dir, dst]
        result = subprocess.run(cmd)
        pass