

Pod::Spec.new do |s|


    s.name         = "GPTableView"
    s.version      = "0.0.2"
    s.summary      = "A module of iOS UITableView."

    s.homepage     = "https://blog.csdn.net/peng_up"

    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "guopeng" => "752717288@qq.com" }

    s.platform     = :ios, "8.0"

    s.source       = { :git => "https://gitlab.com/peng_dev/GPTableView.git", :tag => "#{s.version}" }

    s.source_files  = "GPTableViewKit/*"

    s.public_header_files = "GPTableViewKit/*.h"

    s.framework  = "UIKit"

    s.requires_arc = true

end
