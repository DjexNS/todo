def partial(name, args = {}, dir = 'app/assets')
  require 'ostruct'
  namespace = OpenStruct.new(args)
  
  name += '.html'
  [name + '.erb', name].each do |n|
    n = File.join(dir, n)
    next unless File.exist?(n) 
    tpl = ERB.new(File.new(n).read)
    compiled = tpl.result(namespace.instance_eval { binding })
    return compiled
  end
end