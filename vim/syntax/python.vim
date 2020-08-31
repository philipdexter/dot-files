set commentstring=#\ %s

set makeprg=pylint\ --reports=n\ --output-format=parseable\ dlearn
set errorformat=%f:%l:\ %m
