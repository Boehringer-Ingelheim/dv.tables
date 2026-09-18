# event group by is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$event_count;hierarchical_count_table$event_group_by_display}

    Code
      x
    Output
      $df
      # A tibble: 112 x 9
         lvl1     lvl2     `\035lvl` group evtgrp    .N     n subjid      pct
         <fct>    <fct>        <int> <fct> <fct>  <int> <int> <list>    <dbl>
       1 "\u001d" "\u001d"         0 GA    EG1        1     1 <fct [1]>   100
       2 "\u001d" "\u001d"         0 GB    EG1        2     1 <fct [1]>    50
       3 "\u001d" "\u001d"         0 GC    EG1        1     0 <fct [0]>     0
       4 "\u001d" "\u001d"         0 Total EG1        4     2 <fct [2]>    50
       5 "\u001d" "\u001d"         0 GA    EG2        1     1 <fct [1]>   100
       6 "\u001d" "\u001d"         0 GB    EG2        2     1 <fct [1]>    50
       7 "\u001d" "\u001d"         0 GC    EG2        1     0 <fct [0]>     0
       8 "\u001d" "\u001d"         0 Total EG2        4     2 <fct [2]>    50
       9 "\u001d" "\u001d"         0 GA    EG3        1     1 <fct [1]>   100
      10 "\u001d" "\u001d"         0 GB    EG3        2     2 <fct [2]>   100
      # i 102 more rows
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$group_vars
      [1] "group"
      
      $meta$pop_flag_vars
      NULL
      
      $meta$event_group_var
      [1] "evtgrp"
      
      $meta$event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $meta$total_vars
      [1] "group"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 6 x 3
           .N group .lookup
        <int> <fct> <chr>  
      1     1 GA    GA     
      2     2 GB    GB     
      3     1 GC    GC     
      4     4 Total Total  
      5     3 GB    GB     
      6     5 Total Total  
      
      $meta$table_type
      [1] "frequency"
      
      $meta$warning_message
      NULL
      
      

---

    Code
      s
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
      sw
    Output
      $df
      # A tibble: 7 x 8
        lvl1     lvl2     `\035lvl` `\035rank` GA           GB           GC          
        <fct>    <fct>        <int>      <int> <list>       <list>       <list>      
      1 "\u001d" "\u001d"         0          1 <named list> <named list> <named list>
      2 "A1"     "\u001d"         1          2 <named list> <named list> <named list>
      3 "A1"     "A2"             2          3 <named list> <named list> <named list>
      4 "A1"     "B2"             2          4 <named list> <named list> <named list>
      5 "B1"     "\u001d"         1          5 <named list> <named list> <named list>
      6 "B1"     "B2"             2          6 <named list> <named list> <named list>
      7 "B1"     "A2"             2          7 <named list> <named list> <named list>
      # i 1 more variable: Total <list>
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$group_vars
      [1] "group"
      
      $meta$pop_flag_vars
      NULL
      
      $meta$event_group_var
      [1] "evtgrp"
      
      $meta$event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $meta$total_vars
      [1] "group"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 6 x 3
           .N group .lookup
        <int> <fct> <chr>  
      1     1 GA    GA     
      2     2 GB    GB     
      3     1 GC    GC     
      4     4 Total Total  
      5     3 GB    GB     
      6     5 Total Total  
      
      $meta$table_type
      [1] "frequency"
      
      $meta$warning_message
      NULL
      
      $meta$min_percent
      [1] 0
      
      $meta$rank_col
      [1] "\035rank"
      
      

---

    Code
      html
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
              <span class="truncate" title="Subjects with any event">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Subjects with any event
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">3 ( 75.00 %)</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">0</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">2 ( 50.00 %)</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
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
            <td class="text-center" column="TotalEG1" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalEG2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalEG3" style="white-space: nowrap;">1 ( 25.00 %)</td>
          </tr>
        </table>
      </div>

