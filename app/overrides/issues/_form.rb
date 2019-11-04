Deface::Override.new :virtual_path  => 'issues/_form',
                     :name          => 'auto-set-private-flag',
                     :original      => '8f374ec2439b27545906aae44228462dfe14d196',
                     :replace       => 'p:contains("is_private")',
                     :partial       => 'redmine_auto_private/form'

Deface::Override.new :virtual_path  => 'issues/_form_with_positions',
                     :name          => 'auto-set-private-flag',
                     :original      => '8f374ec2439b27545906aae44228462dfe14d196',
                     :replace       => 'p:contains("is_private")',
                     :partial       => 'redmine_auto_private/form'
