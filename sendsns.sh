#!/bin/bash

function usage
{
    if [ -n "$1" ]; then echo $1; fi
    echo "Usage: $0 [-v] [-c configfile] [-m message]"
    exit 1
}

function debug_sns_send_command
{
    echo aws sns publish --topic-arn $AWS_TOPIC_ARN --message \"$MESSAGE\" --region $AWS_DEFAULT_REGION
}

function sns_send_command
{
    aws sns publish --topic-arn $AWS_TOPIC_ARN --message "$MESSAGE" --region $AWS_DEFAULT_REGION
}

while getopts ":c:m:v" opt; do
    case "$opt" in
        c) CONFIGFILE=$OPTARG ;;
        m) MESSAGE=$OPTARG ;;
        v) VERBOSE=1 ;;
        *) echo "Unknown param: $opt"; usage ;;
    esac
done

# Test config file
if [ -n "$CONFIGFILE" -a ! -f "$CONFIGFILE" ]; then echo "Configfile not found: $CONFIGFILE"; usage; fi

# Check config file if given
if [ -n "$CONFIGFILE" ]; then . "$CONFIGFILE";
# Default config file ~/.monit2snsrc if it exists
elif [ -f /etc/monit2snsrc ]; then . /etc/monit2snsrc;
fi

if [ -z "$MESSAGE" ]; then usage "Message not set, it must be provided on the command line."; fi;
if [ -z "$AWS_TOPIC_ARN" ]; then usage "Topic ARN not set, it must be provided"; fi;
if [ -z "$AWS_DEFAULT_REGION" ]; then usage "AWS Region not set, it must be provided"; fi;

sns_send_command