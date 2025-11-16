const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a1218", /* black   */
  [1] = "#2C6B49", /* red     */
  [2] = "#4C6644", /* green   */
  [3] = "#108C58", /* yellow  */
  [4] = "#199B5F", /* blue    */
  [5] = "#0BAD66", /* magenta */
  [6] = "#51A55F", /* cyan    */
  [7] = "#c1c3c5", /* white   */

  /* 8 bright colors */
  [8]  = "#59646d",  /* black   */
  [9]  = "#2C6B49",  /* red     */
  [10] = "#4C6644", /* green   */
  [11] = "#108C58", /* yellow  */
  [12] = "#199B5F", /* blue    */
  [13] = "#0BAD66", /* magenta */
  [14] = "#51A55F", /* cyan    */
  [15] = "#c1c3c5", /* white   */

  /* special colors */
  [256] = "#0a1218", /* background */
  [257] = "#c1c3c5", /* foreground */
  [258] = "#c1c3c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
