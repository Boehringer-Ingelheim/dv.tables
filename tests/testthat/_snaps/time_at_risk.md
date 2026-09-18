# time at risk is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$time_at_risk;hierarchical_count_table$time_at_risk_display}

    Code
      x
    Output
      $df
      # A tibble: 24 x 10
         lvl1     lvl2  `\035lvl` group    .N     n subjid time_at_risk incidence_rate
         <fct>    <fct>     <int> <fct> <int> <int> <list>        <dbl>          <dbl>
       1 "\u001d" "\u0~         0 GA        1     1 <fct>       0.00274         36525 
       2 "\u001d" "\u0~         0 GB        2     2 <fct>       0.0520           3845.
       3 "\u001d" "\u0~         0 GC        1     0 <fct>       0.0575              0 
       4 "\u001d" "\u0~         0 Total     4     3 <fct>       0.112            2673.
       5 "A1"     "\u0~         1 GA        1     1 <fct>       0.00274         36525 
       6 "A1"     "\u0~         1 GB        2     2 <fct>       0.0520           3845.
       7 "A1"     "\u0~         1 GC        1     0 <fct>       0.0575              0 
       8 "A1"     "\u0~         1 Total     4     3 <fct>       0.112            2673.
       9 "A1"     "A2"          2 GA        1     0 <fct>       0.0274              0 
      10 "A1"     "A2"          2 GB        2     2 <fct>       0.0520           3845.
      # i 14 more rows
      # i 1 more variable: pct <dbl>
      
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
      NULL
      
      $meta$event_group_vals
      character(0)
      
      $meta$total_vars
      character(0)
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 4 x 3
           .N group .lookup
        <int> <fct> <chr>  
      1     1 GA    GA     
      2     2 GB    GB     
      3     1 GC    GC     
      4     4 Total Total  
      
      $meta$table_type
      [1] "time_at_risk"
      
      $meta$warning_message
      NULL
      
      

---

    Code
      s
    Output
      # A tibble: 6 x 6
        lvl1     lvl2     `\035lvl` `\035count1` `\035count2` `\035rank`
        <fct>    <fct>        <int>        <dbl>        <dbl>      <int>
      1 "\u001d" "\u001d"         0          Inf          Inf          1
      2 "A1"     "\u001d"         1            3          Inf          2
      3 "A1"     "A2"             2            3            2          3
      4 "A1"     "B2"             2            3            1          4
      5 "B1"     "\u001d"         1            2          Inf          5
      6 "B1"     "B2"             2            2            2          6

---

    Code
      sw
    Output
      $df
      # A tibble: 6 x 7
        lvl1     lvl2     `\035lvl` `\035rank` GA           GB           GC          
        <fct>    <fct>        <int>      <int> <list>       <list>       <list>      
      1 "\u001d" "\u001d"         0          1 <named list> <named list> <named list>
      2 "A1"     "\u001d"         1          2 <named list> <named list> <named list>
      3 "A1"     "A2"             2          3 <named list> <named list> <named list>
      4 "A1"     "B2"             2          4 <named list> <named list> <named list>
      5 "B1"     "\u001d"         1          5 <named list> <named list> <named list>
      6 "B1"     "B2"             2          6 <named list> <named list> <named list>
      
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
      NULL
      
      $meta$event_group_vals
      character(0)
      
      $meta$total_vars
      character(0)
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 4 x 3
           .N group .lookup
        <int> <fct> <chr>  
      1     1 GA    GA     
      2     2 GB    GB     
      3     1 GC    GC     
      4     4 Total Total  
      
      $meta$table_type
      [1] "time_at_risk"
      
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
        <p>Event count by Level 1, Level 2; group by group</p>
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
          </tr>
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">n (%)</th>
            <th class="text-center" style="vertical-align: bottom;">Time at risk<br>(pt-yrs)</th>
            <th class="text-center" style="vertical-align: bottom;">Rate/100<br>pt-yrs</th>
            <th class="text-center" style="vertical-align: bottom;">n (%)</th>
            <th class="text-center" style="vertical-align: bottom;">Time at risk<br>(pt-yrs)</th>
            <th class="text-center" style="vertical-align: bottom;">Rate/100<br>pt-yrs</th>
            <th class="text-center" style="vertical-align: bottom;">n (%)</th>
            <th class="text-center" style="vertical-align: bottom;">Time at risk<br>(pt-yrs)</th>
            <th class="text-center" style="vertical-align: bottom;">Rate/100<br>pt-yrs</th>
          </tr>
          <tr row-id="1" class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Subjects with any event">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Subjects with any event
              </span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.00</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">36525.00</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.05</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">3844.74</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
          <tr row-id="2" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="A1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                A1
              </span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.00</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">36525.00</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.05</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">3844.74</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.03</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.00</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.05</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">3844.74</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.00</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">36525.00</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.11</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.00</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
          <tr row-id="5" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="B1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                B1
              </span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.03</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">3652.50</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.11</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">913.12</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="GA" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">0.03</td>
            <td class="text-center" column="GA" style="white-space: nowrap;">3652.50</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">0.11</td>
            <td class="text-center" column="GB" style="white-space: nowrap;">913.12</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.06</td>
            <td class="text-center" column="GC" style="white-space: nowrap;">0.00</td>
          </tr>
        </table>
      </div>

