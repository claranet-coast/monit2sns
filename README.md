monit2sns
=========

A simple script to send Monit alerts using AWS SNS.

By default, Monit only sends alert notifications via email. But we can also set [a hook to execute a script](https://mmonit.com/monit/documentation/monit.html#action). When executing the script, Monit sets a few environment variables about the alert.

This tiny script transforms those variables into a text message and pipes them to AWS SNS.

This script is inspired by [Monit2Twilio](https://github.com/alexdunae/monit2twilio) and [monit2telegram](https://github.com/matriphe/monit2telegram)

## How to install

1. Edit _monit2snsrc_ configuring region and topic ARN
2. `chmod +x sendsns.sh`
3. Copy _sendsns.sh_ to /usr/local/bin: `cp sendsns.sh /usr/local/bin`
4. Optionally copy config file to /etc: `cp monit2snsrc /etc/monit2snsrc`

## How to execute script

After installing the script:
```sh
sendsns.sh -m "message to send to topic ARN" -c monit2snsrc
```

If the config file is copied to /etc/monit2snsrc:
```sh
sendsns.sh -m "message to send to topic ARN" 
```