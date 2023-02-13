.PHONE: doc
doc:
	sed -i -n '1,/^## Documentation/ p' README.md
	echo '```' >> README.md
	./asv help >> README.md
	echo '```' >> README.md
	echo '## TODO' >> README.md
	sed -nE 's/.*#TODO (.*)/- \1/p' asv >> README.md
