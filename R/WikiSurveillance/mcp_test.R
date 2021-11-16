library(mcp)

set.seed(42)
df = data.frame(
  x = 1:100,
  y = c(rnorm(30,2),rnorm(40,0),rnorm(30,1))
)

plot(df)
abline(v=c(30,70), col="red")

model = list(y~1, 1~1, 1~1)
fit_mcp = mcp(model, data=df, par_x = "x")

plot(fit_mcp)

### 

df = data.frame(
  x = 1:100,
  y = c(1.1*1:50+rnorm(50,0,10)+10, -.3*1:50+rnorm(50,0,10)+50)
)

plot(df)

models <- list( y~1+x, ~1+x)
fit_mcp <- mcp(models, data = df, par_x = "x")
plot(fit_mcp)

fit_mcp

