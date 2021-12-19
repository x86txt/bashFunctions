# bashFunctions
Handy bash functions I've run across over the years

### logging
```bash
log_this(){ #Streamline logging output
echo `date +"%d-%m-%Y %H:%M:%S"` " - " "${@}"
}
```
