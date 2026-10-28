# event group by is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$event_count;hierarchical_count_table$event_group_by_display}

    Code
      options(width = 250)
      print(x1$df, n = 999)
    Output
      # A tibble: 112 x 9
          lvl1     lvl2     `\035lvl` group     evtgrp           .N     n subjid      pct
          <fct>    <fct>        <int> <fct>     <fct>         <int> <int> <list>    <dbl>
        1 "\u001d" "\u001d"         0 GA        EG1               1     1 <fct [1]>   100
        2 "\u001d" "\u001d"         0 GB        EG1               2     1 <fct [1]>    50
        3 "\u001d" "\u001d"         0 GC        EG1               1     0 <fct [0]>     0
        4 "\u001d" "\u001d"         0 __TOTAL__ EG1               4     2 <fct [2]>    50
        5 "\u001d" "\u001d"         0 GA        EG2               1     1 <fct [1]>   100
        6 "\u001d" "\u001d"         0 GB        EG2               2     1 <fct [1]>    50
        7 "\u001d" "\u001d"         0 GC        EG2               1     0 <fct [0]>     0
        8 "\u001d" "\u001d"         0 __TOTAL__ EG2               4     2 <fct [2]>    50
        9 "\u001d" "\u001d"         0 GA        EG3               1     1 <fct [1]>   100
       10 "\u001d" "\u001d"         0 GB        EG3               2     2 <fct [2]>   100
       11 "\u001d" "\u001d"         0 GC        EG3               1     0 <fct [0]>     0
       12 "\u001d" "\u001d"         0 __TOTAL__ EG3               4     3 <fct [3]>    75
       13 "\u001d" "\u001d"         0 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       14 "\u001d" "\u001d"         0 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       15 "\u001d" "\u001d"         0 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       16 "\u001d" "\u001d"         0 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       17 "A1"     "\u001d"         1 GA        EG1               1     1 <fct [1]>   100
       18 "A1"     "\u001d"         1 GB        EG1               2     1 <fct [1]>    50
       19 "A1"     "\u001d"         1 GC        EG1               1     0 <fct [0]>     0
       20 "A1"     "\u001d"         1 __TOTAL__ EG1               4     2 <fct [2]>    50
       21 "A1"     "\u001d"         1 GA        EG2               1     0 <fct [0]>     0
       22 "A1"     "\u001d"         1 GB        EG2               2     1 <fct [1]>    50
       23 "A1"     "\u001d"         1 GC        EG2               1     0 <fct [0]>     0
       24 "A1"     "\u001d"         1 __TOTAL__ EG2               4     1 <fct [1]>    25
       25 "A1"     "\u001d"         1 GA        EG3               1     0 <fct [0]>     0
       26 "A1"     "\u001d"         1 GB        EG3               2     1 <fct [1]>    50
       27 "A1"     "\u001d"         1 GC        EG3               1     0 <fct [0]>     0
       28 "A1"     "\u001d"         1 __TOTAL__ EG3               4     1 <fct [1]>    25
       29 "A1"     "\u001d"         1 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       30 "A1"     "\u001d"         1 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       31 "A1"     "\u001d"         1 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       32 "A1"     "\u001d"         1 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       33 "A1"     "A2"             2 GA        EG1               1     1 <fct [1]>   100
       34 "A1"     "A2"             2 GB        EG1               2     0 <fct [0]>     0
       35 "A1"     "A2"             2 GC        EG1               1     0 <fct [0]>     0
       36 "A1"     "A2"             2 __TOTAL__ EG1               4     1 <fct [1]>    25
       37 "A1"     "A2"             2 GA        EG2               1     0 <fct [0]>     0
       38 "A1"     "A2"             2 GB        EG2               2     1 <fct [1]>    50
       39 "A1"     "A2"             2 GC        EG2               1     0 <fct [0]>     0
       40 "A1"     "A2"             2 __TOTAL__ EG2               4     1 <fct [1]>    25
       41 "A1"     "A2"             2 GA        EG3               1     0 <fct [0]>     0
       42 "A1"     "A2"             2 GB        EG3               2     1 <fct [1]>    50
       43 "A1"     "A2"             2 GC        EG3               1     0 <fct [0]>     0
       44 "A1"     "A2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
       45 "A1"     "A2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       46 "A1"     "A2"             2 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       47 "A1"     "A2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       48 "A1"     "A2"             2 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       49 "A1"     "B2"             2 GA        EG1               1     1 <fct [1]>   100
       50 "A1"     "B2"             2 GB        EG1               2     1 <fct [1]>    50
       51 "A1"     "B2"             2 GC        EG1               1     0 <fct [0]>     0
       52 "A1"     "B2"             2 __TOTAL__ EG1               4     2 <fct [2]>    50
       53 "A1"     "B2"             2 GA        EG2               1     0 <fct [0]>     0
       54 "A1"     "B2"             2 GB        EG2               2     0 <fct [0]>     0
       55 "A1"     "B2"             2 GC        EG2               1     0 <fct [0]>     0
       56 "A1"     "B2"             2 __TOTAL__ EG2               4     0 <fct [0]>     0
       57 "A1"     "B2"             2 GA        EG3               1     0 <fct [0]>     0
       58 "A1"     "B2"             2 GB        EG3               2     0 <fct [0]>     0
       59 "A1"     "B2"             2 GC        EG3               1     0 <fct [0]>     0
       60 "A1"     "B2"             2 __TOTAL__ EG3               4     0 <fct [0]>     0
       61 "A1"     "B2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       62 "A1"     "B2"             2 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
       63 "A1"     "B2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       64 "A1"     "B2"             2 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
       65 "B1"     "\u001d"         1 GA        EG1               1     0 <fct [0]>     0
       66 "B1"     "\u001d"         1 GB        EG1               2     0 <fct [0]>     0
       67 "B1"     "\u001d"         1 GC        EG1               1     0 <fct [0]>     0
       68 "B1"     "\u001d"         1 __TOTAL__ EG1               4     0 <fct [0]>     0
       69 "B1"     "\u001d"         1 GA        EG2               1     1 <fct [1]>   100
       70 "B1"     "\u001d"         1 GB        EG2               2     0 <fct [0]>     0
       71 "B1"     "\u001d"         1 GC        EG2               1     0 <fct [0]>     0
       72 "B1"     "\u001d"         1 __TOTAL__ EG2               4     1 <fct [1]>    25
       73 "B1"     "\u001d"         1 GA        EG3               1     1 <fct [1]>   100
       74 "B1"     "\u001d"         1 GB        EG3               2     1 <fct [1]>    50
       75 "B1"     "\u001d"         1 GC        EG3               1     0 <fct [0]>     0
       76 "B1"     "\u001d"         1 __TOTAL__ EG3               4     2 <fct [2]>    50
       77 "B1"     "\u001d"         1 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       78 "B1"     "\u001d"         1 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
       79 "B1"     "\u001d"         1 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       80 "B1"     "\u001d"         1 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
       81 "B1"     "A2"             2 GA        EG1               1     0 <fct [0]>     0
       82 "B1"     "A2"             2 GB        EG1               2     0 <fct [0]>     0
       83 "B1"     "A2"             2 GC        EG1               1     0 <fct [0]>     0
       84 "B1"     "A2"             2 __TOTAL__ EG1               4     0 <fct [0]>     0
       85 "B1"     "A2"             2 GA        EG2               1     0 <fct [0]>     0
       86 "B1"     "A2"             2 GB        EG2               2     0 <fct [0]>     0
       87 "B1"     "A2"             2 GC        EG2               1     0 <fct [0]>     0
       88 "B1"     "A2"             2 __TOTAL__ EG2               4     0 <fct [0]>     0
       89 "B1"     "A2"             2 GA        EG3               1     1 <fct [1]>   100
       90 "B1"     "A2"             2 GB        EG3               2     0 <fct [0]>     0
       91 "B1"     "A2"             2 GC        EG3               1     0 <fct [0]>     0
       92 "B1"     "A2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
       93 "B1"     "A2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       94 "B1"     "A2"             2 GB        __EVT_TOTAL__     2     0 <fct [0]>     0
       95 "B1"     "A2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       96 "B1"     "A2"             2 __TOTAL__ __EVT_TOTAL__     4     1 <fct [1]>    25
       97 "B1"     "B2"             2 GA        EG1               1     0 <fct [0]>     0
       98 "B1"     "B2"             2 GB        EG1               2     0 <fct [0]>     0
       99 "B1"     "B2"             2 GC        EG1               1     0 <fct [0]>     0
      100 "B1"     "B2"             2 __TOTAL__ EG1               4     0 <fct [0]>     0
      101 "B1"     "B2"             2 GA        EG2               1     1 <fct [1]>   100
      102 "B1"     "B2"             2 GB        EG2               2     0 <fct [0]>     0
      103 "B1"     "B2"             2 GC        EG2               1     0 <fct [0]>     0
      104 "B1"     "B2"             2 __TOTAL__ EG2               4     1 <fct [1]>    25
      105 "B1"     "B2"             2 GA        EG3               1     0 <fct [0]>     0
      106 "B1"     "B2"             2 GB        EG3               2     1 <fct [1]>    50
      107 "B1"     "B2"             2 GC        EG3               1     0 <fct [0]>     0
      108 "B1"     "B2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
      109 "B1"     "B2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
      110 "B1"     "B2"             2 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
      111 "B1"     "B2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
      112 "B1"     "B2"             2 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
    Code
      print(x1$meta)
    Output
      $hierarchy
      [1] "lvl1" "lvl2"
      
      $group_vars
      [1] "group"
      
      $pop_flag_vars
      NULL
      
      $event_group_var
      [1] "evtgrp"
      
      $event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $worst_event_group
      [1] FALSE
      
      $total_vars
      [1] "group"
      
      $total_group_val
      [1] "Total"
      
      $event_group_total_val
      NULL
      
      $denom_df
      # A tibble: 4 x 3
           .N group     .lookup  
        <int> <fct>     <chr>    
      1     1 GA        GA       
      2     2 GB        GB       
      3     1 GC        GC       
      4     4 __TOTAL__ __TOTAL__
      
      $table_type
      [1] "frequency"
      
      $any_event_text
      [1] "Participants with any event"
      
      $warning_message
      NULL
      

---

    Code
      s1
    Output
      # A tibble: 7 x 6
        lvl1     lvl2     `\035lvl` `\035count1` `\035count2` `\035rank`
        <fct>    <fct>        <int>        <dbl>        <dbl>      <int>
      1 "\u001d" "\u001d"         0          Inf          Inf          1
      2 "A1"     "\u001d"         1            3          Inf          2
      3 "A1"     "A2"             2            3            3          3
      4 "A1"     "B2"             2            3            2          4
      5 "B1"     "\u001d"         1            2          Inf          5
      6 "B1"     "B2"             2            2            2          6
      7 "B1"     "A2"             2            2            1          7

---

    Code
      sw1
    Output
      $df
      # A tibble: 7 x 8
        lvl1     lvl2     `\035lvl` `\035rank` GA               GB               GC               `__TOTAL__`     
        <fct>    <fct>        <int>      <int> <list>           <list>           <list>           <list>          
      1 "\u001d" "\u001d"         0          1 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      2 "A1"     "\u001d"         1          2 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      3 "A1"     "A2"             2          3 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      4 "A1"     "B2"             2          4 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      5 "B1"     "\u001d"         1          5 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      6 "B1"     "B2"             2          6 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      7 "B1"     "A2"             2          7 <named list [3]> <named list [3]> <named list [3]> <named list [3]>
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$group_vars
      [1] "group"
      
      $meta$pop_flag_vars
      NULL
      
      $meta$event_group_var
      [1] "evtgrp"
      
      $meta$event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $meta$worst_event_group
      [1] FALSE
      
      $meta$total_vars
      [1] "group"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$event_group_total_val
      NULL
      
      $meta$denom_df
      # A tibble: 4 x 3
           .N group     .lookup  
        <int> <fct>     <chr>    
      1     1 GA        GA       
      2     2 GB        GB       
      3     1 GC        GC       
      4     4 __TOTAL__ __TOTAL__
      
      $meta$table_type
      [1] "frequency"
      
      $meta$any_event_text
      [1] "Participants with any event"
      
      $meta$warning_message
      NULL
      
      $meta$min_percent
      [1] 0
      
      $meta$rank_col
      [1] "\035rank"
      
      

---

    Code
      html1
    Output
      <div>
        <p>Event count by Level 1, Level 2; group by group; event group by Event Group</p>
        <table class="table event-count">
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>
                GA
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>
                GB
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>
                GC
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>
                Total
                <br/>
                (N = 4)
              </span>
            </th>
          </tr>
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>EG3</span>
            </th>
          </tr>
          <tr row-id="1" class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Participants with any event">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Participants with any event
              </span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">3 ( 75.00 %)</td>
          </tr>
          <tr row-id="2" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="A1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                A1
              </span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="5" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="B1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                B1
              </span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">2 ( 50.00 %)</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="GAEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GAEG3" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GBEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GCEG3" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="__TOTAL__EG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
          </tr>
        </table>
      </div>

# worst event group by computation is correct (snapshot)__spec_ids{hierarchical_count_table$event_group_worst_severity;hierarchical_count_table$event_count;hierarchical_count_table$event_group_by_display}

    Code
      options(width = 250)
      print(x2$df, n = 999)
    Output
      # A tibble: 112 x 9
          lvl1     lvl2     `\035lvl` group     evtgrp           .N     n subjid      pct
          <fct>    <fct>        <int> <fct>     <fct>         <int> <int> <list>    <dbl>
        1 "\u001d" "\u001d"         0 GA        EG1               1     0 <fct [0]>     0
        2 "\u001d" "\u001d"         0 GB        EG1               2     0 <fct [0]>     0
        3 "\u001d" "\u001d"         0 GC        EG1               1     0 <fct [0]>     0
        4 "\u001d" "\u001d"         0 __TOTAL__ EG1               4     0 <fct [0]>     0
        5 "\u001d" "\u001d"         0 GA        EG2               1     0 <fct [0]>     0
        6 "\u001d" "\u001d"         0 GB        EG2               2     0 <fct [0]>     0
        7 "\u001d" "\u001d"         0 GC        EG2               1     0 <fct [0]>     0
        8 "\u001d" "\u001d"         0 __TOTAL__ EG2               4     0 <fct [0]>     0
        9 "\u001d" "\u001d"         0 GA        EG3               1     1 <fct [1]>   100
       10 "\u001d" "\u001d"         0 GB        EG3               2     2 <fct [2]>   100
       11 "\u001d" "\u001d"         0 GC        EG3               1     0 <fct [0]>     0
       12 "\u001d" "\u001d"         0 __TOTAL__ EG3               4     3 <fct [3]>    75
       13 "\u001d" "\u001d"         0 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       14 "\u001d" "\u001d"         0 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       15 "\u001d" "\u001d"         0 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       16 "\u001d" "\u001d"         0 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       17 "A1"     "\u001d"         1 GA        EG1               1     1 <fct [1]>   100
       18 "A1"     "\u001d"         1 GB        EG1               2     0 <fct [0]>     0
       19 "A1"     "\u001d"         1 GC        EG1               1     0 <fct [0]>     0
       20 "A1"     "\u001d"         1 __TOTAL__ EG1               4     1 <fct [1]>    25
       21 "A1"     "\u001d"         1 GA        EG2               1     0 <fct [0]>     0
       22 "A1"     "\u001d"         1 GB        EG2               2     1 <fct [1]>    50
       23 "A1"     "\u001d"         1 GC        EG2               1     0 <fct [0]>     0
       24 "A1"     "\u001d"         1 __TOTAL__ EG2               4     1 <fct [1]>    25
       25 "A1"     "\u001d"         1 GA        EG3               1     0 <fct [0]>     0
       26 "A1"     "\u001d"         1 GB        EG3               2     1 <fct [1]>    50
       27 "A1"     "\u001d"         1 GC        EG3               1     0 <fct [0]>     0
       28 "A1"     "\u001d"         1 __TOTAL__ EG3               4     1 <fct [1]>    25
       29 "A1"     "\u001d"         1 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       30 "A1"     "\u001d"         1 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       31 "A1"     "\u001d"         1 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       32 "A1"     "\u001d"         1 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       33 "A1"     "A2"             2 GA        EG1               1     1 <fct [1]>   100
       34 "A1"     "A2"             2 GB        EG1               2     0 <fct [0]>     0
       35 "A1"     "A2"             2 GC        EG1               1     0 <fct [0]>     0
       36 "A1"     "A2"             2 __TOTAL__ EG1               4     1 <fct [1]>    25
       37 "A1"     "A2"             2 GA        EG2               1     0 <fct [0]>     0
       38 "A1"     "A2"             2 GB        EG2               2     1 <fct [1]>    50
       39 "A1"     "A2"             2 GC        EG2               1     0 <fct [0]>     0
       40 "A1"     "A2"             2 __TOTAL__ EG2               4     1 <fct [1]>    25
       41 "A1"     "A2"             2 GA        EG3               1     0 <fct [0]>     0
       42 "A1"     "A2"             2 GB        EG3               2     1 <fct [1]>    50
       43 "A1"     "A2"             2 GC        EG3               1     0 <fct [0]>     0
       44 "A1"     "A2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
       45 "A1"     "A2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       46 "A1"     "A2"             2 GB        __EVT_TOTAL__     2     2 <fct [2]>   100
       47 "A1"     "A2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       48 "A1"     "A2"             2 __TOTAL__ __EVT_TOTAL__     4     3 <fct [3]>    75
       49 "A1"     "B2"             2 GA        EG1               1     1 <fct [1]>   100
       50 "A1"     "B2"             2 GB        EG1               2     1 <fct [1]>    50
       51 "A1"     "B2"             2 GC        EG1               1     0 <fct [0]>     0
       52 "A1"     "B2"             2 __TOTAL__ EG1               4     2 <fct [2]>    50
       53 "A1"     "B2"             2 GA        EG2               1     0 <fct [0]>     0
       54 "A1"     "B2"             2 GB        EG2               2     0 <fct [0]>     0
       55 "A1"     "B2"             2 GC        EG2               1     0 <fct [0]>     0
       56 "A1"     "B2"             2 __TOTAL__ EG2               4     0 <fct [0]>     0
       57 "A1"     "B2"             2 GA        EG3               1     0 <fct [0]>     0
       58 "A1"     "B2"             2 GB        EG3               2     0 <fct [0]>     0
       59 "A1"     "B2"             2 GC        EG3               1     0 <fct [0]>     0
       60 "A1"     "B2"             2 __TOTAL__ EG3               4     0 <fct [0]>     0
       61 "A1"     "B2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       62 "A1"     "B2"             2 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
       63 "A1"     "B2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       64 "A1"     "B2"             2 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
       65 "B1"     "\u001d"         1 GA        EG1               1     0 <fct [0]>     0
       66 "B1"     "\u001d"         1 GB        EG1               2     0 <fct [0]>     0
       67 "B1"     "\u001d"         1 GC        EG1               1     0 <fct [0]>     0
       68 "B1"     "\u001d"         1 __TOTAL__ EG1               4     0 <fct [0]>     0
       69 "B1"     "\u001d"         1 GA        EG2               1     0 <fct [0]>     0
       70 "B1"     "\u001d"         1 GB        EG2               2     0 <fct [0]>     0
       71 "B1"     "\u001d"         1 GC        EG2               1     0 <fct [0]>     0
       72 "B1"     "\u001d"         1 __TOTAL__ EG2               4     0 <fct [0]>     0
       73 "B1"     "\u001d"         1 GA        EG3               1     1 <fct [1]>   100
       74 "B1"     "\u001d"         1 GB        EG3               2     1 <fct [1]>    50
       75 "B1"     "\u001d"         1 GC        EG3               1     0 <fct [0]>     0
       76 "B1"     "\u001d"         1 __TOTAL__ EG3               4     2 <fct [2]>    50
       77 "B1"     "\u001d"         1 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       78 "B1"     "\u001d"         1 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
       79 "B1"     "\u001d"         1 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       80 "B1"     "\u001d"         1 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
       81 "B1"     "A2"             2 GA        EG1               1     0 <fct [0]>     0
       82 "B1"     "A2"             2 GB        EG1               2     0 <fct [0]>     0
       83 "B1"     "A2"             2 GC        EG1               1     0 <fct [0]>     0
       84 "B1"     "A2"             2 __TOTAL__ EG1               4     0 <fct [0]>     0
       85 "B1"     "A2"             2 GA        EG2               1     0 <fct [0]>     0
       86 "B1"     "A2"             2 GB        EG2               2     0 <fct [0]>     0
       87 "B1"     "A2"             2 GC        EG2               1     0 <fct [0]>     0
       88 "B1"     "A2"             2 __TOTAL__ EG2               4     0 <fct [0]>     0
       89 "B1"     "A2"             2 GA        EG3               1     1 <fct [1]>   100
       90 "B1"     "A2"             2 GB        EG3               2     0 <fct [0]>     0
       91 "B1"     "A2"             2 GC        EG3               1     0 <fct [0]>     0
       92 "B1"     "A2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
       93 "B1"     "A2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
       94 "B1"     "A2"             2 GB        __EVT_TOTAL__     2     0 <fct [0]>     0
       95 "B1"     "A2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
       96 "B1"     "A2"             2 __TOTAL__ __EVT_TOTAL__     4     1 <fct [1]>    25
       97 "B1"     "B2"             2 GA        EG1               1     0 <fct [0]>     0
       98 "B1"     "B2"             2 GB        EG1               2     0 <fct [0]>     0
       99 "B1"     "B2"             2 GC        EG1               1     0 <fct [0]>     0
      100 "B1"     "B2"             2 __TOTAL__ EG1               4     0 <fct [0]>     0
      101 "B1"     "B2"             2 GA        EG2               1     1 <fct [1]>   100
      102 "B1"     "B2"             2 GB        EG2               2     0 <fct [0]>     0
      103 "B1"     "B2"             2 GC        EG2               1     0 <fct [0]>     0
      104 "B1"     "B2"             2 __TOTAL__ EG2               4     1 <fct [1]>    25
      105 "B1"     "B2"             2 GA        EG3               1     0 <fct [0]>     0
      106 "B1"     "B2"             2 GB        EG3               2     1 <fct [1]>    50
      107 "B1"     "B2"             2 GC        EG3               1     0 <fct [0]>     0
      108 "B1"     "B2"             2 __TOTAL__ EG3               4     1 <fct [1]>    25
      109 "B1"     "B2"             2 GA        __EVT_TOTAL__     1     1 <fct [1]>   100
      110 "B1"     "B2"             2 GB        __EVT_TOTAL__     2     1 <fct [1]>    50
      111 "B1"     "B2"             2 GC        __EVT_TOTAL__     1     0 <fct [0]>     0
      112 "B1"     "B2"             2 __TOTAL__ __EVT_TOTAL__     4     2 <fct [2]>    50
    Code
      print(x2$meta)
    Output
      $hierarchy
      [1] "lvl1" "lvl2"
      
      $group_vars
      [1] "group"
      
      $pop_flag_vars
      NULL
      
      $event_group_var
      [1] "evtgrp"
      
      $event_group_vals
      [1] "EG1"        "EG2"        "EG3"        "All Groups"
      
      $worst_event_group
      [1] TRUE
      
      $total_vars
      [1] "group"  "evtgrp"
      
      $total_group_val
      [1] "Total"
      
      $event_group_total_val
      [1] "All Groups"
      
      $denom_df
      # A tibble: 4 x 3
           .N group     .lookup  
        <int> <fct>     <chr>    
      1     1 GA        GA       
      2     2 GB        GB       
      3     1 GC        GC       
      4     4 __TOTAL__ __TOTAL__
      
      $table_type
      [1] "frequency"
      
      $any_event_text
      [1] "Participants with any event"
      
      $warning_message
      NULL
      

