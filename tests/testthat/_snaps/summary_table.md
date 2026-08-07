# generate summary table (compare with snapshot)__spec_ids{summary_table$numerical_summary;summary_table$categorical_summary;summary_table$pop_groups;summary_table$row_groups;summary_table$stats_functions;summary_table$stats_format;summary_table$stats_labels;summary_table$stats_replace;summary_table$total_pop_group;summary_table$total_pop_group_label;summary_table$categorical_n;summary_table$drop_numerical_na;summary_table$denominator}

    Code
      st1_compute
    Output
      $df
      # A tibble: 64 x 15
         param visit `\035anl_var`  `\035stat`  `A\035F`     `A\035M`     `B\035F`    
         <fct> <fct> <chr>          <chr>       <list>       <list>       <list>      
       1 ALT   1     Analysis Value n           <named list> <named list> <named list>
       2 ALT   1     Analysis Value Mean (SD)   <named list> <named list> <named list>
       3 ALT   1     Analysis Value Mean 95% CI <named list> <named list> <named list>
       4 ALT   1     Analysis Value Geometric ~ <named list> <named list> <named list>
       5 ALT   1     Analysis Value Min - Max   <named list> <named list> <named list>
       6 ALT   2     Analysis Value n           <named list> <named list> <named list>
       7 ALT   2     Analysis Value Mean (SD)   <named list> <named list> <named list>
       8 ALT   2     Analysis Value Mean 95% CI <named list> <named list> <named list>
       9 ALT   2     Analysis Value Geometric ~ <named list> <named list> <named list>
      10 ALT   2     Analysis Value Min - Max   <named list> <named list> <named list>
      # i 54 more rows
      # i 8 more variables: `B\035M` <list>, `C\035F` <list>, `C\035M` <list>,
      #   `All\035F` <list>, `All\035M` <list>, `\035first.\035anl_var` <lgl>,
      #   `\035first.param` <lgl>, `\035first.visit` <lgl>
      
      $meta
      $meta$anl_vars
      [1] "aval" "flag"
      
      $meta$group_vars
      [1] "arm" "sex"
      
      $meta$row_vars
      [1] "param" "visit"
      
      $meta$pop_flag_vars
      NULL
      
      $meta$flag_columns
      [1] "\035first.\035anl_var" "\035first.param"       "\035first.visit"      
      
      $meta$data_columns
      [1] "A\035F"   "A\035M"   "B\035F"   "B\035M"   "C\035F"   "C\035M"   "All\035F"
      [8] "All\035M"
      
      $meta$total_group_val
      [1] "All"
      
      $meta$denom_df
      # A tibble: 8 x 4
        arm   sex      .N .lookup     
        <fct> <fct> <int> <chr>       
      1 A     F         1 "A\u001dF"  
      2 A     M         2 "A\u001dM"  
      3 B     F         2 "B\u001dF"  
      4 B     M         0 "B\u001dM"  
      5 C     F         0 "C\u001dF"  
      6 C     M         1 "C\u001dM"  
      7 All   F         3 "All\u001dF"
      8 All   M         3 "All\u001dM"
      
      $meta$aggregate_flag
      [1] FALSE
      
      $meta$aggregate_func_name
      [1] "dplyr::first"
      
      

---

    Code
      st1_html
    Output
      <div>
        <p>Summary of aval, flag; row by param, visit; group by arm, sex</p>
        <table class="table event-count">
          <tr>
            <th class="text-center"></th>
            <th class="text-center short-border" colspan="2">
              <span>A</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>B</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>C</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>All</span>
            </th>
          </tr>
          <tr>
            <th class="text-center"></th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 0)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 3)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 3)
              </span>
            </th>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Analysis Value">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Analysis Value
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="ALT">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                ALT
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="1" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">3</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="2" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6 (—)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">17.3 (6.6)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">46.3 (8.1)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">43.1 (8.0)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">33.8 (29.0)</td>
          </tr>
          <tr row-id="3" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-42.14, 76.81)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">(-26.35, 119.03)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">(23.18, 63.01)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-38.14, 105.84)</td>
          </tr>
          <tr row-id="4" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">16.7</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">46.0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">42.6</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">26.5</td>
          </tr>
          <tr row-id="5" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6 - 36.6</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">12.7 - 22.0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">40.6 - 52.1</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9 - 66.9</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">36.6 - 52.1</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">12.7 - 66.9</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="6" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="7" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3 (—)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">21.4 (10.8)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8 (—)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">44.0 (10.9)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">35.5 (25.7)</td>
          </tr>
          <tr row-id="8" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-75.61, 118.32)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">(-54.28, 142.34)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-28.30, 99.33)</td>
          </tr>
          <tr row-id="9" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.9</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">43.3</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">29.4</td>
          </tr>
          <tr row-id="10" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3 - 36.3</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">13.7 - 29.0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8 - 51.8</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8 - 63.8</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">36.3 - 51.8</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">13.7 - 63.8</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="3">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                3
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="11" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="12" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">22.6 (9.7)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">37.6 (26.9)</td>
          </tr>
          <tr row-id="13" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-64.57, 109.74)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-29.28, 104.53)</td>
          </tr>
          <tr row-id="14" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">21.5</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">31.5</td>
          </tr>
          <tr row-id="15" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">15.7 - 29.4</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7 - 67.7</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">15.7 - 67.7</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="16" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1</td>
          </tr>
          <tr row-id="17" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1 (—)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1 (—)</td>
          </tr>
          <tr row-id="18" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">—</td>
          </tr>
          <tr row-id="19" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1</td>
          </tr>
          <tr row-id="20" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1 - 19.1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1 - 19.1</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="AST">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                AST
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="21" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">3</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="22" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6 (—)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">17.3 (6.6)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">46.3 (8.1)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">43.1 (8.0)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">33.8 (29.0)</td>
          </tr>
          <tr row-id="23" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-42.14, 76.81)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">(-26.35, 119.03)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">(23.18, 63.01)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-38.14, 105.84)</td>
          </tr>
          <tr row-id="24" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">16.7</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">46.0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">42.6</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">26.5</td>
          </tr>
          <tr row-id="25" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.6 - 36.6</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">12.7 - 22.0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">40.6 - 52.1</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">66.9 - 66.9</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">36.6 - 52.1</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">12.7 - 66.9</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="26" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="27" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3 (—)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">21.4 (10.8)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8 (—)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">44.0 (10.9)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">35.5 (25.7)</td>
          </tr>
          <tr row-id="28" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-75.61, 118.32)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">(-54.28, 142.34)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-28.30, 99.33)</td>
          </tr>
          <tr row-id="29" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.9</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">43.3</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">29.4</td>
          </tr>
          <tr row-id="30" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">36.3 - 36.3</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">13.7 - 29.0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">51.8 - 51.8</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">63.8 - 63.8</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">36.3 - 51.8</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">13.7 - 63.8</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="3">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                3
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="31" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3</td>
          </tr>
          <tr row-id="32" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">22.6 (9.7)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7 (—)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">37.6 (26.9)</td>
          </tr>
          <tr row-id="33" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">(-64.57, 109.74)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">(-29.28, 104.53)</td>
          </tr>
          <tr row-id="34" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">21.5</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">31.5</td>
          </tr>
          <tr row-id="35" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">15.7 - 29.4</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">67.7 - 67.7</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">15.7 - 67.7</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="36" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1</td>
          </tr>
          <tr row-id="37" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1 (—)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1 (—)</td>
          </tr>
          <tr row-id="38" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">—</td>
          </tr>
          <tr row-id="39" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1</td>
          </tr>
          <tr row-id="40" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">19.1 - 19.1</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">—</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">19.1 - 19.1</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Flag">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Flag
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="ALT">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                ALT
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="41" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">3 (100.0 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="42" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr row-id="43" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="44" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="45" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr row-id="46" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="3">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                3
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="47" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="48" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="49" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="50" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="51" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="52" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="AST">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                AST
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="53" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">3 (100.0 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="54" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr row-id="55" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="56" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="57" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">2 (66.7 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr row-id="58" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="3">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                3
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="59" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">3 (100.0 %)</td>
          </tr>
          <tr row-id="60" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">1 (33.3 %)</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="61" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">1 (33.3 %)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="62" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="63" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">1 (50.0 %)</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">1 (100.0 %)</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">2 (66.7 %)</td>
          </tr>
          <tr row-id="64" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="AF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="BM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="CM" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllF" style="white-space: nowrap;">0</td>
            <td class="text-center" column="AllM" style="white-space: nowrap;">0</td>
          </tr>
        </table>
      </div>

# generate aggregated summary table (compare with snapshot)__spec_ids{summary_table$numerical_summary;summary_table$categorical_summary;summary_table$pop_groups;summary_table$row_groups;summary_table$stats_functions;summary_table$stats_format;summary_table$stats_labels;summary_table$stats_replace;summary_table$total_pop_group;summary_table$total_pop_group_label;summary_table$drop_categorical_na;summary_table$drop_numerical_na;summary_table$denominator;summary_table$row_aggregate}

    Code
      st2_compute
    Output
      $df
      # A tibble: 12 x 8
         param `\035anl_var`  `\035stat`     A            B            C           
         <fct> <chr>          <chr>          <list>       <list>       <list>      
       1 ALT   Analysis Value n              <named list> <named list> <named list>
       2 ALT   Analysis Value Mean (SD)      <named list> <named list> <named list>
       3 ALT   Analysis Value Mean 95% CI    <named list> <named list> <named list>
       4 ALT   Analysis Value Geometric Mean <named list> <named list> <named list>
       5 ALT   Analysis Value Min - Max      <named list> <named list> <named list>
       6 AST   Analysis Value n              <named list> <named list> <named list>
       7 AST   Analysis Value Mean (SD)      <named list> <named list> <named list>
       8 AST   Analysis Value Mean 95% CI    <named list> <named list> <named list>
       9 AST   Analysis Value Geometric Mean <named list> <named list> <named list>
      10 AST   Analysis Value Min - Max      <named list> <named list> <named list>
      11 ALT   Flag           Y              <named list> <named list> <named list>
      12 AST   Flag           Y              <named list> <named list> <named list>
      # i 2 more variables: `\035first.\035anl_var` <lgl>, `\035first.param` <lgl>
      
      $meta
      $meta$anl_vars
      [1] "aval" "flag"
      
      $meta$group_vars
      [1] "arm"
      
      $meta$row_vars
      [1] "param"
      
      $meta$pop_flag_vars
      NULL
      
      $meta$flag_columns
      [1] "\035first.\035anl_var" "\035first.param"      
      
      $meta$data_columns
      [1] "A" "B" "C"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 3 x 3
        arm      .N .lookup
        <fct> <int> <chr>  
      1 A         3 A      
      2 B         2 B      
      3 C         1 C      
      
      $meta$aggregate_flag
      [1] TRUE
      
      $meta$aggregate_func_name
      [1] "dplyr::first"
      
      

---

    Code
      st2_html
    Output
      <div>
        <p>Summary of aval, flag; row by param; group by arm</p>
        <p>Note: Multiple results per subject per group, aggregated by dplyr::first</p>
        <table class="table event-count">
          <tr>
            <th class="text-center"></th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                A
                <br/>
                (N = 3)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                B
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                C
                <br/>
                (N = 1)
              </span>
            </th>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Analysis Value">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Analysis Value
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="ALT">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                ALT
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="1" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">3</td>
            <td class="text-center" column="B" style="white-space: nowrap;">2</td>
            <td class="text-center" column="C" style="white-space: nowrap;">1</td>
          </tr>
          <tr row-id="2" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">23.8 (12.1)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">46.3 (8.1)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9 (—)</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">(-6.23, 53.75)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">(-26.35, 119.03)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">—</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">21.7</td>
            <td class="text-center" column="B" style="white-space: nowrap;">46.0</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9</td>
          </tr>
          <tr row-id="5" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">12.7 - 36.6</td>
            <td class="text-center" column="B" style="white-space: nowrap;">40.6 - 52.1</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9 - 66.9</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="AST">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                AST
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">3</td>
            <td class="text-center" column="B" style="white-space: nowrap;">2</td>
            <td class="text-center" column="C" style="white-space: nowrap;">1</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">23.8 (12.1)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">46.3 (8.1)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9 (—)</td>
          </tr>
          <tr row-id="8" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">(-6.23, 53.75)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">(-26.35, 119.03)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">—</td>
          </tr>
          <tr row-id="9" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">21.7</td>
            <td class="text-center" column="B" style="white-space: nowrap;">46.0</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9</td>
          </tr>
          <tr row-id="10" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">12.7 - 36.6</td>
            <td class="text-center" column="B" style="white-space: nowrap;">40.6 - 52.1</td>
            <td class="text-center" column="C" style="white-space: nowrap;">66.9 - 66.9</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Flag">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Flag
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="ALT">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                ALT
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="11" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">3 (100.0 %)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">1 (100.0 %)</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="AST">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                AST
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="12" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="A" style="white-space: nowrap;">3 (100.0 %)</td>
            <td class="text-center" column="B" style="white-space: nowrap;">2 (100.0 %)</td>
            <td class="text-center" column="C" style="white-space: nowrap;">1 (100.0 %)</td>
          </tr>
        </table>
      </div>

# expanded population groups, multiple rows per subject - population summary table__spec_ids{summary_table$expanded_pop_groups;summary_table$numerical_summary;summary_table$categorical_summary;summary_table$total_pop_group;summary_table$denominator;summary_table$row_aggregate}

    Code
      st3_compute
    Output
      $df
      # A tibble: 27 x 6
         `\035anl_var`               `\035stat` SAFFL        SAFFL2       SAFFL3      
         <chr>                       <chr>      <list>       <list>       <list>      
       1 saf_flag                    Y          <named list> <named list> <named list>
       2 Sex                         F          <named list> <named list> <named list>
       3 Sex                         M          <named list> <named list> <named list>
       4 Age                         n          <named list> <named list> <named list>
       5 Age                         Mean (SD)  <named list> <named list> <named list>
       6 Age                         Mean 95% ~ <named list> <named list> <named list>
       7 Age                         Geometric~ <named list> <named list> <named list>
       8 Age                         Min - Max  <named list> <named list> <named list>
       9 Subject Identifier for the~ 1042       <named list> <named list> <named list>
      10 Subject Identifier for the~ 1076       <named list> <named list> <named list>
      # i 17 more rows
      # i 1 more variable: `\035first.\035anl_var` <lgl>
      
      $meta
      $meta$anl_vars
      [1] "saf_flag" "SEX"      "AGE"      "SUBJID"  
      
      $meta$group_vars
      [1] "saf_group"
      
      $meta$row_vars
      NULL
      
      $meta$pop_flag_vars
      NULL
      
      $meta$flag_columns
      [1] "\035first.\035anl_var"
      
      $meta$data_columns
      [1] "SAFFL"  "SAFFL2" "SAFFL3"
      
      $meta$total_group_val
      [1] "Total"
      
      $meta$denom_df
      # A tibble: 3 x 3
        saf_group    .N .lookup
        <fct>     <int> <chr>  
      1 SAFFL        18 SAFFL  
      2 SAFFL2       13 SAFFL2 
      3 SAFFL3       16 SAFFL3 
      
      $meta$aggregate_flag
      [1] FALSE
      
      $meta$aggregate_func_name
      [1] "mean"
      
      

---

    Code
      st3_html
    Output
      <div>
        <p>Summary of saf_flag, SEX, AGE, SUBJID; group by saf_group</p>
        <table class="table event-count">
          <tr>
            <th class="text-center"></th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                SAFFL
                <br/>
                (N = 18)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                SAFFL2
                <br/>
                (N = 13)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                SAFFL3
                <br/>
                (N = 16)
              </span>
            </th>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="saf_flag">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                saf_flag
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="1" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="Y">Y</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">18 (100.0 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">13 (100.0 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">16 (100.0 %)</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Sex">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Sex
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="2" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="F">F</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">12 (66.7 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">8 (61.5 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">9 (56.2 %)</td>
          </tr>
          <tr row-id="3" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="M">M</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">6 (33.3 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">5 (38.5 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">7 (43.8 %)</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Age">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Age
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="4" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">18</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">13</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">16</td>
          </tr>
          <tr row-id="5" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">75.9 (6.8)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">76.2 (7.3)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">75.4 (6.7)</td>
          </tr>
          <tr row-id="6" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="Mean 95% CI">Mean 95% CI</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">(72.56, 79.33)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">(71.84, 80.62)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">(71.79, 78.96)</td>
          </tr>
          <tr row-id="7" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="Geometric Mean">Geometric Mean</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">75.7</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">75.9</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">75.1</td>
          </tr>
          <tr row-id="8" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="Min - Max">Min - Max</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">64.0 - 88.0</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">64.0 - 88.0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">64.0 - 84.0</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Subject Identifier for the Study">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Subject Identifier for the Study
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="9" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1042">1042</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="10" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1076">1076</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="11" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1086">1086</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="12" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1096">1096</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="13" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1100">1100</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="14" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1119">1119</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="15" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1175">1175</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="16" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1182">1182</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="17" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1197">1197</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="18" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1210">1210</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="19" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1258">1258</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="20" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1279">1279</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="21" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1295">1295</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="22" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1299">1299</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="23" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1335">1335</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="24" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1379">1379</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="25" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1396">1396</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">0</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="26" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1403">1403</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
          <tr row-id="27" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="1439">1439</span>
            </td>
            <td class="text-center" column="SAFFL" style="white-space: nowrap;">1 (5.6 %)</td>
            <td class="text-center" column="SAFFL2" style="white-space: nowrap;">1 (7.7 %)</td>
            <td class="text-center" column="SAFFL3" style="white-space: nowrap;">1 (6.2 %)</td>
          </tr>
        </table>
      </div>

# a summary table is displayed__spec_ids{summary_table$summary_table_display}

    Code
      st_output_html
    Output
      <div>
        <p>Summary of AVAL, ATOXGR; row by PARAM, VISIT; group by ARM, SEX</p>
        <table class="table event-count">
          <tr>
            <th class="text-center"></th>
            <th class="text-center short-border" colspan="2">
              <span>Placebo</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>Screen Failure</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>Xanomeline High Dose</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>Xanomeline Low Dose</span>
            </th>
            <th class="text-center short-border" colspan="2">
              <span>Total</span>
            </th>
          </tr>
          <tr>
            <th class="text-center"></th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 53)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 33)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 36)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 16)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 40)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 44)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 50)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 34)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                F
                <br/>
                (N = 179)
              </span>
            </th>
            <th class="text-center" style="vertical-align: bottom;">
              <span>
                M
                <br/>
                (N = 127)
              </span>
            </th>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Analysis Value">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Analysis Value
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Alanine Aminotransferase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Alanine Aminotransferase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="1" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
          </tr>
          <tr row-id="2" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.5 (10.8)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.8 (6.1)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">16.5 (6.0)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.7 (12.2)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.6 (9.3)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">18.4 (8.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.2 (9.1)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">19.5 (9.5)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="3" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">134</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107</td>
          </tr>
          <tr row-id="4" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">18.7 (15.3)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.0 (6.5)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.9 (6.5)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.7 (9.8)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">20.1 (12.1)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.9 (8.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">19.0 (12.2)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.1 (8.8)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="5" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">126</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97</td>
          </tr>
          <tr row-id="6" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">18.2 (15.4)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">19.3 (7.7)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">19.1 (6.9)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.4 (11.2)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.2 (8.7)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">18.1 (5.8)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">18.1 (11.3)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">20.5 (9.0)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="7" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90</td>
          </tr>
          <tr row-id="8" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">16.7 (11.6)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.4 (7.0)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.7 (5.5)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.3 (11.2)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.1 (9.1)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">16.8 (6.1)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">17.1 (9.3)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">19.9 (9.3)</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Alkaline Phosphatase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Alkaline Phosphatase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="9" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">39</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">139</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
          </tr>
          <tr row-id="10" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">83.0 (72.3)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">69.2 (18.7)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">77.4 (53.2)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">65.4 (17.7)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">75.1 (21.2)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">70.9 (20.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">78.7 (54.0)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">68.2 (18.7)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="11" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">51</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">135</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107</td>
          </tr>
          <tr row-id="12" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">84.6 (87.6)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">67.0 (18.5)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">76.6 (55.5)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">68.2 (17.4)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">74.1 (22.8)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">71.3 (20.6)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">78.7 (62.4)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">68.8 (18.7)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="13" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">128</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">98</td>
          </tr>
          <tr row-id="14" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">84.7 (87.5)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">67.6 (17.8)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">76.5 (55.7)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">66.5 (16.7)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">73.0 (22.9)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">73.3 (24.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">78.5 (63.1)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">68.9 (19.5)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="15" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">38</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">26</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">114</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">92</td>
          </tr>
          <tr row-id="16" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">70.0 (24.7)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">66.2 (16.1)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">76.8 (59.2)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">66.7 (20.4)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">72.7 (23.7)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">72.7 (22.8)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">72.8 (37.2)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">68.2 (19.8)</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Aspartate Aminotransferase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Aspartate Aminotransferase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="17" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
          </tr>
          <tr row-id="18" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.4 (8.4)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.5 (5.5)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.7 (5.9)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.5 (7.3)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.5 (9.1)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.4 (7.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.6 (8.0)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.9 (6.7)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="19" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">134</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107</td>
          </tr>
          <tr row-id="20" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25.0 (15.3)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.5 (4.8)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.4 (5.0)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.4 (5.4)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.7 (9.6)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.8 (5.2)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.4 (11.2)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.2 (5.3)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="21" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">126</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97</td>
          </tr>
          <tr row-id="22" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.4 (18.2)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.2 (7.6)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.2 (5.1)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.5 (6.5)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.6 (8.0)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.0 (4.3)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.7 (12.4)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.0 (6.3)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="23" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90</td>
          </tr>
          <tr row-id="24" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.3 (7.1)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">21.6 (5.3)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.3 (4.7)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24.8 (9.8)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.1 (7.5)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.2 (3.4)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">22.5 (6.6)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">23.0 (7.2)</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Bilirubin (umol/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Bilirubin (umol/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="25" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
          </tr>
          <tr row-id="26" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.1 (4.2)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.7 (3.3)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.6 (3.8)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">12.4 (6.2)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.6 (2.9)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.6 (5.0)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.1 (3.7)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.3 (5.2)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="27" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">46</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">133</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107</td>
          </tr>
          <tr row-id="28" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.0 (15.6)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.6 (3.7)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.2 (2.9)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.6 (4.4)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.7 (3.7)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.3 (4.6)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.7 (9.9)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.9 (4.3)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="29" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">125</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97</td>
          </tr>
          <tr row-id="30" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.8 (17.1)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.6 (4.7)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.2 (3.0)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">12.4 (7.0)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.1 (2.7)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">10.7 (4.7)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.5 (10.8)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.7 (5.6)</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="31" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90</td>
          </tr>
          <tr row-id="32" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="Mean (SD)">Mean (SD)</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.3 (2.7)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.4 (4.4)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">—</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">9.5 (3.6)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">12.1 (5.6)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.3 (3.2)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.1 (4.6)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8.7 (3.2)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">11.6 (4.9)</td>
          </tr>
          <tr class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Analysis Toxicity Grade">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Analysis Toxicity Grade
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Alanine Aminotransferase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Alanine Aminotransferase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="33" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53 (100.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (100.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (100.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (96.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (100.0 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141 (78.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (87.4 %)</td>
          </tr>
          <tr row-id="34" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50 (94.3 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (97.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">39 (97.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (90.9 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">136 (76.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">105 (82.7 %)</td>
          </tr>
          <tr row-id="35" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (5.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (3.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">4 (9.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (2.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (4.7 %)</td>
          </tr>
          <tr row-id="36" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="37" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="38" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="39" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50 (94.3 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (92.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41 (93.2 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">134 (74.9 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (84.3 %)</td>
          </tr>
          <tr row-id="40" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (88.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">36 (90.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (88.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (94.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">127 (70.9 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">102 (80.3 %)</td>
          </tr>
          <tr row-id="41" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">4 (9.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (3.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (3.9 %)</td>
          </tr>
          <tr row-id="42" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="43" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="44" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="45" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (90.6 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (93.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (87.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (86.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">126 (70.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97 (76.4 %)</td>
          </tr>
          <tr row-id="46" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (83.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (90.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (82.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (77.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (84.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">119 (66.5 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">93 (73.2 %)</td>
          </tr>
          <tr row-id="47" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (5.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (3.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (5.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.8 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (3.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">4 (3.1 %)</td>
          </tr>
          <tr row-id="48" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="49" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="50" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="51" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (81.1 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (90.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (77.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (79.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (74.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (62.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90 (70.9 %)</td>
          </tr>
          <tr row-id="52" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (75.5 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (87.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (75.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (72.7 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (70.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">105 (58.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">86 (67.7 %)</td>
          </tr>
          <tr row-id="53" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (5.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (3.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.8 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (3.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">4 (3.1 %)</td>
          </tr>
          <tr row-id="54" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="55" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="56" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Alkaline Phosphatase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Alkaline Phosphatase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="57" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53 (100.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">39 (97.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (100.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (100.0 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">139 (77.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (87.4 %)</td>
          </tr>
          <tr row-id="58" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">49 (92.5 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">38 (95.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (100.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">45 (90.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">132 (73.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">110 (86.6 %)</td>
          </tr>
          <tr row-id="59" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (5.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (2.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.8 %)</td>
          </tr>
          <tr row-id="60" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (1.1 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="61" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="62" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="63" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">51 (96.2 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (92.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41 (93.2 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">135 (75.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (84.3 %)</td>
          </tr>
          <tr row-id="64" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (90.6 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">36 (90.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (90.9 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (88.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (94.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">128 (71.5 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">105 (82.7 %)</td>
          </tr>
          <tr row-id="65" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (2.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (1.6 %)</td>
          </tr>
          <tr row-id="66" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="67" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="68" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="69" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50 (94.3 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (97.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (87.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (86.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">128 (71.5 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">98 (77.2 %)</td>
          </tr>
          <tr row-id="70" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">46 (86.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (97.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (85.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (80.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">28 (82.4 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">120 (67.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97 (76.4 %)</td>
          </tr>
          <tr row-id="71" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (5.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (3.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.8 %)</td>
          </tr>
          <tr row-id="72" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="73" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="74" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="75" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (83.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (93.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (80.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (79.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">38 (76.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">26 (76.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">114 (63.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">92 (72.4 %)</td>
          </tr>
          <tr row-id="76" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (79.2 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (93.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (75.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (77.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (70.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (59.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90 (70.9 %)</td>
          </tr>
          <tr row-id="77" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (3.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (1.6 %)</td>
          </tr>
          <tr row-id="78" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="79" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="80" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Aspartate Aminotransferase (U/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Aspartate Aminotransferase (U/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="81" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53 (100.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (100.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (100.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (96.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (100.0 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141 (78.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (87.4 %)</td>
          </tr>
          <tr row-id="82" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (90.6 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (97.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">38 (95.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (95.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (86.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (94.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">129 (72.1 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">106 (83.5 %)</td>
          </tr>
          <tr row-id="83" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (9.4 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (3.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (5.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (10.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (5.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">12 (6.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (3.9 %)</td>
          </tr>
          <tr row-id="84" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="85" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="86" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="87" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50 (94.3 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (92.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41 (93.2 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">134 (74.9 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (84.3 %)</td>
          </tr>
          <tr row-id="88" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (88.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">36 (90.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (90.9 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (84.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (94.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">125 (69.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">105 (82.7 %)</td>
          </tr>
          <tr row-id="89" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (10.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8 (4.5 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (1.6 %)</td>
          </tr>
          <tr row-id="90" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="91" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="92" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="93" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (90.6 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (93.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (87.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (86.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">126 (70.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97 (76.4 %)</td>
          </tr>
          <tr row-id="94" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">45 (84.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (87.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (85.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">36 (81.8 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">38 (76.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">117 (65.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">94 (74.0 %)</td>
          </tr>
          <tr row-id="95" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (6.1 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (10.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">8 (4.5 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (2.4 %)</td>
          </tr>
          <tr row-id="96" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="97" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="98" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="99" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (81.1 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (90.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (77.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (79.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (74.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (62.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90 (70.9 %)</td>
          </tr>
          <tr row-id="100" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (79.2 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (90.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (75.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (77.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (70.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (59.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">89 (70.1 %)</td>
          </tr>
          <tr row-id="101" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">4 (2.2 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.8 %)</td>
          </tr>
          <tr row-id="102" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="103" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="104" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-1 bg-gray" indent="1">
            <td>
              <span class="truncate" title="Bilirubin (umol/L)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Bilirubin (umol/L)
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="SCREENING 1">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SCREENING 1
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="105" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">53 (100.0 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">40 (100.0 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">44 (100.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (96.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">34 (100.0 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">141 (78.8 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (87.4 %)</td>
          </tr>
          <tr row-id="106" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">51 (96.2 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">39 (97.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41 (93.2 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (96.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (91.2 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">138 (77.1 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">105 (82.7 %)</td>
          </tr>
          <tr row-id="107" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (3.8 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (8.8 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (1.7 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">5 (3.9 %)</td>
          </tr>
          <tr row-id="108" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.8 %)</td>
          </tr>
          <tr row-id="109" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="110" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 2">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 2
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="111" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">50 (94.3 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (92.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">41 (93.2 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (94.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (97.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">134 (74.9 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">107 (84.3 %)</td>
          </tr>
          <tr row-id="112" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">49 (92.5 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (100.0 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (92.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">39 (88.6 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">45 (90.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (94.1 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">131 (73.2 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">104 (81.9 %)</td>
          </tr>
          <tr row-id="113" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (4.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (2.4 %)</td>
          </tr>
          <tr row-id="114" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="115" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="116" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 4">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 4
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="117" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">48 (90.6 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (93.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (87.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (84.1 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (86.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (85.3 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">126 (70.4 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">97 (76.4 %)</td>
          </tr>
          <tr row-id="118" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">47 (88.7 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">29 (87.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (87.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">33 (75.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">42 (84.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">28 (82.4 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">124 (69.3 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90 (70.9 %)</td>
          </tr>
          <tr row-id="119" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (6.1 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.8 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (4.7 %)</td>
          </tr>
          <tr row-id="120" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.3 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.8 %)</td>
          </tr>
          <tr row-id="121" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (1.9 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="122" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (0.6 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr class="indent-2 bg-gray" indent="2">
            <td>
              <span class="truncate" title="WEEK 6">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                WEEK 6
              </span>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr row-id="123" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="n">n</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (81.1 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">30 (90.9 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (77.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">35 (79.5 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (74.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">25 (73.5 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (62.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">90 (70.9 %)</td>
          </tr>
          <tr row-id="124" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="0">0</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">43 (81.1 %)</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">28 (84.8 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">31 (77.5 %)</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">32 (72.7 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">37 (74.0 %)</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">24 (70.6 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">111 (62.0 %)</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">84 (66.1 %)</td>
          </tr>
          <tr row-id="125" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="1">1</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">2 (6.1 %)</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">3 (6.8 %)</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">1 (2.9 %)</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">6 (4.7 %)</td>
          </tr>
          <tr row-id="126" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="2">2</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="127" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="3">3</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
          <tr row-id="128" class="indent-3" indent="3">
            <td>
              <span class="truncate" title="&lt;NA&gt;">&lt;NA&gt;</span>
            </td>
            <td class="text-center" column="PlaceboF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="PlaceboM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Screen FailureM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline High DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="Xanomeline Low DoseM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalF" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
            <td class="text-center" column="TotalM" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column: this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})" style="white-space: nowrap;">0</td>
          </tr>
        </table>
      </div>
      <script>
          requestAnimationFrame(() => { // repaint preceding the table render
            requestAnimationFrame(() => { // repaint following the table render
              Shiny.setInputValue('mod-render_completion_callback', 'done', {priority: 'event'});
            });
          });
          </script>

