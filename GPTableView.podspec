

Pod::Spec.new do |s|


    s.name         = 'GPTableView'
    s.version      = '0.0.6'
    s.summary      = 'A module of iOS UITableView.'

    s.homepage     = 'https://github.com/pengGitHubUp/GPTableViewKit'

    s.license      = { :type => 'MIT', :file => 'LICENSE' }

    s.author             = { 'guopeng' => '752717288@qq.com' }

    s.platform     = :ios, '8.0'

    s.source       = { :git => 'https://gitlab.com/peng_dev/GPTableView.git', :tag => s.version.to_s }

    s.source_files  = '*'

    s.framework  = 'UIKit'

    s.requires_arc = true

end
