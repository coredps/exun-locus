from PIL import Image
from os import listdir

k = 1
ans = "file_path,2D_Shape,Area\n"
for imgname in listdir('shape images'):
    im = Image.open(f"shape images/{imgname}")
    pixels = list(im.getdata())
    w, h = im.size
    pixels = [pixels[i * w:(i + 1) * w] for i in range(h)]

        
    c = 0

    for i in range(h):
        for j in range(w):
            if pixels[i][j] == (255, 255, 255):
                try:
                    if pixels[i-1][j-1] == (255, 255, 255): c += 1
                    if pixels[i+1][j+1] == (255, 255, 255): c += 1
                    if pixels[i+1][j-1] == (255, 255, 255): c += 1
                    if pixels[i-1][j+1] == (255, 255, 255): c += 1
                except:
                    pass
    
    if c == 8: 
        shape = 0                              
        tl = br = (-1, -1)
        for i in range(h):
            for j in range(w):
                if pixels[i][j] == (255, 255, 255):
                    if tl == (-1, -1):
                        tl = (i, j)
                    br = (i, j)
        tl = (tl[1], tl[0])
        br = (br[1], br[0])

        width = br[0] - tl[0]
        height = br[1] - tl[1]

        area = width * height
    else:
        shape = 1
        area = 0
        for i in range(h):
            first, last = -1, -1
            for j in range(w):
                if pixels[i][j] == (255, 255, 255):
                    if first == -1:
                        first = j
                    last = j
            if first != -1: area += last - first - 1
    
    ans += f"/{imgname},{shape},{area}\n"
    print(k)
    k+=1

with open("ans.csv", "w") as f:
    f.write(ans)
    