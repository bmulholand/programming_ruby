# There's no denying this syntax is nice and light.
# Ruby really gives you the ability to craft interfaces how you want.

def block_to_proc(foo, &block)
  block.call(foo)
end

def invoke_lambda(foo, lam)
  lam.call(foo)
end

def invoke_block(foo, bar)
  yield foo, bar if block_given?
end


# These two are the same - only the params are different.
block_to_proc("lol") {|f| puts f * 3 }
invoke_block("lol", "lolzz") {|f, b| puts (f + b) * 3 }

# can I provide a stabby?
# Hmm... Not quite. Doesn't seem to work.
## block_to_proc "lol", ->(f) {puts f * 3}

invoke_lambda "lol", -> f { puts f * 3 }
invoke_lambda "lol", proc {|f| puts f * 3 }


=begin
  Seems like blocks are the main character. The lambda kind of feels like an afterthought.
=end
