/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x0a1218ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc1c3c5ff, 0x0a1218ff, 0x59646dff },
	[SchemeSel]  = { 0xc1c3c5ff, 0x4C6644ff, 0x2C6B49ff },
	[SchemeUrg]  = { 0xc1c3c5ff, 0x2C6B49ff, 0x4C6644ff },
};
