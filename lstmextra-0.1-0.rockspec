package = "lstmextra"
version = "0.1-0"

source = {
   url = "git://github.com/ankurhanda/lstmextra",
   tag = "master"
}

description = {
   summary = "Spatial Full convolutional no bias ",
   detailed = [[
   Spatial Full convolutional no bias
   ]],
   homepage = "https://github.com/ankurhanda/lstmextra",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "xlua >= 1.0",
   "cutorch"
}

build = {
   type = "command",
   build_command = [[
   		 cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)   ]],
   install_command = [[cd build && $(MAKE) install]]
}
