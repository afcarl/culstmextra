require 'nn' 
require 'cunn'
  
   local bs = math.random(1,4) * 4
   local from = math.random(1,32)
   local to = math.random(1,8) * 8
   local ki = math.random(3,15)
   local kj = math.random(3,15)
   local si = math.random(1,3)
   local sj = math.random(1,3)
   local outi = math.random(1,64)
   local outj = math.random(1,64)
   local padW = math.random(0,1)
   local padH = math.random(0,1)
   local ini = (outi-1)*si+ki-padW*2
   local inj = (outj-1)*sj+kj-padH*2

  local tm = {}
--   local title = string.format('SpatialConvolutionMM.forward %dx%dx%dx%d o %dx%d -> %dx%dx%dx%d [s: %dx%d] [p: %dx%d]',
--                               bs, from, inj, ini, kj, ki, bs, to, outj, outi, sj, si, padH, padW)
--   times[title] = tm

   local input = torch.randn(bs,from,inj,ini)
   local sconv = nn.SpatialConvolutionMM(from,to,ki,kj,si,sj,padW,padH)
   local groundtruth = sconv:forward(input)
   local a = torch.Timer()
   local nloop = 1

   --for i = 1,nloop do
      groundtruth = sconv:forward(input)
   --end
   tm.cpu = a:time().real

   input = input:cuda()
   local gconv = nn.SpatialConvolutionMM(from,to,ki,kj,si,sj,padW,padH):cuda()
   gconv.weight = sconv.weight:cuda()
   gconv.bias = sconv.bias:cuda()
   local rescuda = gconv:forward(input)
   a:reset()
   --for i = 1,nloop do
      rescuda = gconv:forward(input)
   --end
   cutorch.synchronize()
   tm.gpu = a:time().real

   local err = rescuda:float() --groundtruth
   
   err = (err - groundtruth:float())
 
   print (err:abs():max())
  
   print (groundtruth:size())
   print (rescuda:float():size())

   print (rescuda:float():max())
   print (groundtruth:max())
