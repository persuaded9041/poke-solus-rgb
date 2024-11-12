roms := \
	pokesolusred.gbc \
	pokesolusblue.gbc \
	pokesolusgreen.gbc \
	pokesolusblue_debug.gbc
patches := \
	pokesolusred.patch \
	pokesolusblue.patch

rom_obj := \
	audio.o \
	home.o \
	main.o \
	maps.o \
	ram.o \
	text.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o

pokesolusred_obj        := $(rom_obj:.o=_red.o)
pokesolusblue_obj       := $(rom_obj:.o=_blue.o)
pokesolusgreen_obj      := $(rom_obj:.o=_green.o)
pokesolusblue_debug_obj := $(rom_obj:.o=_blue_debug.o)
pokesolusred_vc_obj     := $(rom_obj:.o=_red_vc.o)
pokesolusblue_vc_obj    := $(rom_obj:.o=_blue_vc.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all red blue green blue_debug clean tidy compare tools

all: $(roms)
red:        pokesolusred.gbc
blue:       pokesolusblue.gbc
green:      pokesolusgreen.gbc
blue_debug: pokesolusblue_debug.gbc
red_vc:     pokesolusred.patch
blue_vc:    pokesolusblue.patch

clean: tidy
	find gfx \
	     \( -iname '*.1bpp' \
	        -o -iname '*.2bpp' \
	        -o -iname '*.pic' \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(pokesolusred_obj) \
	      $(pokesolusblue_obj) \
		  $(pokesolusgreen_obj) \
	      $(pokesolusred_vc_obj) \
	      $(pokesolusblue_vc_obj) \
	      $(pokesolusblue_debug_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokesolusred_obj):        RGBASMFLAGS += -D _RED
$(pokesolusblue_obj):       RGBASMFLAGS += -D _BLUE
$(pokesolusgreen_obj):      RGBASMFLAGS += -D _GREEN
$(pokesolusblue_debug_obj): RGBASMFLAGS += -D _BLUE -D _DEBUG
$(pokesolusred_vc_obj):     RGBASMFLAGS += -D _RED -D _RED_VC
$(pokesolusblue_vc_obj):    RGBASMFLAGS += -D _BLUE -D _BLUE_VC

# Comment next line to disable running shoes
RGBASMFLAGS += -D _RUNSHOES

%.patch: vc/%.constants.sym %_vc.gbc %.gbc vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for objects (drop _red and _blue from asm file basenames)
$(foreach obj, $(pokesolusred_obj), $(eval $(call DEP,$(obj),$(obj:_red.o=.asm))))
$(foreach obj, $(pokesolusblue_obj), $(eval $(call DEP,$(obj),$(obj:_blue.o=.asm))))
$(foreach obj, $(pokesolusgreen_obj), $(eval $(call DEP,$(obj),$(obj:_green.o=.asm))))
$(foreach obj, $(pokesolusblue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_blue_debug.o=.asm))))
$(foreach obj, $(pokesolusred_vc_obj), $(eval $(call DEP,$(obj),$(obj:_red_vc.o=.asm))))
$(foreach obj, $(pokesolusblue_vc_obj), $(eval $(call DEP,$(obj),$(obj:_blue_vc.o=.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) $(preinclude_deps) | rgbdscheck.o
	$(RGBASM) $(RGBASMFLAGS) $< > $@

endif


%.asm: ;


pokesolusred_pad        = 0x00
pokesolusblue_pad       = 0x00
pokesolusgreen_pad      = 0x00
pokesolusred_vc_pad     = 0x00
pokesolusblue_vc_pad    = 0x00
pokesolusblue_debug_pad = 0xff

pokesolusred_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
pokesolusblue_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokesolusgreen_opt      = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON GREEN"
pokesolusblue_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
pokesolusred_vc_opt     = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
pokesolusblue_vc_opt    = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/move_anim_0.2bpp: tools/gfx += --trim-whitespace
gfx/battle/move_anim_1.2bpp: tools/gfx += --trim-whitespace

gfx/intro/blue_jigglypuff_1.2bpp: rgbgfx += -Z
gfx/intro/blue_jigglypuff_2.2bpp: rgbgfx += -Z
gfx/intro/blue_jigglypuff_3.2bpp: rgbgfx += -Z
gfx/intro/red_nidorino_1.2bpp: rgbgfx += -Z
gfx/intro/red_nidorino_2.2bpp: rgbgfx += -Z
gfx/intro/red_nidorino_3.2bpp: rgbgfx += -Z
gfx/intro/gengar.2bpp: rgbgfx += -Z
gfx/intro/gengar.2bpp: tools/gfx += --remove-duplicates --preserve=0x19,0x76

gfx/credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/green_slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@
