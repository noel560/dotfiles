const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#121a1b", /* black   */
  [1] = "#3D6446", /* red     */
  [2] = "#4C4F4F", /* green   */
  [3] = "#616561", /* yellow  */
  [4] = "#8C6D67", /* blue    */
  [5] = "#708A67", /* magenta */
  [6] = "#878C78", /* cyan    */
  [7] = "#c3c5c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5c7171",  /* black   */
  [9]  = "#3D6446",  /* red     */
  [10] = "#4C4F4F", /* green   */
  [11] = "#616561", /* yellow  */
  [12] = "#8C6D67", /* blue    */
  [13] = "#708A67", /* magenta */
  [14] = "#878C78", /* cyan    */
  [15] = "#c3c5c6", /* white   */

  /* special colors */
  [256] = "#121a1b", /* background */
  [257] = "#c3c5c6", /* foreground */
  [258] = "#c3c5c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
