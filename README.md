Kubernetes Spark-commit
=======================

Description
-----------

The target of this repository is to give a try to the **spark-submit** way of launching spark jobs on a Kubernetes cluster

Requirements
------------

- Running Kubernetes cluster ( minikube, docker-desktop, etc. )
Example:
    ```
    minikube start --cpus=4 --memory=6g --driver=hyperkit --nodes=2
    ```

Steps
-----

### Apply manifest
```
kubectl apply -f k8s/examplePi.yml
```

### Check running containers
```
kubectl get pods
```

### Check driver pod logs
```
kubectl logs -f pods/spark-pi-1611178703250-driver
```
```
21/01/20 21:38:33 INFO TaskSchedulerImpl: Adding task set 0.0 with 2 tasks
21/01/20 21:38:33 INFO TaskSetManager: Starting task 0.0 in stage 0.0 (TID 0, 10.1.0.52, executor 1, partition 0, PROCESS_LOCAL, 7885 bytes)
21/01/20 21:38:33 INFO BlockManagerInfo: Added broadcast_0_piece0 in memory on 10.1.0.52:37999 (size: 1381.0 B, free: 413.9 MB)
21/01/20 21:38:33 INFO TaskSetManager: Starting task 1.0 in stage 0.0 (TID 1, 10.1.0.52, executor 1, partition 1, PROCESS_LOCAL, 7885 bytes)
21/01/20 21:38:33 INFO TaskSetManager: Finished task 0.0 in stage 0.0 (TID 0) in 475 ms on 10.1.0.52 (executor 1) (1/2)
21/01/20 21:38:33 INFO TaskSetManager: Finished task 1.0 in stage 0.0 (TID 1) in 21 ms on 10.1.0.52 (executor 1) (2/2)
21/01/20 21:38:33 INFO TaskSchedulerImpl: Removed TaskSet 0.0, whose tasks have all completed, from pool 
21/01/20 21:38:33 INFO DAGScheduler: ResultStage 0 (reduce at SparkPi.scala:38) finished in 0.695 s
21/01/20 21:38:33 INFO DAGScheduler: Job 0 finished: reduce at SparkPi.scala:38, took 0.771199 s
Pi is roughly 3.14159570797854
21/01/20 21:38:33 INFO SparkUI: Stopped Spark web UI at http://spark-pi-1611178703250-driver-svc.default.svc:4040
21/01/20 21:38:33 INFO KubernetesClusterSchedulerBackend: Shutting down all executors
21/01/20 21:38:33 INFO KubernetesClusterSchedulerBackend$KubernetesDriverEndpoint: Asking each executor to shut down
21/01/20 21:38:33 WARN ExecutorPodsWatchSnapshotSource: Kubernetes client has been closed (this is expected if the application is shutting down.)
21/01/20 21:38:33 INFO MapOutputTrackerMasterEndpoint: MapOutputTrackerMasterEndpoint stopped!
21/01/20 21:38:33 INFO MemoryStore: MemoryStore cleared
21/01/20 21:38:33 INFO BlockManager: BlockManager stopped
21/01/20 21:38:33 INFO BlockManagerMaster: BlockManagerMaster stopped
21/01/20 21:38:33 INFO OutputCommitCoordinator$OutputCommitCoordinatorEndpoint: OutputCommitCoordinator stopped!
21/01/20 21:38:33 INFO SparkContext: Successfully stopped SparkContext
21/01/20 21:38:33 INFO ShutdownHookManager: Shutdown hook called
21/01/20 21:38:33 INFO ShutdownHookManager: Deleting directory /tmp/spark-ca98f701-e36d-4077-ab46-6645c37442aa
21/01/20 21:38:33 INFO ShutdownHookManager: Deleting directory /var/data/spark-1b835987-5b66-4cff-8750-2c78de9d89bf/spark-5926d990-c9a1-47f5-932c-917671f18fde
```

### Clean
```
kubectl delete -f k8s/examplePi.yml
````
