# flagged row processing, no filtering applied__spec_ids{summary_table$flagged_row_processing}

    Code
      options(width = 250)
      print(pfr1, n = 999)
    Output
      # A tibble: 132 x 10
          USUBJID     VISIT           PARAMCD ADT        AVISIT    AVAL ANL01FL LVOTFL MINTRFL MAXTRFL
          <fct>       <fct>           <fct>   <date>     <fct>    <dbl> <fct>   <chr>  <chr>   <chr>  
        1 01-701-1015 SCREENING 1     ALKPH   2013-12-26 Baseline 34    <NA>    <NA>   <NA>    <NA>   
        2 01-701-1015 WEEK 2          ALKPH   2014-01-16 Week 2   50    Y       <NA>   <NA>    Y      
        3 01-701-1015 WEEK 4          ALKPH   2014-01-30 Week 4   41    Y       <NA>   Y       <NA>   
        4 01-701-1015 WEEK 6          ALKPH   2014-02-12 Week 6   43    Y       Y      <NA>    <NA>   
        5 01-701-1015 SCREENING 1     ALT     2013-12-26 Baseline 27    <NA>    <NA>   <NA>    <NA>   
        6 01-701-1015 WEEK 2          ALT     2014-01-16 Week 2   41    Y       <NA>   <NA>    Y      
        7 01-701-1015 WEEK 4          ALT     2014-01-30 Week 4   18    Y       <NA>   Y       <NA>   
        8 01-701-1015 WEEK 6          ALT     2014-02-12 Week 6   26    Y       Y      <NA>    <NA>   
        9 01-701-1015 SCREENING 1     AST     2013-12-26 Baseline 40    <NA>    <NA>   <NA>    <NA>   
       10 01-701-1015 WEEK 2          AST     2014-01-16 Week 2   33    Y       <NA>   <NA>    Y      
       11 01-701-1015 WEEK 4          AST     2014-01-30 Week 4   21    Y       <NA>   Y       <NA>   
       12 01-701-1015 WEEK 6          AST     2014-02-12 Week 6   26    Y       Y      <NA>    <NA>   
       13 01-701-1015 SCREENING 1     BILI    2013-12-26 Baseline 10.3  <NA>    <NA>   <NA>    <NA>   
       14 01-701-1015 WEEK 2          BILI    2014-01-16 Week 2    8.55 Y       <NA>   <NA>    Y      
       15 01-701-1015 WEEK 4          BILI    2014-01-30 Week 4    6.84 Y       <NA>   <NA>    <NA>   
       16 01-701-1015 WEEK 6          BILI    2014-02-12 Week 6    5.13 Y       Y      Y       <NA>   
       17 01-701-1023 SCREENING 1     ALKPH   2012-07-22 Baseline 98    <NA>    <NA>   <NA>    <NA>   
       18 01-701-1023 WEEK 2          ALKPH   2012-08-27 Week 2   90    Y       Y      Y       Y      
       19 01-701-1023 WEEK 4          ALKPH   2012-09-02 Week 4   99    <NA>    <NA>   <NA>    <NA>   
       20 01-701-1023 SCREENING 1     ALT     2012-07-22 Baseline 23    <NA>    <NA>   <NA>    <NA>   
       21 01-701-1023 WEEK 2          ALT     2012-08-27 Week 2   30    Y       Y      Y       Y      
       22 01-701-1023 WEEK 4          ALT     2012-09-02 Week 4   38    <NA>    <NA>   <NA>    <NA>   
       23 01-701-1023 SCREENING 1     AST     2012-07-22 Baseline 21    <NA>    <NA>   <NA>    <NA>   
       24 01-701-1023 WEEK 2          AST     2012-08-27 Week 2   25    Y       Y      Y       Y      
       25 01-701-1023 WEEK 4          AST     2012-09-02 Week 4   30    <NA>    <NA>   <NA>    <NA>   
       26 01-701-1023 SCREENING 1     BILI    2012-07-22 Baseline 12.0  <NA>    <NA>   <NA>    <NA>   
       27 01-701-1023 WEEK 2          BILI    2012-08-27 Week 2    6.84 Y       Y      Y       Y      
       28 01-701-1023 WEEK 4          BILI    2012-09-02 Week 4    8.55 <NA>    <NA>   <NA>    <NA>   
       29 01-701-1028 SCREENING 1     ALKPH   2013-07-11 Baseline 44    <NA>    <NA>   <NA>    <NA>   
       30 01-701-1028 WEEK 2          ALKPH   2013-08-01 Week 2   46    Y       <NA>   <NA>    Y      
       31 01-701-1028 WEEK 4          ALKPH   2013-08-14 Week 4   38    Y       <NA>   Y       <NA>   
       32 01-701-1028 WEEK 6          ALKPH   2013-08-29 Week 6   40    Y       Y      <NA>    <NA>   
       33 01-701-1028 SCREENING 1     ALT     2013-07-11 Baseline 26    <NA>    <NA>   <NA>    <NA>   
       34 01-701-1028 WEEK 2          ALT     2013-08-01 Week 2   30    Y       <NA>   <NA>    <NA>   
       35 01-701-1028 WEEK 4          ALT     2013-08-14 Week 4   29    Y       <NA>   Y       <NA>   
       36 01-701-1028 WEEK 6          ALT     2013-08-29 Week 6   32    Y       Y      <NA>    Y      
       37 01-701-1028 SCREENING 1     AST     2013-07-11 Baseline 24    <NA>    <NA>   <NA>    <NA>   
       38 01-701-1028 WEEK 2          AST     2013-08-01 Week 2   23    Y       <NA>   Y       <NA>   
       39 01-701-1028 WEEK 4          AST     2013-08-14 Week 4   24    Y       <NA>   <NA>    <NA>   
       40 01-701-1028 WEEK 6          AST     2013-08-29 Week 6   26    Y       Y      <NA>    Y      
       41 01-701-1028 SCREENING 1     BILI    2013-07-11 Baseline 18.8  <NA>    <NA>   <NA>    <NA>   
       42 01-701-1028 WEEK 2          BILI    2013-08-01 Week 2   12.0  Y       <NA>   Y       <NA>   
       43 01-701-1028 WEEK 4          BILI    2013-08-14 Week 4   13.7  Y       <NA>   <NA>    Y      
       44 01-701-1028 WEEK 6          BILI    2013-08-29 Week 6   12.0  Y       Y      <NA>    <NA>   
       45 01-701-1034 SCREENING 1     ALKPH   2014-06-24 Baseline 41    <NA>    <NA>   <NA>    <NA>   
       46 01-701-1034 WEEK 2          ALKPH   2014-07-15 Week 2   34    Y       <NA>   <NA>    <NA>   
       47 01-701-1034 WEEK 4          ALKPH   2014-07-29 Week 4   36    Y       <NA>   <NA>    Y      
       48 01-701-1034 WEEK 6          ALKPH   2014-08-11 Week 6   33    Y       Y      Y       <NA>   
       49 01-701-1034 SCREENING 1     ALT     2014-06-24 Baseline 15    <NA>    <NA>   <NA>    <NA>   
       50 01-701-1034 WEEK 2          ALT     2014-07-15 Week 2   19    Y       <NA>   <NA>    <NA>   
       51 01-701-1034 WEEK 4          ALT     2014-07-29 Week 4   21    Y       <NA>   <NA>    Y      
       52 01-701-1034 WEEK 6          ALT     2014-08-11 Week 6   15    Y       Y      Y       <NA>   
       53 01-701-1034 SCREENING 1     AST     2014-06-24 Baseline 23    <NA>    <NA>   <NA>    <NA>   
       54 01-701-1034 WEEK 2          AST     2014-07-15 Week 2   23    Y       <NA>   <NA>    <NA>   
       55 01-701-1034 WEEK 4          AST     2014-07-29 Week 4   25    Y       <NA>   <NA>    Y      
       56 01-701-1034 WEEK 6          AST     2014-08-11 Week 6   19    Y       Y      Y       <NA>   
       57 01-701-1034 SCREENING 1     BILI    2014-06-24 Baseline 10.3  <NA>    <NA>   <NA>    <NA>   
       58 01-701-1034 WEEK 2          BILI    2014-07-15 Week 2    6.84 Y       <NA>   Y       Y      
       59 01-701-1034 WEEK 4          BILI    2014-07-29 Week 4    6.84 Y       <NA>   <NA>    <NA>   
       60 01-701-1034 WEEK 6          BILI    2014-08-11 Week 6    6.84 Y       Y      <NA>    <NA>   
       61 01-701-1047 SCREENING 1     ALKPH   2013-01-22 Baseline 78    <NA>    <NA>   <NA>    <NA>   
       62 01-701-1047 WEEK 2          ALKPH   2013-02-25 Week 2   67    Y       Y      Y       Y      
       63 01-701-1047 WEEK 4          ALKPH   2013-03-10 Week 4   71    <NA>    <NA>   <NA>    <NA>   
       64 01-701-1047 SCREENING 1     ALT     2013-01-22 Baseline 22    <NA>    <NA>   <NA>    <NA>   
       65 01-701-1047 WEEK 2          ALT     2013-02-25 Week 2   16    Y       Y      Y       Y      
       66 01-701-1047 WEEK 4          ALT     2013-03-10 Week 4   20    <NA>    <NA>   <NA>    <NA>   
       67 01-701-1047 SCREENING 1     AST     2013-01-22 Baseline 25    <NA>    <NA>   <NA>    <NA>   
       68 01-701-1047 WEEK 2          AST     2013-02-25 Week 2   21    Y       Y      Y       Y      
       69 01-701-1047 WEEK 4          AST     2013-03-10 Week 4   24    <NA>    <NA>   <NA>    <NA>   
       70 01-701-1047 SCREENING 1     BILI    2013-01-22 Baseline  6.84 <NA>    <NA>   <NA>    <NA>   
       71 01-701-1047 WEEK 2          BILI    2013-02-25 Week 2    8.55 Y       Y      Y       Y      
       72 01-701-1047 WEEK 4          BILI    2013-03-10 Week 4    6.84 <NA>    <NA>   <NA>    <NA>   
       73 01-701-1015 MIN ON TRT      ALKPH   2014-01-30 Week 4   41    Y       <NA>   Y       <NA>   
       74 01-701-1015 MIN ON TRT      ALT     2014-01-30 Week 4   18    Y       <NA>   Y       <NA>   
       75 01-701-1015 MIN ON TRT      AST     2014-01-30 Week 4   21    Y       <NA>   Y       <NA>   
       76 01-701-1015 MIN ON TRT      BILI    2014-02-12 Week 6    5.13 Y       Y      Y       <NA>   
       77 01-701-1023 MIN ON TRT      ALKPH   2012-08-27 Week 2   90    Y       Y      Y       Y      
       78 01-701-1023 MIN ON TRT      ALT     2012-08-27 Week 2   30    Y       Y      Y       Y      
       79 01-701-1023 MIN ON TRT      AST     2012-08-27 Week 2   25    Y       Y      Y       Y      
       80 01-701-1023 MIN ON TRT      BILI    2012-08-27 Week 2    6.84 Y       Y      Y       Y      
       81 01-701-1028 MIN ON TRT      ALKPH   2013-08-14 Week 4   38    Y       <NA>   Y       <NA>   
       82 01-701-1028 MIN ON TRT      ALT     2013-08-14 Week 4   29    Y       <NA>   Y       <NA>   
       83 01-701-1028 MIN ON TRT      AST     2013-08-01 Week 2   23    Y       <NA>   Y       <NA>   
       84 01-701-1028 MIN ON TRT      BILI    2013-08-01 Week 2   12.0  Y       <NA>   Y       <NA>   
       85 01-701-1034 MIN ON TRT      ALKPH   2014-08-11 Week 6   33    Y       Y      Y       <NA>   
       86 01-701-1034 MIN ON TRT      ALT     2014-08-11 Week 6   15    Y       Y      Y       <NA>   
       87 01-701-1034 MIN ON TRT      AST     2014-08-11 Week 6   19    Y       Y      Y       <NA>   
       88 01-701-1034 MIN ON TRT      BILI    2014-07-15 Week 2    6.84 Y       <NA>   Y       Y      
       89 01-701-1047 MIN ON TRT      ALKPH   2013-02-25 Week 2   67    Y       Y      Y       Y      
       90 01-701-1047 MIN ON TRT      ALT     2013-02-25 Week 2   16    Y       Y      Y       Y      
       91 01-701-1047 MIN ON TRT      AST     2013-02-25 Week 2   21    Y       Y      Y       Y      
       92 01-701-1047 MIN ON TRT      BILI    2013-02-25 Week 2    8.55 Y       Y      Y       Y      
       93 01-701-1015 MAX ON TRT      ALKPH   2014-01-16 Week 2   50    Y       <NA>   <NA>    Y      
       94 01-701-1015 MAX ON TRT      ALT     2014-01-16 Week 2   41    Y       <NA>   <NA>    Y      
       95 01-701-1015 MAX ON TRT      AST     2014-01-16 Week 2   33    Y       <NA>   <NA>    Y      
       96 01-701-1015 MAX ON TRT      BILI    2014-01-16 Week 2    8.55 Y       <NA>   <NA>    Y      
       97 01-701-1023 MAX ON TRT      ALKPH   2012-08-27 Week 2   90    Y       Y      Y       Y      
       98 01-701-1023 MAX ON TRT      ALT     2012-08-27 Week 2   30    Y       Y      Y       Y      
       99 01-701-1023 MAX ON TRT      AST     2012-08-27 Week 2   25    Y       Y      Y       Y      
      100 01-701-1023 MAX ON TRT      BILI    2012-08-27 Week 2    6.84 Y       Y      Y       Y      
      101 01-701-1028 MAX ON TRT      ALKPH   2013-08-01 Week 2   46    Y       <NA>   <NA>    Y      
      102 01-701-1028 MAX ON TRT      ALT     2013-08-29 Week 6   32    Y       Y      <NA>    Y      
      103 01-701-1028 MAX ON TRT      AST     2013-08-29 Week 6   26    Y       Y      <NA>    Y      
      104 01-701-1028 MAX ON TRT      BILI    2013-08-14 Week 4   13.7  Y       <NA>   <NA>    Y      
      105 01-701-1034 MAX ON TRT      ALKPH   2014-07-29 Week 4   36    Y       <NA>   <NA>    Y      
      106 01-701-1034 MAX ON TRT      ALT     2014-07-29 Week 4   21    Y       <NA>   <NA>    Y      
      107 01-701-1034 MAX ON TRT      AST     2014-07-29 Week 4   25    Y       <NA>   <NA>    Y      
      108 01-701-1034 MAX ON TRT      BILI    2014-07-15 Week 2    6.84 Y       <NA>   Y       Y      
      109 01-701-1047 MAX ON TRT      ALKPH   2013-02-25 Week 2   67    Y       Y      Y       Y      
      110 01-701-1047 MAX ON TRT      ALT     2013-02-25 Week 2   16    Y       Y      Y       Y      
      111 01-701-1047 MAX ON TRT      AST     2013-02-25 Week 2   21    Y       Y      Y       Y      
      112 01-701-1047 MAX ON TRT      BILI    2013-02-25 Week 2    8.55 Y       Y      Y       Y      
      113 01-701-1015 LAST VAL ON TRT ALKPH   2014-02-12 Week 6   43    Y       Y      <NA>    <NA>   
      114 01-701-1015 LAST VAL ON TRT ALT     2014-02-12 Week 6   26    Y       Y      <NA>    <NA>   
      115 01-701-1015 LAST VAL ON TRT AST     2014-02-12 Week 6   26    Y       Y      <NA>    <NA>   
      116 01-701-1015 LAST VAL ON TRT BILI    2014-02-12 Week 6    5.13 Y       Y      Y       <NA>   
      117 01-701-1023 LAST VAL ON TRT ALKPH   2012-08-27 Week 2   90    Y       Y      Y       Y      
      118 01-701-1023 LAST VAL ON TRT ALT     2012-08-27 Week 2   30    Y       Y      Y       Y      
      119 01-701-1023 LAST VAL ON TRT AST     2012-08-27 Week 2   25    Y       Y      Y       Y      
      120 01-701-1023 LAST VAL ON TRT BILI    2012-08-27 Week 2    6.84 Y       Y      Y       Y      
      121 01-701-1028 LAST VAL ON TRT ALKPH   2013-08-29 Week 6   40    Y       Y      <NA>    <NA>   
      122 01-701-1028 LAST VAL ON TRT ALT     2013-08-29 Week 6   32    Y       Y      <NA>    Y      
      123 01-701-1028 LAST VAL ON TRT AST     2013-08-29 Week 6   26    Y       Y      <NA>    Y      
      124 01-701-1028 LAST VAL ON TRT BILI    2013-08-29 Week 6   12.0  Y       Y      <NA>    <NA>   
      125 01-701-1034 LAST VAL ON TRT ALKPH   2014-08-11 Week 6   33    Y       Y      Y       <NA>   
      126 01-701-1034 LAST VAL ON TRT ALT     2014-08-11 Week 6   15    Y       Y      Y       <NA>   
      127 01-701-1034 LAST VAL ON TRT AST     2014-08-11 Week 6   19    Y       Y      Y       <NA>   
      128 01-701-1034 LAST VAL ON TRT BILI    2014-08-11 Week 6    6.84 Y       Y      <NA>    <NA>   
      129 01-701-1047 LAST VAL ON TRT ALKPH   2013-02-25 Week 2   67    Y       Y      Y       Y      
      130 01-701-1047 LAST VAL ON TRT ALT     2013-02-25 Week 2   16    Y       Y      Y       Y      
      131 01-701-1047 LAST VAL ON TRT AST     2013-02-25 Week 2   21    Y       Y      Y       Y      
      132 01-701-1047 LAST VAL ON TRT BILI    2013-02-25 Week 2    8.55 Y       Y      Y       Y      

# flagged row processing, filtering applied__spec_ids{summary_table$flagged_row_processing}

    Code
      options(width = 250)
      print(pfr2, n = 999)
    Output
      # A tibble: 51 x 10
         USUBJID     VISIT       PARAMCD ADT        AVISIT                   AVAL ANL01FL LVOTFL MINTRFL MAXTRFL
         <fct>       <fct>       <fct>   <date>     <fct>                   <dbl> <fct>   <chr>  <chr>   <chr>  
       1 01-701-1015 SCREENING 1 ALKPH   2013-12-26 Baseline                   34 <NA>    <NA>   <NA>    <NA>   
       2 01-701-1015 WEEK 4      ALKPH   2014-01-30 Week 4                     41 Y       <NA>   Y       <NA>   
       3 01-701-1015 WEEK 6      ALKPH   2014-02-12 Week 6                     43 Y       Y      <NA>    <NA>   
       4 01-701-1015 SCREENING 1 ALT     2013-12-26 Baseline                   27 <NA>    <NA>   <NA>    <NA>   
       5 01-701-1015 WEEK 4      ALT     2014-01-30 Week 4                     18 Y       <NA>   Y       <NA>   
       6 01-701-1015 WEEK 6      ALT     2014-02-12 Week 6                     26 Y       Y      <NA>    <NA>   
       7 01-701-1015 SCREENING 1 AST     2013-12-26 Baseline                   40 <NA>    <NA>   <NA>    <NA>   
       8 01-701-1015 WEEK 4      AST     2014-01-30 Week 4                     21 Y       <NA>   Y       <NA>   
       9 01-701-1015 WEEK 6      AST     2014-02-12 Week 6                     26 Y       Y      <NA>    <NA>   
      10 01-701-1023 SCREENING 1 ALKPH   2012-07-22 Baseline                   98 <NA>    <NA>   <NA>    <NA>   
      11 01-701-1023 WEEK 4      ALKPH   2012-09-02 Week 4                     99 <NA>    <NA>   <NA>    <NA>   
      12 01-701-1023 SCREENING 1 ALT     2012-07-22 Baseline                   23 <NA>    <NA>   <NA>    <NA>   
      13 01-701-1023 WEEK 4      ALT     2012-09-02 Week 4                     38 <NA>    <NA>   <NA>    <NA>   
      14 01-701-1023 SCREENING 1 AST     2012-07-22 Baseline                   21 <NA>    <NA>   <NA>    <NA>   
      15 01-701-1023 WEEK 4      AST     2012-09-02 Week 4                     30 <NA>    <NA>   <NA>    <NA>   
      16 01-701-1028 SCREENING 1 ALKPH   2013-07-11 Baseline                   44 <NA>    <NA>   <NA>    <NA>   
      17 01-701-1028 WEEK 4      ALKPH   2013-08-14 Week 4                     38 Y       <NA>   Y       <NA>   
      18 01-701-1028 WEEK 6      ALKPH   2013-08-29 Week 6                     40 Y       Y      <NA>    <NA>   
      19 01-701-1028 SCREENING 1 ALT     2013-07-11 Baseline                   26 <NA>    <NA>   <NA>    <NA>   
      20 01-701-1028 WEEK 4      ALT     2013-08-14 Week 4                     29 Y       <NA>   Y       <NA>   
      21 01-701-1028 WEEK 6      ALT     2013-08-29 Week 6                     32 Y       Y      <NA>    Y      
      22 01-701-1028 SCREENING 1 AST     2013-07-11 Baseline                   24 <NA>    <NA>   <NA>    <NA>   
      23 01-701-1028 WEEK 4      AST     2013-08-14 Week 4                     24 Y       <NA>   <NA>    <NA>   
      24 01-701-1028 WEEK 6      AST     2013-08-29 Week 6                     26 Y       Y      <NA>    Y      
      25 01-701-1015 WEEK 4      ALKPH   2014-01-30 Minimum on treatment       41 Y       <NA>   Y       <NA>   
      26 01-701-1015 WEEK 4      ALT     2014-01-30 Minimum on treatment       18 Y       <NA>   Y       <NA>   
      27 01-701-1015 WEEK 4      AST     2014-01-30 Minimum on treatment       21 Y       <NA>   Y       <NA>   
      28 01-701-1023 WEEK 2      ALKPH   2012-08-27 Minimum on treatment       90 Y       Y      Y       Y      
      29 01-701-1023 WEEK 2      ALT     2012-08-27 Minimum on treatment       30 Y       Y      Y       Y      
      30 01-701-1023 WEEK 2      AST     2012-08-27 Minimum on treatment       25 Y       Y      Y       Y      
      31 01-701-1028 WEEK 4      ALKPH   2013-08-14 Minimum on treatment       38 Y       <NA>   Y       <NA>   
      32 01-701-1028 WEEK 4      ALT     2013-08-14 Minimum on treatment       29 Y       <NA>   Y       <NA>   
      33 01-701-1028 WEEK 2      AST     2013-08-01 Minimum on treatment       23 Y       <NA>   Y       <NA>   
      34 01-701-1015 WEEK 2      ALKPH   2014-01-16 Maximum on treatment       50 Y       <NA>   <NA>    Y      
      35 01-701-1015 WEEK 2      ALT     2014-01-16 Maximum on treatment       41 Y       <NA>   <NA>    Y      
      36 01-701-1015 WEEK 2      AST     2014-01-16 Maximum on treatment       33 Y       <NA>   <NA>    Y      
      37 01-701-1023 WEEK 2      ALKPH   2012-08-27 Maximum on treatment       90 Y       Y      Y       Y      
      38 01-701-1023 WEEK 2      ALT     2012-08-27 Maximum on treatment       30 Y       Y      Y       Y      
      39 01-701-1023 WEEK 2      AST     2012-08-27 Maximum on treatment       25 Y       Y      Y       Y      
      40 01-701-1028 WEEK 2      ALKPH   2013-08-01 Maximum on treatment       46 Y       <NA>   <NA>    Y      
      41 01-701-1028 WEEK 6      ALT     2013-08-29 Maximum on treatment       32 Y       Y      <NA>    Y      
      42 01-701-1028 WEEK 6      AST     2013-08-29 Maximum on treatment       26 Y       Y      <NA>    Y      
      43 01-701-1015 WEEK 6      ALKPH   2014-02-12 Last value on treatment    43 Y       Y      <NA>    <NA>   
      44 01-701-1015 WEEK 6      ALT     2014-02-12 Last value on treatment    26 Y       Y      <NA>    <NA>   
      45 01-701-1015 WEEK 6      AST     2014-02-12 Last value on treatment    26 Y       Y      <NA>    <NA>   
      46 01-701-1023 WEEK 2      ALKPH   2012-08-27 Last value on treatment    90 Y       Y      Y       Y      
      47 01-701-1023 WEEK 2      ALT     2012-08-27 Last value on treatment    30 Y       Y      Y       Y      
      48 01-701-1023 WEEK 2      AST     2012-08-27 Last value on treatment    25 Y       Y      Y       Y      
      49 01-701-1028 WEEK 6      ALKPH   2013-08-29 Last value on treatment    40 Y       Y      <NA>    <NA>   
      50 01-701-1028 WEEK 6      ALT     2013-08-29 Last value on treatment    32 Y       Y      <NA>    Y      
      51 01-701-1028 WEEK 6      AST     2013-08-29 Last value on treatment    26 Y       Y      <NA>    Y      

