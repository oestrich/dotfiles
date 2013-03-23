def tic
  @tic = Time.now
end

def toc
  "#{Time.now - @tic} seconds"
end

IRB.conf[:SAVE_HISTORY] = 50
