name              'sql_restore'
maintainer        'Galen Emery'
maintainer_email  'galen@getchef.com'
license           'Apache 2.0'
description       'Restores a .bacpac SQL Server DB'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'
recipe            'sql-restore::default', 'Restores SQL Server DB .bacpac file'

supports 'windows'
depends 'windows'
depends 'dsc'
depends 'powershell'