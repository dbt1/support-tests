DEPENDS += "libpthread-stubs"

# supplemet for CXXFLAGS
CXXFLAGS += " -ggdb -std=c++11"

# supplement for LDFLAGS
LDFLAGS += " -lpthread"

