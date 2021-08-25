# Changelog

## 1.2.6 (August 25, 2021)
 * Remove limit on newer terraform versions

## 1.2.5 (June 10, 2021)
 * Fix compatbility with terraform 1.0

## 1.2.4 (February 11, 2021)
 * Add `wait_for_policy` attribute to control whether roles depends on policy attachment.

## 1.2.3 (August 11, 2020)
 * Set only lower limit on aws provider version.
 * Add `force_detach_policies`, `description` and `permissions_boundary` role attributes.

## 1.2.2 (June 22, 2020)
 * Add usage examples
 * Add terraform and aws provider version constraints

## 1.2.1 (June 19, 2020)
 * Add `max_session_duration` attribute.

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
