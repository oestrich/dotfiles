def tic
  @tic = Time.now
end

def toc
  puts "#{Time.now - @tic} seconds"
end
