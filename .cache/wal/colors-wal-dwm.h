static const char norm_fg[] = "#ccc7c5";
static const char norm_bg[] = "#351f19";
static const char norm_border[] = "#7d6b66";

static const char sel_fg[] = "#ccc7c5";
static const char sel_bg[] = "#7DC1BD";
static const char sel_border[] = "#ccc7c5";

static const char urg_fg[] = "#ccc7c5";
static const char urg_bg[] = "#709793";
static const char urg_border[] = "#709793";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
