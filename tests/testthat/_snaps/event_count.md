# snapshots for development

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
      
      

---

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
      
      

---

    Code
      sw
    Output
      $df
      # A tibble: 7 x 8
        lvl1     lvl2    GA           GB           GC           Total        `\035lvl`
        <fct>    <fct>   <list>       <list>       <list>       <list>           <dbl>
      1 "\u001d" "\u001~ <named list> <named list> <named list> <named list>         3
      2 "A1"     "\u001~ <named list> <named list> <named list> <named list>         2
      3 "A1"     "A2"    <named list> <named list> <named list> <named list>         1
      4 "A1"     "B2"    <named list> <named list> <named list> <named list>         1
      5 "B1"     "\u001~ <named list> <named list> <named list> <named list>         2
      6 "B1"     "B2"    <named list> <named list> <named list> <named list>         1
      7 "B1"     "A2"    <named list> <named list> <named list> <named list>         1
      # i 1 more variable: `\035_rank_overall` <int>
      
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
      
      $meta$rank_col
      [1] "\035_rank_overall"
      
      

---

    Code
      html
    Output
      <div>
        <p>Event count by lvl1, lvl2</p>
        <table class="table event-count">
          <tr class="no-border">
            <th class="text-center">
              <span>
                
                <br/>
                
              </span>
            </th>
            <th class="text-center">
              <span>
                GA
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center">
              <span>
                GB
                <br/>
                (N = 1)
              </span>
            </th>
            <th class="text-center">
              <span>
                GC
                <br/>
                (N = 2)
              </span>
            </th>
            <th class="text-center">
              <span>
                Total
                <br/>
                (N = 4)
              </span>
            </th>
          </tr>
          <tr row-id="1" class="indent-0" indent="0">
            <td>
              <span>
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                Overall
              </span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">1 ( 50.00 %)</td>
            <td class="text-center" column="Total">3 ( 75.00 %)</td>
          </tr>
          <tr row-id="2" class="indent-1" indent="1">
            <td>
              <span>
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                A1
              </span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">1 ( 50.00 %)</td>
            <td class="text-center" column="Total">3 ( 75.00 %)</td>
          </tr>
          <tr row-id="3" class="indent-2" indent="2">
            <td>
              <span>A2</span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">1 ( 50.00 %)</td>
            <td class="text-center" column="Total">3 ( 75.00 %)</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span>B2</span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">—</td>
            <td class="text-center" column="Total">2 ( 50.00 %)</td>
          </tr>
          <tr row-id="5" class="indent-1" indent="1">
            <td>
              <span>
                <i class="fas fa-table" role="presentation" aria-label="table icon" onclick="ec_collapse(this)"></i>
                B1
              </span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">—</td>
            <td class="text-center" column="Total">2 ( 50.00 %)</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span>B2</span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">1 ( 100.00 %)</td>
            <td class="text-center" column="GC">—</td>
            <td class="text-center" column="Total">2 ( 50.00 %)</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span>A2</span>
            </td>
            <td class="text-center" column="GA">1 ( 100.00 %)</td>
            <td class="text-center" column="GB">—</td>
            <td class="text-center" column="GC">—</td>
            <td class="text-center" column="Total">1 ( 25.00 %)</td>
          </tr>
        </table>
      </div>

# counting is correct, sorting, against (snapshot)__spec_ids{event_count$event_count;event_count$event_count_display;event_count$sorted_table_display}

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
      
      

# filtering is correct, agains (snapshot)__spec_ids{event_count$minimum_percentage_filter}

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
      
      

# a count table is displayed__spec_ids{event_count$events_table_display}

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
              <span>
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
              <span>
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
              <span>APPLICATION SITE PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">26 ( 14.53 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">24 ( 18.90 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">50 ( 16.34 %)</td>
          </tr>
          <tr row-id="4" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 6.70 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">18 ( 14.17 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">30 ( 9.80 %)</td>
          </tr>
          <tr row-id="5" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE IRRITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 7.82 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 5.51 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">21 ( 6.86 %)</td>
          </tr>
          <tr row-id="6" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE DERMATITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 6.15 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">21 ( 6.86 %)</td>
          </tr>
          <tr row-id="7" class="indent-2" indent="2">
            <td>
              <span>FATIGUE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 3.59 %)</td>
          </tr>
          <tr row-id="8" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE VESICLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 5.51 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">11 ( 3.59 %)</td>
          </tr>
          <tr row-id="9" class="indent-2" indent="2">
            <td>
              <span>OEDEMA PERIPHERAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="10" class="indent-2" indent="2">
            <td>
              <span>PYREXIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="11" class="indent-2" indent="2">
            <td>
              <span>MALAISE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="12" class="indent-2" indent="2">
            <td>
              <span>CHILLS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="13" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE URTICARIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="14" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="15" class="indent-2" indent="2">
            <td>
              <span>PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="16" class="indent-2" indent="2">
            <td>
              <span>OEDEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="17" class="indent-2" indent="2">
            <td>
              <span>CHEST PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="18" class="indent-2" indent="2">
            <td>
              <span>CHEST DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="19" class="indent-2" indent="2">
            <td>
              <span>ASTHENIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="20" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE REACTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="21" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE PERSPIRATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="22" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="23" class="indent-2" indent="2">
            <td>
              <span>ULCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="24" class="indent-2" indent="2">
            <td>
              <span>SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="25" class="indent-2" indent="2">
            <td>
              <span>SUDDEN DEATH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="26" class="indent-2" indent="2">
            <td>
              <span>SECRETION DISCHARGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="27" class="indent-2" indent="2">
            <td>
              <span>INFLAMMATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="28" class="indent-2" indent="2">
            <td>
              <span>FEELING COLD</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="29" class="indent-2" indent="2">
            <td>
              <span>FEELING ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="30" class="indent-2" indent="2">
            <td>
              <span>CYST</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="31" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE WARMTH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="32" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE INDURATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="33" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE DISCOLOURATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="34" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE DISCHARGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="35" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE DESQUAMATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="36" class="indent-2" indent="2">
            <td>
              <span>APPLICATION SITE BLEEDING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="37" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">30 ( 16.76 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">27 ( 21.26 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">57 ( 18.63 %)</td>
          </tr>
          <tr row-id="39" class="indent-2" indent="2">
            <td>
              <span>ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 12.29 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 12.60 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">38 ( 12.42 %)</td>
          </tr>
          <tr row-id="40" class="indent-2" indent="2">
            <td>
              <span>RASH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 7.26 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 12.60 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">29 ( 9.48 %)</td>
          </tr>
          <tr row-id="41" class="indent-2" indent="2">
            <td>
              <span>SKIN IRRITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="42" class="indent-2" indent="2">
            <td>
              <span>HYPERHIDROSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 7.09 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="43" class="indent-2" indent="2">
            <td>
              <span>BLISTER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="44" class="indent-2" indent="2">
            <td>
              <span>RASH PRURITIC</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="45" class="indent-2" indent="2">
            <td>
              <span>URTICARIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="46" class="indent-2" indent="2">
            <td>
              <span>RASH ERYTHEMATOUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="47" class="indent-2" indent="2">
            <td>
              <span>PRURITUS GENERALISED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="48" class="indent-2" indent="2">
            <td>
              <span>SKIN ULCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="49" class="indent-2" indent="2">
            <td>
              <span>SKIN ODOUR ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="50" class="indent-2" indent="2">
            <td>
              <span>SKIN EXFOLIATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="51" class="indent-2" indent="2">
            <td>
              <span>RASH PAPULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="52" class="indent-2" indent="2">
            <td>
              <span>RASH MACULO-PAPULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="53" class="indent-2" indent="2">
            <td>
              <span>DRUG ERUPTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="54" class="indent-2" indent="2">
            <td>
              <span>DERMATITIS CONTACT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="55" class="indent-2" indent="2">
            <td>
              <span>DERMATITIS ATOPIC</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="56" class="indent-2" indent="2">
            <td>
              <span>COLD SWEAT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="57" class="indent-2" indent="2">
            <td>
              <span>ALOPECIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="58" class="indent-2" indent="2">
            <td>
              <span>ACTINIC KERATOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="59" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>DIZZINESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 10.24 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">22 ( 7.19 %)</td>
          </tr>
          <tr row-id="61" class="indent-2" indent="2">
            <td>
              <span>HEADACHE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 4.47 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 6.30 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">16 ( 5.23 %)</td>
          </tr>
          <tr row-id="62" class="indent-2" indent="2">
            <td>
              <span>SYNCOPE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 2.29 %)</td>
          </tr>
          <tr row-id="63" class="indent-2" indent="2">
            <td>
              <span>SOMNOLENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 4.72 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="64" class="indent-2" indent="2">
            <td>
              <span>TRANSIENT ISCHAEMIC ATTACK</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="65" class="indent-2" indent="2">
            <td>
              <span>LETHARGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="66" class="indent-2" indent="2">
            <td>
              <span>BURNING SENSATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="67" class="indent-2" indent="2">
            <td>
              <span>SYNCOPE VASOVAGAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="68" class="indent-2" indent="2">
            <td>
              <span>STUPOR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="69" class="indent-2" indent="2">
            <td>
              <span>PSYCHOMOTOR HYPERACTIVITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="70" class="indent-2" indent="2">
            <td>
              <span>PARTIAL SEIZURES WITH SECONDARY GENERALISATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="71" class="indent-2" indent="2">
            <td>
              <span>PAROSMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="72" class="indent-2" indent="2">
            <td>
              <span>PARKINSON'S DISEASE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="73" class="indent-2" indent="2">
            <td>
              <span>PARAESTHESIA ORAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="74" class="indent-2" indent="2">
            <td>
              <span>PARAESTHESIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="75" class="indent-2" indent="2">
            <td>
              <span>HYPERSOMNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="76" class="indent-2" indent="2">
            <td>
              <span>HEMIANOPIA HOMONYMOUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="77" class="indent-2" indent="2">
            <td>
              <span>COORDINATION ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="78" class="indent-2" indent="2">
            <td>
              <span>COMPLEX PARTIAL SEIZURES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="79" class="indent-2" indent="2">
            <td>
              <span>COGNITIVE DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="80" class="indent-2" indent="2">
            <td>
              <span>BALANCE DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="81" class="indent-2" indent="2">
            <td>
              <span>AMNESIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="82" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>DIARRHOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 3.35 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 9.45 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">18 ( 5.88 %)</td>
          </tr>
          <tr row-id="84" class="indent-2" indent="2">
            <td>
              <span>VOMITING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 6.30 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">13 ( 4.25 %)</td>
          </tr>
          <tr row-id="85" class="indent-2" indent="2">
            <td>
              <span>NAUSEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 5.03 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 3.92 %)</td>
          </tr>
          <tr row-id="86" class="indent-2" indent="2">
            <td>
              <span>ABDOMINAL PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="87" class="indent-2" indent="2">
            <td>
              <span>SALIVARY HYPERSECRETION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="88" class="indent-2" indent="2">
            <td>
              <span>DYSPEPSIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="89" class="indent-2" indent="2">
            <td>
              <span>STOMACH DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="90" class="indent-2" indent="2">
            <td>
              <span>RECTAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="91" class="indent-2" indent="2">
            <td>
              <span>HIATUS HERNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="92" class="indent-2" indent="2">
            <td>
              <span>GLOSSITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="93" class="indent-2" indent="2">
            <td>
              <span>GASTROOESOPHAGEAL REFLUX DISEASE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="94" class="indent-2" indent="2">
            <td>
              <span>GASTROINTESTINAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="95" class="indent-2" indent="2">
            <td>
              <span>FLATULENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="96" class="indent-2" indent="2">
            <td>
              <span>DYSPHAGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="97" class="indent-2" indent="2">
            <td>
              <span>CONSTIPATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="98" class="indent-2" indent="2">
            <td>
              <span>ABDOMINAL DISCOMFORT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="99" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>SINUS BRADYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 3.91 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 7.87 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">17 ( 5.56 %)</td>
          </tr>
          <tr row-id="101" class="indent-2" indent="2">
            <td>
              <span>MYOCARDIAL INFARCTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 3.91 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 3.27 %)</td>
          </tr>
          <tr row-id="102" class="indent-2" indent="2">
            <td>
              <span>ATRIOVENTRICULAR BLOCK SECOND DEGREE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="103" class="indent-2" indent="2">
            <td>
              <span>ATRIAL FIBRILLATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="104" class="indent-2" indent="2">
            <td>
              <span>VENTRICULAR EXTRASYSTOLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="105" class="indent-2" indent="2">
            <td>
              <span>SUPRAVENTRICULAR EXTRASYSTOLES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="106" class="indent-2" indent="2">
            <td>
              <span>PALPITATIONS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="107" class="indent-2" indent="2">
            <td>
              <span>BUNDLE BRANCH BLOCK RIGHT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="108" class="indent-2" indent="2">
            <td>
              <span>ATRIOVENTRICULAR BLOCK FIRST DEGREE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="109" class="indent-2" indent="2">
            <td>
              <span>ATRIAL FLUTTER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="110" class="indent-2" indent="2">
            <td>
              <span>WOLFF-PARKINSON-WHITE SYNDROME</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="111" class="indent-2" indent="2">
            <td>
              <span>VENTRICULAR HYPERTROPHY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="112" class="indent-2" indent="2">
            <td>
              <span>TACHYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="113" class="indent-2" indent="2">
            <td>
              <span>SUPRAVENTRICULAR TACHYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="114" class="indent-2" indent="2">
            <td>
              <span>SINUS ARRHYTHMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="115" class="indent-2" indent="2">
            <td>
              <span>CARDIAC FAILURE CONGESTIVE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="116" class="indent-2" indent="2">
            <td>
              <span>CARDIAC DISORDER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="117" class="indent-2" indent="2">
            <td>
              <span>BUNDLE BRANCH BLOCK LEFT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="118" class="indent-2" indent="2">
            <td>
              <span>BRADYCARDIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="119" class="indent-2" indent="2">
            <td>
              <span>ATRIAL HYPERTROPHY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="120" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>NASOPHARYNGITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">8 ( 4.47 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">12 ( 3.92 %)</td>
          </tr>
          <tr row-id="122" class="indent-2" indent="2">
            <td>
              <span>UPPER RESPIRATORY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 3.94 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">10 ( 3.27 %)</td>
          </tr>
          <tr row-id="123" class="indent-2" indent="2">
            <td>
              <span>URINARY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="124" class="indent-2" indent="2">
            <td>
              <span>INFLUENZA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="125" class="indent-2" indent="2">
            <td>
              <span>LOCALISED INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="126" class="indent-2" indent="2">
            <td>
              <span>EAR INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="127" class="indent-2" indent="2">
            <td>
              <span>CYSTITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="128" class="indent-2" indent="2">
            <td>
              <span>VIRAL INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="129" class="indent-2" indent="2">
            <td>
              <span>VAGINAL MYCOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="130" class="indent-2" indent="2">
            <td>
              <span>RHINITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="131" class="indent-2" indent="2">
            <td>
              <span>PNEUMONIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="132" class="indent-2" indent="2">
            <td>
              <span>ONYCHOMYCOSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="133" class="indent-2" indent="2">
            <td>
              <span>LOWER RESPIRATORY TRACT INFECTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="134" class="indent-2" indent="2">
            <td>
              <span>HORDEOLUM</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="135" class="indent-2" indent="2">
            <td>
              <span>GASTROENTERITIS VIRAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="136" class="indent-2" indent="2">
            <td>
              <span>CERVICITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="137" class="indent-2" indent="2">
            <td>
              <span>CELLULITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="138" class="indent-2" indent="2">
            <td>
              <span>BRONCHITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="139" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>COUGH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">9 ( 7.09 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">14 ( 4.58 %)</td>
          </tr>
          <tr row-id="141" class="indent-2" indent="2">
            <td>
              <span>NASAL CONGESTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 4.72 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">7 ( 2.29 %)</td>
          </tr>
          <tr row-id="142" class="indent-2" indent="2">
            <td>
              <span>EPISTAXIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="143" class="indent-2" indent="2">
            <td>
              <span>DYSPNOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="144" class="indent-2" indent="2">
            <td>
              <span>RHINORRHOEA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="145" class="indent-2" indent="2">
            <td>
              <span>PHARYNGOLARYNGEAL PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="146" class="indent-2" indent="2">
            <td>
              <span>RESPIRATORY TRACT CONGESTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="147" class="indent-2" indent="2">
            <td>
              <span>RALES</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="148" class="indent-2" indent="2">
            <td>
              <span>PRODUCTIVE COUGH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="149" class="indent-2" indent="2">
            <td>
              <span>POSTNASAL DRIP</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="150" class="indent-2" indent="2">
            <td>
              <span>PHARYNGEAL ERYTHEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="151" class="indent-2" indent="2">
            <td>
              <span>HAEMOPTYSIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="152" class="indent-2" indent="2">
            <td>
              <span>EMPHYSEMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="153" class="indent-2" indent="2">
            <td>
              <span>DYSPHONIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="154" class="indent-2" indent="2">
            <td>
              <span>ALLERGIC GRANULOMATOUS ANGIITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="155" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>CONFUSIONAL STATE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">6 ( 1.96 %)</td>
          </tr>
          <tr row-id="157" class="indent-2" indent="2">
            <td>
              <span>AGITATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="158" class="indent-2" indent="2">
            <td>
              <span>INSOMNIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 3.15 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="159" class="indent-2" indent="2">
            <td>
              <span>ANXIETY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 2.23 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="160" class="indent-2" indent="2">
            <td>
              <span>IRRITABILITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="161" class="indent-2" indent="2">
            <td>
              <span>DEPRESSED MOOD</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="162" class="indent-2" indent="2">
            <td>
              <span>DELUSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="163" class="indent-2" indent="2">
            <td>
              <span>RESTLESSNESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="164" class="indent-2" indent="2">
            <td>
              <span>NIGHTMARE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="165" class="indent-2" indent="2">
            <td>
              <span>LISTLESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="166" class="indent-2" indent="2">
            <td>
              <span>LIBIDO DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="167" class="indent-2" indent="2">
            <td>
              <span>HALLUCINATION, VISUAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="168" class="indent-2" indent="2">
            <td>
              <span>HALLUCINATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="169" class="indent-2" indent="2">
            <td>
              <span>DISORIENTATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="170" class="indent-2" indent="2">
            <td>
              <span>DELIRIUM</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="171" class="indent-2" indent="2">
            <td>
              <span>COMPLETED SUICIDE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="172" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>ELECTROCARDIOGRAM ST SEGMENT DEPRESSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 2.79 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="174" class="indent-2" indent="2">
            <td>
              <span>ELECTROCARDIOGRAM T WAVE INVERSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="175" class="indent-2" indent="2">
            <td>
              <span>ELECTROCARDIOGRAM T WAVE AMPLITUDE DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="176" class="indent-2" indent="2">
            <td>
              <span>BLOOD GLUCOSE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="177" class="indent-2" indent="2">
            <td>
              <span>WHITE BLOOD CELL COUNT INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="178" class="indent-2" indent="2">
            <td>
              <span>WEIGHT DECREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="179" class="indent-2" indent="2">
            <td>
              <span>URINE ANALYSIS ABNORMAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="180" class="indent-2" indent="2">
            <td>
              <span>NEUTROPHIL COUNT INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="181" class="indent-2" indent="2">
            <td>
              <span>NASAL MUCOSA BIOPSY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="182" class="indent-2" indent="2">
            <td>
              <span>HEART RATE IRREGULAR</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="183" class="indent-2" indent="2">
            <td>
              <span>HEART RATE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="184" class="indent-2" indent="2">
            <td>
              <span>CYSTOSCOPY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="185" class="indent-2" indent="2">
            <td>
              <span>BODY TEMPERATURE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="186" class="indent-2" indent="2">
            <td>
              <span>BLOOD URINE PRESENT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="187" class="indent-2" indent="2">
            <td>
              <span>BLOOD CREATINE PHOSPHOKINASE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="188" class="indent-2" indent="2">
            <td>
              <span>BLOOD CHOLESTEROL INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="189" class="indent-2" indent="2">
            <td>
              <span>BLOOD ALKALINE PHOSPHATASE INCREASED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="190" class="indent-2" indent="2">
            <td>
              <span>BIOPSY PROSTATE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="191" class="indent-2" indent="2">
            <td>
              <span>BIOPSY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="192" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>BACK PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">5 ( 1.63 %)</td>
          </tr>
          <tr row-id="194" class="indent-2" indent="2">
            <td>
              <span>ARTHRALGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="195" class="indent-2" indent="2">
            <td>
              <span>SHOULDER PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="196" class="indent-2" indent="2">
            <td>
              <span>MUSCLE SPASMS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="197" class="indent-2" indent="2">
            <td>
              <span>FLANK PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="198" class="indent-2" indent="2">
            <td>
              <span>ARTHRITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="199" class="indent-2" indent="2">
            <td>
              <span>PAIN IN EXTREMITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="200" class="indent-2" indent="2">
            <td>
              <span>MYALGIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="201" class="indent-2" indent="2">
            <td>
              <span>MUSCULAR WEAKNESS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="202" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>FALL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="204" class="indent-2" indent="2">
            <td>
              <span>EXCORIATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 1.68 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="205" class="indent-2" indent="2">
            <td>
              <span>CONTUSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 2.36 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">4 ( 1.31 %)</td>
          </tr>
          <tr row-id="206" class="indent-2" indent="2">
            <td>
              <span>SKIN LACERATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="207" class="indent-2" indent="2">
            <td>
              <span>HIP FRACTURE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="208" class="indent-2" indent="2">
            <td>
              <span>WOUND</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="209" class="indent-2" indent="2">
            <td>
              <span>JOINT DISLOCATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="210" class="indent-2" indent="2">
            <td>
              <span>FACIAL BONES FRACTURE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="211" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>MICTURITION URGENCY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="213" class="indent-2" indent="2">
            <td>
              <span>NEPHROLITHIASIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="214" class="indent-2" indent="2">
            <td>
              <span>DYSURIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="215" class="indent-2" indent="2">
            <td>
              <span>POLLAKIURIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="216" class="indent-2" indent="2">
            <td>
              <span>INCONTINENCE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="217" class="indent-2" indent="2">
            <td>
              <span>ENURESIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="218" class="indent-2" indent="2">
            <td>
              <span>CALCULUS URETHRAL</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="219" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>INCREASED APPETITE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="221" class="indent-2" indent="2">
            <td>
              <span>FOOD CRAVING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="222" class="indent-2" indent="2">
            <td>
              <span>DECREASED APPETITE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="223" class="indent-2" indent="2">
            <td>
              <span>HYPONATRAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="224" class="indent-2" indent="2">
            <td>
              <span>HYPERCHOLESTEROLAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="225" class="indent-2" indent="2">
            <td>
              <span>DIABETES MELLITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="226" class="indent-2" indent="2">
            <td>
              <span>DEHYDRATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="227" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>HYPOTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="229" class="indent-2" indent="2">
            <td>
              <span>HYPERTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="230" class="indent-2" indent="2">
            <td>
              <span>WOUND HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="231" class="indent-2" indent="2">
            <td>
              <span>ORTHOSTATIC HYPOTENSION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="232" class="indent-2" indent="2">
            <td>
              <span>HOT FLUSH</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="233" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>VISION BLURRED</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="235" class="indent-2" indent="2">
            <td>
              <span>CONJUNCTIVITIS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="236" class="indent-2" indent="2">
            <td>
              <span>GLAUCOMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="237" class="indent-2" indent="2">
            <td>
              <span>EYE SWELLING</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="238" class="indent-2" indent="2">
            <td>
              <span>EYE PRURITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="239" class="indent-2" indent="2">
            <td>
              <span>EYE ALLERGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="240" class="indent-2" indent="2">
            <td>
              <span>CONJUNCTIVAL HAEMORRHAGE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="241" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>CATARACT OPERATION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="243" class="indent-2" indent="2">
            <td>
              <span>SKIN LESION EXCISION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="244" class="indent-2" indent="2">
            <td>
              <span>EYE LASER SURGERY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="245" class="indent-2" indent="2">
            <td>
              <span>ACROCHORDON EXCISION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="246" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>VERTIGO</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.12 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="248" class="indent-2" indent="2">
            <td>
              <span>TINNITUS</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="249" class="indent-2" indent="2">
            <td>
              <span>EAR PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="250" class="indent-2" indent="2">
            <td>
              <span>CERUMEN IMPACTION</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="251" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>BENIGN PROSTATIC HYPERPLASIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 0.65 %)</td>
          </tr>
          <tr row-id="253" class="indent-2" indent="2">
            <td>
              <span>PELVIC PAIN</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="254" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>PROSTATE CANCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="256" class="indent-2" indent="2">
            <td>
              <span>MALIGNANT FIBROUS HISTIOCYTOMA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="257" class="indent-2" indent="2">
            <td>
              <span>COLON CANCER</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="258" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>VENTRICULAR SEPTAL DEFECT</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">2 ( 1.57 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">3 ( 0.98 %)</td>
          </tr>
          <tr row-id="260" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>SEASONAL ALLERGY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="262" class="indent-2" indent="2">
            <td>
              <span>HYPERSENSITIVITY</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.79 %)</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="263" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>ALCOHOL USE</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
          <tr row-id="265" class="indent-1" indent="1">
            <td>
              <span>
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
              <span>HYPERBILIRUBINAEMIA</span>
            </td>
            <td class="text-center" column="F" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.56 %)</td>
            <td class="text-center" column="M" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">—</td>
            <td class="text-center" column="Total" onclick="Shiny.setInputValue(&#39;mod-cell_click&#39;, {row_id: Number(this.closest(&#39;tr&#39;).getAttribute(&#39;row-id&#39;)), column : this.getAttribute(&#39;column&#39;)}, {priority: &#39;event&#39;})">1 ( 0.33 %)</td>
          </tr>
        </table>
      </div>

# cells can be clicked and the id of participants is returned__spec_ids{event_count$cell_interactivity}

    Code
      res
    Output
        [1] "1015" "1034" "1047" "1111" "1133" "1146" "1153" "1181" "1192" "1203"
       [11] "1211" "1287" "1363" "1383" "1387" "1442" "1082" "1100" "1119" "1210"
       [21] "1258" "1295" "1299" "1439" "1008" "1025" "1074" "1120" "1135" "1164"
       [31] "1218" "1323" "1031" "1059" "1186" "1280" "1281" "1292" "1310" "1349"
       [41] "1393" "1431" "1041" "1049" "1384" "1084" "1087" "1158" "1178" "1213"
       [51] "1286" "1316" "1347" "1348" "1353" "1406" "1428" "1007" "1020" "1081"
       [61] "1099" "1102" "1168" "1301" "1306" "1312" "1326" "1045" "1053" "1070"
       [71] "1077" "1083" "1137" "1142" "1166" "1183" "1187" "1235" "1270" "1271"
       [81] "1300" "1314" "1315" "1368" "1012" "1143" "1433" "1043" "1073" "1179"
       [91] "1209" "1448" "1035" "1068" "1375" "1207" "1321" "1024" "1026" "1071"
      [101] "1108" "1151" "1160" "1229" "1298" "1308" "1364" "1418" "1447" "1004"
      [111] "1201" "1344" "1446" "1066" "1079" "1150" "1170" "1250" "1371" "1427"
      [121] "1335"

