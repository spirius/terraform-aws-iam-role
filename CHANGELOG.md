# Changelog

## 1.2.0 (May 28, 2020)
 * Set explicit output dependency from policy attachments

## 1.1.0 (March 23, 2020)

ENHANCMENTS:
 * Rename `managed_policies` to `managed_policy_arns`.

BUGFIX:
 * Do not create assume role policy statement if `assume_role_arns` and `assume_role_services` are both empty.
 * Fix terraform resource count error when `access_policy` is computed value.

## 1.0.0 (March 20, 2020)
 * Initial commit
