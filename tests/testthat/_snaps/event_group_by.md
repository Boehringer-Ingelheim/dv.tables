# event group by is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$event_count;hierarchical_count_table$event_group_by_display}

    Code
      x
    Output
      $df
      # A tibble: 84 x 9
         lvl1     lvl2     group evtgrp `\035lvl`     N     n subjid      pct
         <fct>    <fct>    <fct> <fct>      <int> <int> <int> <list>    <dbl>
       1 "\u001d" "\u001d" GA    EG1            0     1     1 <fct [1]>   100
       2 "\u001d" "\u001d" GA    EG2            0     1     1 <fct [1]>   100
       3 "\u001d" "\u001d" GA    EG3            0     1     1 <fct [1]>   100
       4 "\u001d" "\u001d" GB    EG1            0     2     1 <fct [1]>    50
       5 "\u001d" "\u001d" GB    EG2            0     2     1 <fct [1]>    50
       6 "\u001d" "\u001d" GB    EG3            0     2     2 <fct [2]>   100
       7 "\u001d" "\u001d" GC    EG1            0     1     0 <fct [0]>     0
       8 "\u001d" "\u001d" GC    EG2            0     1     0 <fct [0]>     0
       9 "\u001d" "\u001d" GC    EG3            0     1     0 <fct [0]>     0
      10 "\u001d" "\u001d" Total EG1            0     4     2 <fct [2]>    50
      # i 74 more rows
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$group_var
      [1] "group"
      
      $meta$event_group_var
      [1] "evtgrp"
      
      $meta$event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$n_denominator
         GA    GB    GC Total 
          1     2     1     4 
      
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
      2 "A1"     "\u001d"         1            4          Inf          2
      3 "A1"     "A2"             2            4            3          3
      4 "A1"     "B2"             2            4            2          4
      5 "B1"     "\u001d"         1            3          Inf          5
      6 "B1"     "B2"             2            3            2          6
      7 "B1"     "A2"             2            3            1          7

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
      
      $meta$group_var
      [1] "group"
      
      $meta$event_group_var
      [1] "evtgrp"
      
      $meta$event_group_vals
      [1] "EG1" "EG2" "EG3"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$n_denominator
         GA    GB    GC Total 
          1     2     1     4 
      
      $meta$table_type
      [1] "frequency"
      
      $meta$warning_message
      NULL
      
      $meta$rank_col
      [1] "\035rank"
      
      

---

    Code
      html
    Output
      <div>
        <p>Event count by lvl1, lvl2</p>
        <table class="table event-count">
          <tr class="no-border">
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>
                
                <br/>
                
              </span>
            </th>
            <th class="text-center" colspan="3" style="border-bottom: 1px solid black; border-right: 6px solid white">
              <span>
                GA
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" colspan="3" style="border-bottom: 1px solid black; border-right: 6px solid white">
              <span>
                GB
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" colspan="3" style="border-bottom: 1px solid black; border-right: 6px solid white">
              <span>
                GC
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" colspan="3" style="border-bottom: 1px solid black; border-right: 6px solid white">
              <span>
                Total
                <br/>
                (N = 4)
              </span>
            </th>
          </tr>
          <tr>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span></span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG3</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG1</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
              <span>EG2</span>
            </th>
            <th class="text-center" style="vertical-align: bottom; border-top: 1px solid white">
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
            <td class="text-center" column="GAEG1">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3">2 ( 100.00 %)</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG3">3 ( 75.00 %)</td>
          </tr>
          <tr row-id="2" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="A1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                A1
              </span>
            </td>
            <td class="text-center" column="GAEG1">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2">—</td>
            <td class="text-center" column="GAEG3">—</td>
            <td class="text-center" column="GBEG1">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="GAEG1">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2">—</td>
            <td class="text-center" column="GAEG3">—</td>
            <td class="text-center" column="GBEG1">—</td>
            <td class="text-center" column="GBEG2">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG3">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG2">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GAEG1">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG2">—</td>
            <td class="text-center" column="GAEG3">—</td>
            <td class="text-center" column="GBEG1">1 ( 50.00 %)</td>
            <td class="text-center" column="GBEG2">—</td>
            <td class="text-center" column="GBEG3">—</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">2 ( 50.00 %)</td>
            <td class="text-center" column="TotalEG2">—</td>
            <td class="text-center" column="TotalEG3">—</td>
          </tr>
          <tr row-id="5" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="B1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                B1
              </span>
            </td>
            <td class="text-center" column="GAEG1">—</td>
            <td class="text-center" column="GAEG2">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1">—</td>
            <td class="text-center" column="GBEG2">—</td>
            <td class="text-center" column="GBEG3">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">—</td>
            <td class="text-center" column="TotalEG2">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3">2 ( 50.00 %)</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GAEG1">—</td>
            <td class="text-center" column="GAEG2">1 ( 100.00 %)</td>
            <td class="text-center" column="GAEG3">—</td>
            <td class="text-center" column="GBEG1">—</td>
            <td class="text-center" column="GBEG2">—</td>
            <td class="text-center" column="GBEG3">1 ( 50.00 %)</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">—</td>
            <td class="text-center" column="TotalEG2">1 ( 25.00 %)</td>
            <td class="text-center" column="TotalEG3">1 ( 25.00 %)</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="GAEG1">—</td>
            <td class="text-center" column="GAEG2">—</td>
            <td class="text-center" column="GAEG3">1 ( 100.00 %)</td>
            <td class="text-center" column="GBEG1">—</td>
            <td class="text-center" column="GBEG2">—</td>
            <td class="text-center" column="GBEG3">—</td>
            <td class="text-center" column="GCEG1">—</td>
            <td class="text-center" column="GCEG2">—</td>
            <td class="text-center" column="GCEG3">—</td>
            <td class="text-center" column="TotalEG1">—</td>
            <td class="text-center" column="TotalEG2">—</td>
            <td class="text-center" column="TotalEG3">1 ( 25.00 %)</td>
          </tr>
        </table>
      </div>

