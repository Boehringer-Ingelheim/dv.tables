# dv.tables 0.4.1-9007

- [Tplyr_table module] Add new arguments from `dv.listings` module
- [Tplyr_table module] Add table pagination and deprecate `pagination` in favor of `listing_pagination`

# dv.tables 0.4.1-9006

- New module `mod_summary_table` that provides numerical and categorical analysis.

# dv.tables 0.4.1-9005

- [NOT USER-FACING] CSS tweak to container of dv.listings Tplyr_table.

# dv.tables 0.4.1-9004

- Add scrollbar to options dropdown to avoid truncation in short window space.

# dv.tables 0.4.1-9003

- [NOT USER-FACING] Provide `afmm` to newer version of `dv.listings::check_review_parameter`

# dv.tables 0.4.1-9002

- Add progress bar shown during table generation

# dv.tables 0.4.1-9001

- [NOT USER-FACING] Update TC.R and DR.R snippet

# dv.tables 0.4.1-9000

- [NOT USER-FACING] Update CM.R snippet

# dv.tables 0.4.1

- [PLACEHOLDER TO INCLUDE CHANGES TO main THAT BYPASSED test]

# dv.tables 0.4.0

* [Tplyr_table module] added option for Tabs layout (default is dropdown selector)
* [Tplyr_table module] remove drop empty levels; moved to dv.manager
* [Tplyr_table module] bug fix; PaPo jumping
* Update screenshots.
* Replace `hidden` class for `d-none`
* Relayout table. Reduce main header size and align cells to baseline.
* Add functionality to optionally apply sub-grouping by a variable from the events data.
* Reorganise parameter documentation for hierarchical count table functions.
* Clarify use of time at risk related arguments in documentation for mod_hierarchical_count_table.

# dv.tables 0.3.0

* Retain dash fill-in for RTF downloads
* Add time-at-risk functionality
* Fix application error when clicking on a cell with no event counts
* Move options into a drop-down box
* Tplyr_table module, Add titles to the outputs
* Remove pharmaverseadam dependency
* Provide early error feedback for the review parameter of mod_Tplyr_table

# dv.tables 0.2.0

* Add Tplyr_table module 

# dv.tables 0.1.0

* Add jumping functionality
* Implement label truncation
* Implement functionality to download to Word (.rtf) format
* Allow subsetting of hierarchy and group variables drop-down list through module argument
* Remove subject identifier variable from hierarchy and group variables drop-down list
* Alert when group selection also selected in hierarchy
* Allow a maximum of 2 hierarchy variable selections

# dv.tables 0.0.3

* Add table download button

# dv.tables 0.0.2

* Solves minor documentation issues.
* Removes support for data dispatchers.
* Provides early feedback for module misconfiguration.

# dv.tables 0.0.1

* hierarchical_count_table.
