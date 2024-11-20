CC=g++
CFLAGS=-Wall -Wextra

OBJDIR=objs
OBJS=main.o
_OBJS_PATH=$(addprefix $(OBJDIR)/, $(OBJS))

.PHONY=build clean

build: $(OBJDIR) $(_OBJS_PATH)
	$(CC) $(_OBJS_PATH) -o zrpioc $(LDFLAGS)

clean:
	rm $(OBJDIR)/*
	rm zrpioc

$(OBJDIR)/%.o: src/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)