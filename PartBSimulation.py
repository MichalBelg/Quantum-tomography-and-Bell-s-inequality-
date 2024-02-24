import random
def generate_random_bits(length):
    return ''.join([random.choice('01') for _ in range(length)])
for num in [100,500,1000]:
    bitList = generate_random_bits(num)
    bitList = [int(i) for i in bitList]

    outputDict = ["VV-VV","HH-HH","HV-HV","VH-VH"]
    output = [0,0]
    for bit in bitList:
        #if the bit is 0 we are sending Vertically polarized light, marked as 0.
        if bit == 0:
            output[0] += 1
        else:
            output[1] += 1
    N = sum(output)
    densityMatrix = [float(output[0])/N,float(output[1])/N]
    print(f"We measured {outputDict[0]} with a probability of {densityMatrix[0]} and measured {outputDict[1]} with a probability of {densityMatrix[1]}")
    print(output)
#Convert out to a list of ALICE H,V And BOB H,V