# event group by is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$event_count;hierarchical_count_table$event_group_by_display}

    Code
      x
    Output
      $df
      # A tibble: 252 x 10
         lvl1     lvl2     `\035lvl` .pop_group group1 group2    .N     n subjid   pct
         <fct>    <fct>        <int> <fct>      <fct>  <fct>  <int> <int> <list> <dbl>
       1 "\u001d" "\u001d"         0 ITT        G1A    G2X        1     1 <fct>    100
       2 "\u001d" "\u001d"         0 Safety     G1A    G2X        1     1 <fct>    100
       3 "\u001d" "\u001d"         0 Total      G1A    G2X        1     1 <fct>    100
       4 "\u001d" "\u001d"         0 ITT        G1B    G2X        2     2 <fct>    100
       5 "\u001d" "\u001d"         0 Safety     G1B    G2X        1     1 <fct>    100
       6 "\u001d" "\u001d"         0 Total      G1B    G2X        2     2 <fct>    100
       7 "\u001d" "\u001d"         0 ITT        G1C    G2X        0     0 <fct>      0
       8 "\u001d" "\u001d"         0 Safety     G1C    G2X        0     0 <fct>      0
       9 "\u001d" "\u001d"         0 Total      G1C    G2X        0     0 <fct>      0
      10 "\u001d" "\u001d"         0 ITT        Total  G2X        3     3 <fct>    100
      # i 242 more rows
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$group_vars
      [1] ".pop_group" "group1"     "group2"    
      
      $meta$pop_flag_vars
      [1] "ITTFL" "SAFFL"
      
      $meta$event_group_var
      NULL
      
      $meta$event_group_vals
      character(0)
      
      $meta$total_vars
      [1] "group2"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 36 x 5
            .N .pop_group group1 group2 .lookup                   
         <int> <fct>      <fct>  <fct>  <chr>                     
       1     1 ITT        G1A    G2X    "ITT\u001dG1A\u001dG2X"   
       2     1 Safety     G1A    G2X    "Safety\u001dG1A\u001dG2X"
       3     1 Total      G1A    G2X    "Total\u001dG1A\u001dG2X" 
       4     2 ITT        G1B    G2X    "ITT\u001dG1B\u001dG2X"   
       5     1 Safety     G1B    G2X    "Safety\u001dG1B\u001dG2X"
       6     2 Total      G1B    G2X    "Total\u001dG1B\u001dG2X" 
       7     0 ITT        G1C    G2X    "ITT\u001dG1C\u001dG2X"   
       8     0 Safety     G1C    G2X    "Safety\u001dG1C\u001dG2X"
       9     0 Total      G1C    G2X    "Total\u001dG1C\u001dG2X" 
      10     3 ITT        Total  G2X    "ITT\u001dTotal\u001dG2X" 
      # i 26 more rows
      
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
      # A tibble: 7 x 22
        lvl1     lvl2     `\035lvl` `\035rank` `ITT\035G1A\035G2X` `ITT\035G1A\035G2Z`
        <fct>    <fct>        <int>      <int> <list>              <list>             
      1 "\u001d" "\u001d"         0          1 <named list [2]>    <named list [2]>   
      2 "A1"     "\u001d"         1          2 <named list [2]>    <named list [2]>   
      3 "A1"     "A2"             2          3 <named list [2]>    <named list [2]>   
      4 "A1"     "B2"             2          4 <named list [2]>    <named list [2]>   
      5 "B1"     "\u001d"         1          5 <named list [2]>    <named list [2]>   
      6 "B1"     "B2"             2          6 <named list [2]>    <named list [2]>   
      7 "B1"     "A2"             2          7 <named list [2]>    <named list [2]>   
      # i 16 more variables: `ITT\035G1A\035Total` <list>,
      #   `ITT\035G1B\035G2X` <list>, `ITT\035G1B\035G2Z` <list>,
      #   `ITT\035G1B\035Total` <list>, `ITT\035G1C\035G2X` <list>,
      #   `ITT\035G1C\035G2Z` <list>, `ITT\035G1C\035Total` <list>,
      #   `Safety\035G1A\035G2X` <list>, `Safety\035G1A\035G2Z` <list>,
      #   `Safety\035G1A\035Total` <list>, `Safety\035G1B\035G2X` <list>,
      #   `Safety\035G1B\035G2Z` <list>, `Safety\035G1B\035Total` <list>, ...
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$group_vars
      [1] ".pop_group" "group1"     "group2"    
      
      $meta$pop_flag_vars
      [1] "ITTFL" "SAFFL"
      
      $meta$event_group_var
      NULL
      
      $meta$event_group_vals
      character(0)
      
      $meta$total_vars
      [1] "group2"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 36 x 5
            .N .pop_group group1 group2 .lookup                   
         <int> <fct>      <fct>  <fct>  <chr>                     
       1     1 ITT        G1A    G2X    "ITT\u001dG1A\u001dG2X"   
       2     1 Safety     G1A    G2X    "Safety\u001dG1A\u001dG2X"
       3     1 Total      G1A    G2X    "Total\u001dG1A\u001dG2X" 
       4     2 ITT        G1B    G2X    "ITT\u001dG1B\u001dG2X"   
       5     1 Safety     G1B    G2X    "Safety\u001dG1B\u001dG2X"
       6     2 Total      G1B    G2X    "Total\u001dG1B\u001dG2X" 
       7     0 ITT        G1C    G2X    "ITT\u001dG1C\u001dG2X"   
       8     0 Safety     G1C    G2X    "Safety\u001dG1C\u001dG2X"
       9     0 Total      G1C    G2X    "Total\u001dG1C\u001dG2X" 
      10     3 ITT        Total  G2X    "ITT\u001dTotal\u001dG2X" 
      # i 26 more rows
      
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
        <p>Event count by Level 1, Level 2; group by Group 1, Group 2; flag by </p>
        <table class="table event-count">
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center short-border" colspan="9">
              <span>ITT</span>
            </th>
            <th class="text-center short-border" colspan="9">
              <span>Safety</span>
            </th>
          </tr>
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1A</span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1B</span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1C</span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1A</span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1B</span>
            </th>
            <th class="text-center short-border" colspan="3">
              <span>G1C</span>
            </th>
          </tr>
          <tr>
            <th class="text-center">
              <span></span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2X
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                G2Z
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                Total
                <br/>
                (N = 0)
              </span>
            </th>
          </tr>
          <tr row-id="1" class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Subjects with any event">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Subjects with any event
              </span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="2" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="A1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                A1
              </span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">2 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="5" class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="B1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                B1
              </span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="B2">B2</span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">1 ( 50.00 %)</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="A2">A2</span>
            </td>
            <td class="text-center" column="ITTG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="ITTG1BG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1BTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="ITTG1CTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1AG2X" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1AG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1ATotal" style="white-space: nowrap;">1 ( 100.00 %)</td>
            <td class="text-center" column="SafetyG1BG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1BTotal" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2X" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CG2Z" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SafetyG1CTotal" style="white-space: nowrap;">0</td>
          </tr>
        </table>
      </div>

