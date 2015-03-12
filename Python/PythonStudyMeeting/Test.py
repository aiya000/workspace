
a = 10
def hoge():
    global a
    a = 20
    print a
hoge()
print a
