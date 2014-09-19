all: test doc

doc:
	git grep -h "^\s\+# \?" lib/qiita/client.rb   | sed -E 's; +# ?;;' > doc/client.md
	git grep -h "^\s\+# \?" lib/qiita/response.rb | sed -E 's; +# ?;;' > doc/response.md

release:
	bundle exec rake release

setup:
	gem install bundler
	bundle install

test:
	bundle exec rspec

.PHONY: doc release setup test
