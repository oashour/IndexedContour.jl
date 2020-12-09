using Plots
using IndexedContour

x = collect(-4:0.01:3) # hide
y = collect(-5:0.01:5) # hide
z = [Float64((xi^2 + yi^2)) for xi in x, yi in y] # hide
w = [Float64((xi^2 - yi^2)) for xi in x, yi in y] # hide
p = plot([0], [0], lw = 0.001, linecolor=:white, label = "", title="Contours of x^2+y^2 colored by x^2-y^2")
pw = heatmap(x,y,w', title="x^2 - y^2")
display(pw)

for cl in levels(contours(x,y,z))
    lvl = level(cl) # the z-value of this contour level
    for line in lines(cl)
        xs, ys = coordinates(line) # coordinates of this line segment
        xi, yi, zi = indices(line)
        xss = x[xi]
        yss = y[yi]
        zss = w[zi]
        #plot!(p, xs, ys, label = "", line_z = w[zi], lw = 3)
        scatter!(p, xss, yss, label = "", markersize = 1.5, marker_z = zss, msw=0.0001)
        #plot!(p, xss, yss, label = "", linecolor = :red, lw=3)
    end
end
display(p)
