Pod::Spec.new do |s|
s.name         = "XYTableView"
s.version      = "1.0.0"
s.summary      = "私人tableView: XYTableView."
s.homepage     = "https://github.com/laurawxy/XYTableView"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.authors      = {"Xiangyu Wang" => "xiangyu.laura@icloud.com"}
s.platform     = :ios, "8.0"
s.source       = {:git => "https://github.com/laurawxy/XYTableView.git", :tag => "#{s.version}"}
s.source_files = "XYTableView/**/*.{h,m}"
s.requires_arc = true
s.dependency "MJRefresh"
end
