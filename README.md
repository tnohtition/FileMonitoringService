# FileMonitoringService

# Workflow for API
It was described in the diagram also

# Information on quota service
The service flow should be as the diagram but I'd add some more details at the QuotaService so for the performance at the service so I suggest to use a 3rd lib that run in memory for tracking/verify the quota usage
I'd pick a GenServer backed by ets table in Elixir
There are 3 main tasks in the service so
1. Checking the quota exceeding
2. Insert quota usage
3. Periodically/Manually, maintain the ets table when a quota setup of a user changed
In additional we could persist a record to quota_usages table for tracking the usage of a user at the end of a day.

# File Upload
I also introduce a simple flow of a file validator
Basically, we have a interface contract that defined validate function
And also introduce a implementation of a ImageValidator that helps us to validate the image file
We may need to implement many validator depends on our system supports
