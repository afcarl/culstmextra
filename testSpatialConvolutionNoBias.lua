require 'nn'
model = nn.Sequential()
model:add(nn.SpatialConvolution(2,3,3,3,1,1,1,1))
--model:cuda()
