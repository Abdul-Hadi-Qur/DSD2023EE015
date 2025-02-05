
# Lab 1

# 1.1

class node():
    def __init__(self,i,n):
        self.item = i
        self.next = n
    
class SLList():
    def __init__(self):
        self.sentinel = node(63,None)
        
L = SLList()

# 1.2

class node():
    def __init__(self,i,n):
        self.item = i
        self.next = n
    
class SLList():
    def __init__(self):
        self.sentinel = node(63,None)
    
    def AddFirst(self,x):
        self.sentinel = node(x,self.sentinel)
        
L = SLList()
L.AddFirst(5)
L.AddFirst(10)

# 1.3

class node():
    def __init__(self,i,n):
        self.item = i
        self.next = n
    
class SLList():
    def __init__(self):
        self.sentinel = node(63,None)
    
    def AddFirst(self,x):
        self.sentinel = node(x,self.sentinel)
        
L = SLList()
L.AddFirst(5)
L.AddFirst(10)
L.AddLast(15)


