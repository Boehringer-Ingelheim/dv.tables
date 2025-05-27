# counting is correct, sorting, against (snapshot)__spec_ids{hierarchical_count_table$event_count;hierarchical_count_table$event_count_display;hierarchical_count_table$sorted_table_display;hierarchical_count_table$total_column_display}

    Code
      x
    Output
      $df
      # A tibble: 28 x 7
         lvl2  lvl1  group     N subjid     perc `\035lvl`
         <fct> <fct> <fct> <int> <list>    <dbl>     <dbl>
       1 A2    A1    GA        1 <fct [1]>   100         1
       2 A2    A1    GB        1 <fct [1]>   100         1
       3 A2    A1    GC        1 <fct [1]>    50         1
       4 A2    B1    GA        1 <fct [1]>   100         1
       5 A2    B1    GB        0 <chr [0]>     0         1
       6 A2    B1    GC        0 <chr [0]>     0         1
       7 B2    A1    GA        1 <fct [1]>   100         1
       8 B2    A1    GB        1 <fct [1]>   100         1
       9 B2    A1    GC        0 <chr [0]>     0         1
      10 B2    B1    GA        1 <fct [1]>   100         1
      # i 18 more rows
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$group_var
      [1] "group"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$special_char
      [1] "\035"
      
      $meta$n_denominator
         GA    GB    GC Total 
          1     1     2     4 
      
      

# filtering is correct, agains (snapshot)__spec_ids{hierarchical_count_table$minimum_percentage_filter}

    Code
      w
    Output
      $df
      # A tibble: 7 x 6
        lvl1     lvl2     GA               GB               GC           Total       
        <fct>    <fct>    <list>           <list>           <list>       <list>      
      1 "A1"     "A2"     <named list [2]> <named list [2]> <named list> <named list>
      2 "B1"     "A2"     <named list [2]> <named list [2]> <named list> <named list>
      3 "A1"     "B2"     <named list [2]> <named list [2]> <named list> <named list>
      4 "B1"     "B2"     <named list [2]> <named list [2]> <named list> <named list>
      5 "A1"     "\u001d" <named list [2]> <named list [2]> <named list> <named list>
      6 "B1"     "\u001d" <named list [2]> <named list [2]> <named list> <named list>
      7 "\u001d" "\u001d" <named list [2]> <named list [2]> <named list> <named list>
      
      $meta
      $meta$hierarchy
      [1] "lvl1" "lvl2"
      
      $meta$group_var
      [1] "group"
      
      $meta$hier_lvl_col
      [1] "\035lvl"
      
      $meta$special_char
      [1] "\035"
      
      $meta$n_denominator
         GA    GB    GC Total 
          1     1     2     4 
      
      

# a count table is displayed__spec_ids{hierarchical_count_table$events_table_display}

    Code
      tb
    Output
      <div>
        <p>Event count by AEBODSYS, AETERM</p>
        <table class="table event-count">
          <tr class="no-border">
            <th class="text-center">
              <span>
                
                <br/>
                
              </span>
            </th>
            <th class="text-center">
              <span>
                F
                <br/>
                (N = 179)
              </span>
            </th>
            <th class="text-center">
              <span>
                M
                <br/>
                (N = 127)
              </span>
            </th>
            <th class="text-center">
              <span>
                Total
                <br/>
                (N = 306)
              </span>
            </th>
          </tr>
          <tr row-id="1" class="indent-0" indent="0">
            <td>
              <span class="truncate" title="Overall">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Overall
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">121 ( 67.60 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">104 ( 81.89 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">225 ( 73.53 %)</td>
          </tr>
          <tr row-id="2" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                GENERAL DISORDERS AND ADMINISTRATION SITE CONDITIONS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">57 ( 31.84 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">51 ( 40.16 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">108 ( 35.29 %)</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE PRURITUS">APPLICATION SITE PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">26 ( 14.53 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">24 ( 18.90 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">50 ( 16.34 %)</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE ERYTHEMA">APPLICATION SITE ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 6.70 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">18 ( 14.17 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">30 ( 9.80 %)</td>
          </tr>
          <tr row-id="5" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE IRRITATION">APPLICATION SITE IRRITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 7.82 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 5.51 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">21 ( 6.86 %)</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE DERMATITIS">APPLICATION SITE DERMATITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 6.15 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">21 ( 6.86 %)</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FATIGUE">FATIGUE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 3.59 %)</td>
          </tr>
          <tr row-id="8" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE VESICLES">APPLICATION SITE VESICLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 5.51 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 3.59 %)</td>
          </tr>
          <tr row-id="9" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="OEDEMA PERIPHERAL">OEDEMA PERIPHERAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="10" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PYREXIA">PYREXIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="11" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MALAISE">MALAISE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="12" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CHILLS">CHILLS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="13" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE URTICARIA">APPLICATION SITE URTICARIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="14" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE SWELLING">APPLICATION SITE SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="15" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PAIN">PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="16" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="OEDEMA">OEDEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="17" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CHEST PAIN">CHEST PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="18" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CHEST DISCOMFORT">CHEST DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="19" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ASTHENIA">ASTHENIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="20" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE REACTION">APPLICATION SITE REACTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="21" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE PERSPIRATION">APPLICATION SITE PERSPIRATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="22" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE PAIN">APPLICATION SITE PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="23" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ULCER">ULCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="24" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SWELLING">SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="25" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SUDDEN DEATH">SUDDEN DEATH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="26" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SECRETION DISCHARGE">SECRETION DISCHARGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="27" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="INFLAMMATION">INFLAMMATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="28" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FEELING COLD">FEELING COLD</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="29" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FEELING ABNORMAL">FEELING ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="30" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CYST">CYST</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="31" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE WARMTH">APPLICATION SITE WARMTH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="32" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE INDURATION">APPLICATION SITE INDURATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="33" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE DISCOLOURATION">APPLICATION SITE DISCOLOURATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="34" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE DISCHARGE">APPLICATION SITE DISCHARGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="35" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE DESQUAMATION">APPLICATION SITE DESQUAMATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="36" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="APPLICATION SITE BLEEDING">APPLICATION SITE BLEEDING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="37" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="SKIN AND SUBCUTANEOUS TISSUE DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SKIN AND SUBCUTANEOUS TISSUE DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">51 ( 28.49 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">54 ( 42.52 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">105 ( 34.31 %)</td>
          </tr>
          <tr row-id="38" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PRURITUS">PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">30 ( 16.76 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">27 ( 21.26 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">57 ( 18.63 %)</td>
          </tr>
          <tr row-id="39" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ERYTHEMA">ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 12.29 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 12.60 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">38 ( 12.42 %)</td>
          </tr>
          <tr row-id="40" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RASH">RASH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 7.26 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 12.60 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">29 ( 9.48 %)</td>
          </tr>
          <tr row-id="41" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN IRRITATION">SKIN IRRITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="42" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERHIDROSIS">HYPERHIDROSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 7.09 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="43" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLISTER">BLISTER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="44" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RASH PRURITIC">RASH PRURITIC</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="45" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="URTICARIA">URTICARIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="46" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RASH ERYTHEMATOUS">RASH ERYTHEMATOUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="47" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PRURITUS GENERALISED">PRURITUS GENERALISED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="48" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN ULCER">SKIN ULCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="49" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN ODOUR ABNORMAL">SKIN ODOUR ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="50" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN EXFOLIATION">SKIN EXFOLIATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="51" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RASH PAPULAR">RASH PAPULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="52" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RASH MACULO-PAPULAR">RASH MACULO-PAPULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="53" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DRUG ERUPTION">DRUG ERUPTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="54" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DERMATITIS CONTACT">DERMATITIS CONTACT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="55" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DERMATITIS ATOPIC">DERMATITIS ATOPIC</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="56" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COLD SWEAT">COLD SWEAT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="57" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ALOPECIA">ALOPECIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="58" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ACTINIC KERATOSIS">ACTINIC KERATOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="59" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="NERVOUS SYSTEM DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                NERVOUS SYSTEM DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">26 ( 14.53 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">33 ( 25.98 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">59 ( 19.28 %)</td>
          </tr>
          <tr row-id="60" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DIZZINESS">DIZZINESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 10.24 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 7.19 %)</td>
          </tr>
          <tr row-id="61" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HEADACHE">HEADACHE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 4.47 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 6.30 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 5.23 %)</td>
          </tr>
          <tr row-id="62" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SYNCOPE">SYNCOPE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 2.29 %)</td>
          </tr>
          <tr row-id="63" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SOMNOLENCE">SOMNOLENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 4.72 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="64" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="TRANSIENT ISCHAEMIC ATTACK">TRANSIENT ISCHAEMIC ATTACK</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="65" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="LETHARGY">LETHARGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="66" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BURNING SENSATION">BURNING SENSATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="67" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SYNCOPE VASOVAGAL">SYNCOPE VASOVAGAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="68" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="STUPOR">STUPOR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="69" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PSYCHOMOTOR HYPERACTIVITY">PSYCHOMOTOR HYPERACTIVITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="70" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PARTIAL SEIZURES WITH SECONDARY GENERALISATION">PARTIAL SEIZURES WITH SECONDARY GENERALISATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="71" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PAROSMIA">PAROSMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="72" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PARKINSON&#39;S DISEASE">PARKINSON'S DISEASE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="73" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PARAESTHESIA ORAL">PARAESTHESIA ORAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="74" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PARAESTHESIA">PARAESTHESIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="75" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERSOMNIA">HYPERSOMNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="76" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HEMIANOPIA HOMONYMOUS">HEMIANOPIA HOMONYMOUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="77" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COORDINATION ABNORMAL">COORDINATION ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="78" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COMPLEX PARTIAL SEIZURES">COMPLEX PARTIAL SEIZURES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="79" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COGNITIVE DISORDER">COGNITIVE DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="80" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BALANCE DISORDER">BALANCE DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="81" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="AMNESIA">AMNESIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="82" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="GASTROINTESTINAL DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                GASTROINTESTINAL DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">25 ( 13.97 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">28 ( 22.05 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">53 ( 17.32 %)</td>
          </tr>
          <tr row-id="83" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DIARRHOEA">DIARRHOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 9.45 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">18 ( 5.88 %)</td>
          </tr>
          <tr row-id="84" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VOMITING">VOMITING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 6.30 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 4.25 %)</td>
          </tr>
          <tr row-id="85" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NAUSEA">NAUSEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 3.92 %)</td>
          </tr>
          <tr row-id="86" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ABDOMINAL PAIN">ABDOMINAL PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="87" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SALIVARY HYPERSECRETION">SALIVARY HYPERSECRETION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="88" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DYSPEPSIA">DYSPEPSIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="89" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="STOMACH DISCOMFORT">STOMACH DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="90" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RECTAL HAEMORRHAGE">RECTAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="91" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HIATUS HERNIA">HIATUS HERNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="92" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="GLOSSITIS">GLOSSITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="93" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="GASTROOESOPHAGEAL REFLUX DISEASE">GASTROOESOPHAGEAL REFLUX DISEASE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="94" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="GASTROINTESTINAL HAEMORRHAGE">GASTROINTESTINAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="95" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FLATULENCE">FLATULENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="96" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DYSPHAGIA">DYSPHAGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="97" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CONSTIPATION">CONSTIPATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="98" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ABDOMINAL DISCOMFORT">ABDOMINAL DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="99" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="CARDIAC DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                CARDIAC DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 12.29 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 17.32 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">44 ( 14.38 %)</td>
          </tr>
          <tr row-id="100" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SINUS BRADYCARDIA">SINUS BRADYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 3.91 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">17 ( 5.56 %)</td>
          </tr>
          <tr row-id="101" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MYOCARDIAL INFARCTION">MYOCARDIAL INFARCTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 3.91 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 3.27 %)</td>
          </tr>
          <tr row-id="102" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ATRIOVENTRICULAR BLOCK SECOND DEGREE">ATRIOVENTRICULAR BLOCK SECOND DEGREE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="103" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ATRIAL FIBRILLATION">ATRIAL FIBRILLATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="104" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VENTRICULAR EXTRASYSTOLES">VENTRICULAR EXTRASYSTOLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="105" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SUPRAVENTRICULAR EXTRASYSTOLES">SUPRAVENTRICULAR EXTRASYSTOLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="106" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PALPITATIONS">PALPITATIONS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="107" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BUNDLE BRANCH BLOCK RIGHT">BUNDLE BRANCH BLOCK RIGHT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="108" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ATRIOVENTRICULAR BLOCK FIRST DEGREE">ATRIOVENTRICULAR BLOCK FIRST DEGREE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="109" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ATRIAL FLUTTER">ATRIAL FLUTTER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="110" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="WOLFF-PARKINSON-WHITE SYNDROME">WOLFF-PARKINSON-WHITE SYNDROME</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="111" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VENTRICULAR HYPERTROPHY">VENTRICULAR HYPERTROPHY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="112" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="TACHYCARDIA">TACHYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="113" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SUPRAVENTRICULAR TACHYCARDIA">SUPRAVENTRICULAR TACHYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="114" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SINUS ARRHYTHMIA">SINUS ARRHYTHMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="115" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CARDIAC FAILURE CONGESTIVE">CARDIAC FAILURE CONGESTIVE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="116" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CARDIAC DISORDER">CARDIAC DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="117" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BUNDLE BRANCH BLOCK LEFT">BUNDLE BRANCH BLOCK LEFT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="118" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BRADYCARDIA">BRADYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="119" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ATRIAL HYPERTROPHY">ATRIAL HYPERTROPHY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="120" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="INFECTIONS AND INFESTATIONS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                INFECTIONS AND INFESTATIONS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">20 ( 11.17 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">19 ( 14.96 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">39 ( 12.75 %)</td>
          </tr>
          <tr row-id="121" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NASOPHARYNGITIS">NASOPHARYNGITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 4.47 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 3.92 %)</td>
          </tr>
          <tr row-id="122" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="UPPER RESPIRATORY TRACT INFECTION">UPPER RESPIRATORY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 3.27 %)</td>
          </tr>
          <tr row-id="123" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="URINARY TRACT INFECTION">URINARY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="124" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="INFLUENZA">INFLUENZA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="125" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="LOCALISED INFECTION">LOCALISED INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="126" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EAR INFECTION">EAR INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="127" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CYSTITIS">CYSTITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="128" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VIRAL INFECTION">VIRAL INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="129" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VAGINAL MYCOSIS">VAGINAL MYCOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="130" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RHINITIS">RHINITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="131" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PNEUMONIA">PNEUMONIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="132" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ONYCHOMYCOSIS">ONYCHOMYCOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="133" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="LOWER RESPIRATORY TRACT INFECTION">LOWER RESPIRATORY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="134" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HORDEOLUM">HORDEOLUM</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="135" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="GASTROENTERITIS VIRAL">GASTROENTERITIS VIRAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="136" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CERVICITIS">CERVICITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="137" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CELLULITIS">CELLULITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="138" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BRONCHITIS">BRONCHITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="139" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="RESPIRATORY, THORACIC AND MEDIASTINAL DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                RESPIRATORY, THORACIC AND MEDIASTINAL DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 6.15 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">19 ( 14.96 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">30 ( 9.80 %)</td>
          </tr>
          <tr row-id="140" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COUGH">COUGH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 7.09 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="141" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NASAL CONGESTION">NASAL CONGESTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 4.72 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 2.29 %)</td>
          </tr>
          <tr row-id="142" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EPISTAXIS">EPISTAXIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="143" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DYSPNOEA">DYSPNOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="144" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RHINORRHOEA">RHINORRHOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="145" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PHARYNGOLARYNGEAL PAIN">PHARYNGOLARYNGEAL PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="146" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RESPIRATORY TRACT CONGESTION">RESPIRATORY TRACT CONGESTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="147" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RALES">RALES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="148" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PRODUCTIVE COUGH">PRODUCTIVE COUGH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="149" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="POSTNASAL DRIP">POSTNASAL DRIP</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="150" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PHARYNGEAL ERYTHEMA">PHARYNGEAL ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="151" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HAEMOPTYSIS">HAEMOPTYSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="152" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EMPHYSEMA">EMPHYSEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="153" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DYSPHONIA">DYSPHONIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="154" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ALLERGIC GRANULOMATOUS ANGIITIS">ALLERGIC GRANULOMATOUS ANGIITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="155" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="PSYCHIATRIC DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                PSYCHIATRIC DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 7.82 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">15 ( 11.81 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">29 ( 9.48 %)</td>
          </tr>
          <tr row-id="156" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CONFUSIONAL STATE">CONFUSIONAL STATE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="157" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="AGITATION">AGITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="158" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="INSOMNIA">INSOMNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="159" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ANXIETY">ANXIETY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="160" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="IRRITABILITY">IRRITABILITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="161" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DEPRESSED MOOD">DEPRESSED MOOD</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="162" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DELUSION">DELUSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="163" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="RESTLESSNESS">RESTLESSNESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="164" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NIGHTMARE">NIGHTMARE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="165" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="LISTLESS">LISTLESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="166" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="LIBIDO DECREASED">LIBIDO DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="167" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HALLUCINATION, VISUAL">HALLUCINATION, VISUAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="168" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HALLUCINATION">HALLUCINATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="169" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DISORIENTATION">DISORIENTATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="170" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DELIRIUM">DELIRIUM</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="171" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COMPLETED SUICIDE">COMPLETED SUICIDE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="172" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="INVESTIGATIONS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                INVESTIGATIONS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 7.26 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">23 ( 7.52 %)</td>
          </tr>
          <tr row-id="173" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ELECTROCARDIOGRAM ST SEGMENT DEPRESSION">ELECTROCARDIOGRAM ST SEGMENT DEPRESSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="174" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ELECTROCARDIOGRAM T WAVE INVERSION">ELECTROCARDIOGRAM T WAVE INVERSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="175" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ELECTROCARDIOGRAM T WAVE AMPLITUDE DECREASED">ELECTROCARDIOGRAM T WAVE AMPLITUDE DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="176" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLOOD GLUCOSE INCREASED">BLOOD GLUCOSE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="177" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="WHITE BLOOD CELL COUNT INCREASED">WHITE BLOOD CELL COUNT INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="178" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="WEIGHT DECREASED">WEIGHT DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="179" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="URINE ANALYSIS ABNORMAL">URINE ANALYSIS ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="180" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NEUTROPHIL COUNT INCREASED">NEUTROPHIL COUNT INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="181" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NASAL MUCOSA BIOPSY">NASAL MUCOSA BIOPSY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="182" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HEART RATE IRREGULAR">HEART RATE IRREGULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="183" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HEART RATE INCREASED">HEART RATE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="184" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CYSTOSCOPY">CYSTOSCOPY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="185" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BODY TEMPERATURE INCREASED">BODY TEMPERATURE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="186" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLOOD URINE PRESENT">BLOOD URINE PRESENT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="187" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLOOD CREATINE PHOSPHOKINASE INCREASED">BLOOD CREATINE PHOSPHOKINASE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="188" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLOOD CHOLESTEROL INCREASED">BLOOD CHOLESTEROL INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="189" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BLOOD ALKALINE PHOSPHATASE INCREASED">BLOOD ALKALINE PHOSPHATASE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="190" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BIOPSY PROSTATE">BIOPSY PROSTATE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="191" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BIOPSY">BIOPSY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="192" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="MUSCULOSKELETAL AND CONNECTIVE TISSUE DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                MUSCULOSKELETAL AND CONNECTIVE TISSUE DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 5.59 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">20 ( 6.54 %)</td>
          </tr>
          <tr row-id="193" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BACK PAIN">BACK PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="194" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ARTHRALGIA">ARTHRALGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="195" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SHOULDER PAIN">SHOULDER PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="196" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MUSCLE SPASMS">MUSCLE SPASMS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="197" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FLANK PAIN">FLANK PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="198" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ARTHRITIS">ARTHRITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="199" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PAIN IN EXTREMITY">PAIN IN EXTREMITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="200" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MYALGIA">MYALGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="201" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MUSCULAR WEAKNESS">MUSCULAR WEAKNESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="202" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="INJURY, POISONING AND PROCEDURAL COMPLICATIONS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                INJURY, POISONING AND PROCEDURAL COMPLICATIONS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="203" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FALL">FALL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="204" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EXCORIATION">EXCORIATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="205" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CONTUSION">CONTUSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="206" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN LACERATION">SKIN LACERATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="207" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HIP FRACTURE">HIP FRACTURE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="208" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="WOUND">WOUND</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="209" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="JOINT DISLOCATION">JOINT DISLOCATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="210" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FACIAL BONES FRACTURE">FACIAL BONES FRACTURE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="211" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="RENAL AND URINARY DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                RENAL AND URINARY DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 4.72 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 3.59 %)</td>
          </tr>
          <tr row-id="212" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MICTURITION URGENCY">MICTURITION URGENCY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="213" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="NEPHROLITHIASIS">NEPHROLITHIASIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="214" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DYSURIA">DYSURIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="215" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="POLLAKIURIA">POLLAKIURIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="216" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="INCONTINENCE">INCONTINENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="217" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ENURESIS">ENURESIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="218" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CALCULUS URETHRAL">CALCULUS URETHRAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="219" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="METABOLISM AND NUTRITION DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                METABOLISM AND NUTRITION DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 3.27 %)</td>
          </tr>
          <tr row-id="220" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="INCREASED APPETITE">INCREASED APPETITE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="221" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="FOOD CRAVING">FOOD CRAVING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="222" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DECREASED APPETITE">DECREASED APPETITE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="223" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPONATRAEMIA">HYPONATRAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="224" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERCHOLESTEROLAEMIA">HYPERCHOLESTEROLAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="225" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DIABETES MELLITUS">DIABETES MELLITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="226" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="DEHYDRATION">DEHYDRATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="227" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="VASCULAR DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                VASCULAR DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 2.61 %)</td>
          </tr>
          <tr row-id="228" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPOTENSION">HYPOTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="229" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERTENSION">HYPERTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="230" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="WOUND HAEMORRHAGE">WOUND HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="231" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ORTHOSTATIC HYPOTENSION">ORTHOSTATIC HYPOTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="232" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HOT FLUSH">HOT FLUSH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="233" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="EYE DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                EYE DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 2.29 %)</td>
          </tr>
          <tr row-id="234" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VISION BLURRED">VISION BLURRED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="235" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CONJUNCTIVITIS">CONJUNCTIVITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="236" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="GLAUCOMA">GLAUCOMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="237" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EYE SWELLING">EYE SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="238" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EYE PRURITUS">EYE PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="239" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EYE ALLERGY">EYE ALLERGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="240" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CONJUNCTIVAL HAEMORRHAGE">CONJUNCTIVAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="241" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="SURGICAL AND MEDICAL PROCEDURES">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SURGICAL AND MEDICAL PROCEDURES
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="242" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CATARACT OPERATION">CATARACT OPERATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="243" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SKIN LESION EXCISION">SKIN LESION EXCISION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="244" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EYE LASER SURGERY">EYE LASER SURGERY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="245" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ACROCHORDON EXCISION">ACROCHORDON EXCISION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="246" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="EAR AND LABYRINTH DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                EAR AND LABYRINTH DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="247" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VERTIGO">VERTIGO</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="248" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="TINNITUS">TINNITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="249" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="EAR PAIN">EAR PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="250" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="CERUMEN IMPACTION">CERUMEN IMPACTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="251" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="REPRODUCTIVE SYSTEM AND BREAST DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                REPRODUCTIVE SYSTEM AND BREAST DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="252" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="BENIGN PROSTATIC HYPERPLASIA">BENIGN PROSTATIC HYPERPLASIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="253" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PELVIC PAIN">PELVIC PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="254" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="NEOPLASMS BENIGN, MALIGNANT AND UNSPECIFIED (INCL CYSTS AND POLYPS)">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                NEOPLASMS BENIGN, MALIGNANT AND UNSPECIFIED (INCL CYSTS AND POLYPS)
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="255" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="PROSTATE CANCER">PROSTATE CANCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="256" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="MALIGNANT FIBROUS HISTIOCYTOMA">MALIGNANT FIBROUS HISTIOCYTOMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="257" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="COLON CANCER">COLON CANCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="258" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="CONGENITAL, FAMILIAL AND GENETIC DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                CONGENITAL, FAMILIAL AND GENETIC DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="259" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="VENTRICULAR SEPTAL DEFECT">VENTRICULAR SEPTAL DEFECT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="260" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="IMMUNE SYSTEM DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                IMMUNE SYSTEM DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="261" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="SEASONAL ALLERGY">SEASONAL ALLERGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="262" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERSENSITIVITY">HYPERSENSITIVITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="263" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="SOCIAL CIRCUMSTANCES">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                SOCIAL CIRCUMSTANCES
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="264" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="ALCOHOL USE">ALCOHOL USE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="265" class="indent-1" indent="1">
            <td>
              <span class="truncate" title="HEPATOBILIARY DISORDERS">
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                HEPATOBILIARY DISORDERS
              </span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="266" class="indent-2" indent="2">
            <td>
              <span class="truncate" title="HYPERBILIRUBINAEMIA">HYPERBILIRUBINAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
        </table>
      </div>

