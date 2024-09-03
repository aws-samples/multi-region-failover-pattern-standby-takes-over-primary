#!/bin/bash

# Set the necessary variables
NAMESPACE="StopPattern"
METRIC_NAME="FailoverToSecondary"
DIMENSION_NAME="service"
SERVICE_NAME="stop-demo"
VALUE=1.0
TIMESTAMP=$(date +"%s")
AWS_REGION="us-west-2" 

# Build the metric data JSON
METRIC_DATA="{
  \"MetricName\": \"$METRIC_NAME\",
  \"Dimensions\": [
    {
      \"Name\": \"$DIMENSION_NAME\",
      \"Value\": \"$SERVICE_NAME\"
    }
  ],
  \"Value\": $VALUE,
  \"Timestamp\": $TIMESTAMP,
  \"Unit\": \"None\"
}"

# Put the metric data into CloudWatch
current_time=$(date +"%T")
echo "[$current_time] Sending CloudWatch metric ..."
aws cloudwatch put-metric-data --namespace "$NAMESPACE" --metric-data "$METRIC_DATA" --region "$AWS_REGION"
echo "[$current_time] Success."