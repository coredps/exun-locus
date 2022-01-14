from PIL import Image

ans = "file_path,length\n"

for k in range(1, 501):
    im = Image.open(f"lines_images/line_{k}.png")
    pixels = list(im.getdata())
    w, h = im.size
    pixels = [pixels[i * w:(i + 1) * w] for i in range(h)]
    dist = sum(pixels[i].count((255, 255, 255)) for i in range(h))
    ans += f"/line_{k}.png,{dist}\n"    
with open("ans.csv", "w") as f:
    f.write(ans)


