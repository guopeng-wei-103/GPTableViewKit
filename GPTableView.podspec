

Pod::Spec.new do |s|


    s.name         = 'GPTableView'
    s.version      = '0.7.4'
    s.summary      = 'A module of iOS UITableView.'

    s.homepage     = 'https://github.com/pengGitHubUp/GPTableViewKit'

    s.license      = { :type => 'MIT', :file => 'LICENSE' }

    s.author             = { 'guopeng' => '752717288@qq.com' }

    s.platform     = :ios, '8.0'

    s.source       = { :git => 'https://github.com/pengGitHubUp/GPTableViewKit.git', :tag => s.version.to_s }

    s.source_files  = 'GPTableViewKit/**/*.{h,m}'

    s.framework  = 'UIKit'

    s.requires_arc = true

end
