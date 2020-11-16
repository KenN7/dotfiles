In order for jack to work, add this to /etc/security/limits.conf 

```
@audio          -       rtprio          99
```

and add yourself to the audio group

```
usermod -a -G audio yourUserID
```
