namespace :jekyll do
  dest = Rails.root.join('public/blog2')

  options = {
    'baseurl' => '/blog2',
    'config' => Rails.root.join('config', 'jekyll.yml').to_s,
    'watch' => true,
    'port' => 3000,
    'source' => Rails.root.join('blog2').to_s,
    'destination' => dest.to_s
  }

  build = Thread.new { Jekyll::Commands::Build.process(options) }
  serve = Thread.new { Jekyll::Commands::Serve.process(options) }

  commands = [build, serve]
  commands.each { |c| c.join }
end

