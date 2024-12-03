const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#351f19", /* black   */
  [1] = "#709793", /* red     */
  [2] = "#7DC1BD", /* green   */
  [3] = "#98A79F", /* yellow  */
  [4] = "#E0AA99", /* blue    */
  [5] = "#A0C8B8", /* magenta */
  [6] = "#ECDCA9", /* cyan    */
  [7] = "#ccc7c5", /* white   */

  /* 8 bright colors */
  [8]  = "#7d6b66",  /* black   */
  [9]  = "#709793",  /* red     */
  [10] = "#7DC1BD", /* green   */
  [11] = "#98A79F", /* yellow  */
  [12] = "#E0AA99", /* blue    */
  [13] = "#A0C8B8", /* magenta */
  [14] = "#ECDCA9", /* cyan    */
  [15] = "#ccc7c5", /* white   */

  /* special colors */
  [256] = "#351f19", /* background */
  [257] = "#ccc7c5", /* foreground */
  [258] = "#ccc7c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
