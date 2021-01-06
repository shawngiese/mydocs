import svgwrite
dwg = svgwrite.Drawing('test.svg', (200, 200), debug=True)
# use the hyperlink element
link = dwg.add(dwg.a('http://www.w3.org'))
link.add(dwg.ellipse(center=(100, 50), r=(50, 25), fill='red'))

print(dwg.tostring())