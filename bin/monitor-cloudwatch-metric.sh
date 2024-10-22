#!/bin/bash

AWS_REGION="us-west-2"  # Replace with your desired region
ALARM_NAME="your-alarm-name-here"  # Replace with your alarm name

while true; do
  current_time=$(date +"%T")
  ALARM_DATA=$(aws cloudwatch describe-alarms \
    --region $AWS_REGION \
    --alarm-names "$ALARM_NAME" \
    --output json)
  ALARM_STATE=$(echo $ALARM_DATA | jq -r '.MetricAlarms[0].StateValue')
  echo "[$current_time] alarm status: $ALARM_STATE"
  sleep 2
done


