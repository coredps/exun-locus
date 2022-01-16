from PIL import Image
from math import sqrt, ceil

ans = "file_path,length\n"

for k in range(1, 501):
    im = Image.open(f"lines_images/line_{k}.png")
    pixels = list(im.getdata())
    w, h = im.size
    pixels = [pixels[i * w:(i + 1) * w] for i in range(h)]
    first = last = (-1,-1)
        
    for i in range(h):
        for j in range(w):
            if pixels[i][j] == (255, 255, 255):
                if first == (-1,-1):
                    first = (i, j)
                last = (i, j)
    if first[1] > last[1]:
        for i in range(h):
            for j in range(w-1,-1,-1):
                if pixels[i][j] == (255, 255, 255):
                    if first == (-1,-1):
                        first = (i, j)
                    last = (i, j)
    first = (first[1], first[0])
    last = (last[1], last[0])
    
    dist = sqrt((last[1] - first[1])**2 + (last[0] - first[0])**2)

    dist = int(dist)

    ans += f"/line_{k}.png,{dist}\n"    
    print(k)

with open("ans.csv", "w") as f:
    f.write(ans)


