class Jekyll::HighlightBlock
  def render_pygments(context, code)
    html = Pygments.new(code, @lang).to_s(@options)

    # Work around an RDiscount bug: http://gist.github.com/97682
    html = html.to_s.sub(%r{</pre></div>\Z}, "</pre>\n</div>")

    output = add_code_tags(html, @lang)
    output = context["pygments_prefix"] + output if context["pygments_prefix"]
    output = output + context["pygments_suffix"] if context["pygments_suffix"]
    output
  end
end