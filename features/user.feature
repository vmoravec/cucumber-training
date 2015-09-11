Feature: User
  Background:
    Given the user home directory exists

  @ssh
  Scenario: SSH configured
    Given the config directory ".ssh" exists
    When I list the content of config directory
    Then I get an non-empty list of entries
    And the public key "id_rsa.pub" is present
    And the private key "id_rsa" is present

  @vim
  Scenario: Vim configured
    Given the config file ".vimrc" exists
    And the config directory ".vim" exists
    When I list the content of config directory
    Then I get an non-empty list of entries

