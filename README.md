monit2sns
=========

A simple script to send Monit alerts using AWS SNS.

By default, Monit only sends alert notifications via email. But we can also set [a hook to execute a script](https://mmonit.com/monit/documentation/monit.html#action). When executing the script, Monit sets a few environment variables about the alert.

This tiny script transforms those variables into a text message and pipes them to Telegram using a bash script for delivery.

This script is inspired by [Monit2Twilio](https://github.com/alexdunae/monit2twilio) and [monit2telegram](https://github.com/matriphe/monit2telegram)