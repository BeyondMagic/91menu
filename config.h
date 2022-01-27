/* See LICENCE file for copyright and licence details */

static char *lastselfile = "/tmp/91menu";	/* file where the last selected item will be written */

/* appearance */
static unsigned int minwidth = 20;		/* minimal menu width */
static unsigned int borderpx = 8;		/* window border width */
static unsigned int gappx    = 4;		/* left and right side gaps */
static unsigned int padpx    = 2;		/* padding between menu lines */
static unsigned int textpos  = LEFT;	/* horizontal text position LEFT/CENTER/RIGTH */
static unsigned int houtgap   = 10; /* Gap between monitor horizontal borders and the window */
static unsigned int voutgap   = 35; /* Gap between monitor vertical borders and the window */

/* mouse */
static unsigned int buttons[]	= { 1, 0, 1 };		/* mouse buttons, 0 untracked, 1: selection only */
static unsigned int grabmouse   = 1;				/* 0 = ignore mouse clicks outside of the window */
static unsigned int buttonevent	= ButtonRelease;	/* mouse event to select an item */

/* geometry see XParseGeometry(3), NULL = no geometry */
static char *geometry = NULL;

/* font */
static const char *fontname = "JetBrainsMono Nerd Font:style=Regular:pixelsize=14:antialias=true:hinting=true";

/* color scheme */
static const char *colornames[COLORNB] = {
	[FG] = "#0A0A0B",
	[BG] = "#0A0A0B",
	[BD] = "#0A0A0B",
	[NV] = "#091050",
	[SL] = "#fff000",
};
