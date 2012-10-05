def tic
  @tic = Time.now
end

def toc
  "#{Time.now - @tic} seconds"
end
