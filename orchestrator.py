import time
import collector
import benign_activity_generator
import malicious_activity.activity_generator

class Orchestrator:
    def __init__(self, log_dir, duration):
        self.log_dir = log_dir
        self.duration = duration
        self.duration_seconds = self.duraction * 3600 
        self.start_time = 0
        self.collector = collector.Collector(self.log_dir)
        self.benign_activity = benign_activity_generator.BenignActivity()
        self.malicious_activity = malicious_activity.activity_generator.ActivityGenerator()
        
    def run(self):
        self.start_time = time.time()
        with open(f'{self.log_dir}/timestamps.txt', 'w+') as log:
            log.write(f"Dataset generation started at: {self.start_time}")
        self.collector.start()
        log.write(f"Collection started at: {time.time()}")
        self.benign_activity.start()
        log.write(f"Benign Activity started at: {time.time()}")
        cur_time = time.time()
        while cur_time < self.start_time + self.duration_seconds:
            time.sleep(1800)
            cur_time = time.time()
            