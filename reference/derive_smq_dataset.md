# Derive SMQ and UDAEC hierarchy variables

Derive SMQ and UDAEC hierarchy variables

## Usage

``` r
derive_smq_dataset(
  base_data,
  smq_vars,
  smq_name,
  smq_na_label,
  udaec_name,
  udaec_list = NULL,
  udaec_na_label
)
```

## Arguments

- base_data:

  `data.frame` Event data used to derive the hierarchy variables.

- smq_vars:

  `character(1+)` Names of the source columns containing SMQ indicators
  or categories.

- smq_name:

  `character(1)` Name of the derived SMQ variable.

- smq_na_label:

  `character(1)` Label used for the derived SMQ variable when the source
  values are missing/`NA`.

- udaec_name:

  `character(1)` Name of the derived UDAEC variable.

- udaec_list:

  `list|NULL` Optional named list defining UDAEC categories.

- udaec_na_label:

  `character(1)` Label used for the derived UDAEC variable when no
  category applies (i.e., the subject does not match any of the
  categories defined in `udaec_list`).

## Value

A data frame containing the derived hierarchy variables.
