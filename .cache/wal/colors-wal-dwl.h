/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x121a1bff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc3c5c6ff, 0x121a1bff, 0x5c7171ff },
	[SchemeSel]  = { 0xc3c5c6ff, 0x4C4F4Fff, 0x3D6446ff },
	[SchemeUrg]  = { 0xc3c5c6ff, 0x3D6446ff, 0x4C4F4Fff },
};
