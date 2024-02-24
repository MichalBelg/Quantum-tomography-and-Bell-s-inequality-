import random

def generate_random_bits(length):
    return ''.join([random.choice('01') for _ in range(length)])

for i in [100,500,1000]:
    random_bits = generate_random_bits(i)
    print(random_bits)
