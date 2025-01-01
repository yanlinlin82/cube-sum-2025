# plot.R
#install.packages("qrcode")
library(qrcode)

png("plot.png", width = 600, height = 600)

par(mar = c(0, 0, 0, 0),
    oma = c(0, 0, 0, 0),
    mfrow = c(1, 1),
    family = "serif",
    cex = 6,
    adj = 0,
    bg = "lightblue",
    col = "black",
    family = "serif")

plot(1, type = "n",
     xlim = c(0, 2.5), ylim = c(0, 2.5),
     xlab = "", ylab = "",
     xaxt = "n", yaxt = "n",
     xaxs = "i", yaxs = "i")

n_colors = 100
colors = colorRampPalette(c("lightblue", "cyan"))(n_colors)
y_steps = seq(0, 2.5, length.out = n_colors + 1)
for(i in 1:n_colors) {
    rect(0, y_steps[i], 2.5, y_steps[i + 1], 
         col = colors[i], border = NA)
}

e1 = expression(1^3 + 2^3 + 3^3)
e2 = expression(+ 4^3 + 5^3 + 6^3)
e3 = expression(+ 7^3 + 8^3 + 9^3)
result = eval(e1) + eval(e2) + eval(e3)
e4 = paste("=", result)

text(0.5, 2, e1)
text(0.3, 1.5, e2)
text(0.3, 1, e3)
text(0.3, 0.5, e4, col = "brown")

url <- "https://github.com/yanlinlin82/cube-sum-2025"
qr <- qr_code(url)

image(1.75 + (4:32)/50, 0.05 + (4:32)/50,
      qr[4:32, 32:4],
      col = c("white", "black"), add = TRUE)

dev.off()
