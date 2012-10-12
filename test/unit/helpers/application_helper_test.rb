# encoding: utf-8
require File.dirname(__FILE__) + '../../../test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def test_auto_links
    to_test = {
        'http://фу.тыква' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>',
        'http://фу.тыква/~тыква' => '<a class="external" href="http://фу.тыква/~тыква">http://фу.тыква/~тыква</a>',
        'http://фу.тыква.' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>.',
        'https://фу.тыква.' => '<a class="external" href="https://фу.тыква">https://фу.тыква</a>.',
        'This is a link: http://фу.тыква.' => 'This is a link: <a class="external" href="http://фу.тыква">http://фу.тыква</a>.',
        'A link (eg. http://фу.тыква).' => 'A link (eg. <a class="external" href="http://фу.тыква">http://фу.тыква</a>).',
        'http://фу.тыква/фу.тыква#тыква.дыня.' => '<a class="external" href="http://фу.тыква/фу.тыква#тыква.дыня">http://фу.тыква/фу.тыква#тыква.дыня</a>.',
        'http://www.фу.тыква/Тыква_(дыня)' => '<a class="external" href="http://www.фу.тыква/Тыква_(дыня)">http://www.фу.тыква/Тыква_(дыня)</a>',
        '(see инлайн линк : http://www.фу.тыква/Тыква_(дыня))' => '(see инлайн линк : <a class="external" href="http://www.фу.тыква/Тыква_(дыня)">http://www.фу.тыква/Тыква_(дыня)</a>)',
        '(see инлайн линк : http://www.фу.тыква/Тыква)' => '(see инлайн линк : <a class="external" href="http://www.фу.тыква/Тыква">http://www.фу.тыква/Тыква</a>)',
        '(see инлайн линк : http://www.фу.тыква/Тыква).' => '(see инлайн линк : <a class="external" href="http://www.фу.тыква/Тыква">http://www.фу.тыква/Тыква</a>).',
        '(see "инлайн линк":http://www.фу.тыква/Тыква_(дыня))' => '(see <a href="http://www.фу.тыква/Тыква_(дыня)" class="external">инлайн линк</a>)',
        '(see "инлайн линк":http://www.фу.тыква/Тыква)' => '(see <a href="http://www.фу.тыква/Тыква" class="external">инлайн линк</a>)',
        '(see "инлайн линк":http://www.фу.тыква/Тыква).' => '(see <a href="http://www.фу.тыква/Тыква" class="external">инлайн линк</a>).',
        'www.фу.тыква' => '<a class="external" href="http://www.фу.тыква">www.фу.тыква</a>',
        'http://фу.тыква/page?p=1&t=z&s=' => '<a class="external" href="http://фу.тыква/page?p=1&#38;t=z&#38;s=">http://фу.тыква/page?p=1&#38;t=z&#38;s=</a>',
        'http://фу.тыква/page#125' => '<a class="external" href="http://фу.тыква/page#125">http://фу.тыква/page#125</a>',
        'http://foo@www.фу.тыква' => '<a class="external" href="http://foo@www.фу.тыква">http://foo@www.фу.тыква</a>',
        'http://foo:bar@www.фу.тыква' => '<a class="external" href="http://foo:bar@www.фу.тыква">http://foo:bar@www.фу.тыква</a>',
        'ftp://фу.тыква' => '<a class="external" href="ftp://фу.тыква">ftp://фу.тыква</a>',
        'ftps://фу.тыква' => '<a class="external" href="ftps://фу.тыква">ftps://фу.тыква</a>',
        'sftp://фу.тыква' => '<a class="external" href="sftp://фу.тыква">sftp://фу.тыква</a>',
        # two exclamation marks
        'http://example.net/path!602815048C7B5C20!302.html' => '<a class="external" href="http://example.net/path!602815048C7B5C20!302.html">http://example.net/path!602815048C7B5C20!302.html</a>',
        # escaping
        'http://фу"тыква' => '<a class="external" href="http://фу&quot;тыква">http://фу"тыква</a>',
        # wrap in angle brackets
        '<http://фу.тыква>' => '&lt;<a class="external" href="http://фу.тыква">http://фу.тыква</a>&gt;',
        'http://фу.тыква.' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>.',
        'http://фу.тыква...' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>...',
        'http://фу.тыква;' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>;',
        'http://фу.тыква,' => '<a class="external" href="http://фу.тыква">http://фу.тыква</a>,'
    }
    to_test.each { |text, result| assert_equal "<p>#{result}</p>", textilizable(text) }
  end
end
