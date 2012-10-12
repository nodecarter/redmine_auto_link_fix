module RedmineAutoLinkFix
  module LinksHelperPatch
    def self.included(base)
      if base.const_defined? :AUTO_LINK_RE
        base.send :remove_const, :AUTO_LINK_RE
      end

      base.const_set :AUTO_LINK_RE, %r{
                      (                          # leading text
                        <\w+.*?>|                # leading HTML tag, or
                        [^=<>!:'"/]|             # leading punctuation, or
                        ^                        # beginning of line
                      )
                      (
                        (?:https?://)|           # protocol spec, or
                        (?:s?ftps?://)|
                        (?:www\.)                # www.*
                      )
                      (
                        (\S+?)                   # url
                        (\/)?                    # slash
                      )
                      ((?:&gt;)?|[^\S\=\/\(\)]*?|[;\.\,]*?)  # post
                      (?=<|\s|$)
                     }x
    end
  end
end
