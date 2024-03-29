.PHONY: all
all:
	make install build

.PHONY: install
install:
	cd elm_reactor && npm install
	cd elm-watch && npm install
	cd webpack && npm install
	cd parcel && npm install
	cd esbuild && npm install
	cd vite && npm install

.PHONY: build
build:
	rm -r docs/elm_reactor
	rm -r docs/elm-watch
	rm -r docs/webpack
	rm -r docs/parcel
	rm -r docs/esbuild
	rm -r docs/vite

	make build_elm_reactor
	make build_elm-watch
	make build_webpack
	make build_parcel
	make build_esbuild
	make build_vite

	rm -r docs/static
	cp -r ./elm-watch/public/static ./docs/static

.PHONY: build_elm_reactor
build_elm_reactor:
	cd elm_reactor && npm run build

	mkdir docs/elm_reactor
	cp -r ./elm_reactor/dist/* ./docs/elm_reactor

.PHONY: build_elm-watch
build_elm-watch:
	cd elm-watch && npm run build

	mkdir docs/elm-watch
	cp -r ./elm-watch/public/* ./docs/elm-watch

.PHONY: build_webpack
build_webpack:
	cd webpack && npm run build

	mkdir docs/webpack
	cp -r ./webpack/dist/* ./docs/webpack
	cp ./common/webpack/index.html ./docs/webpack

.PHONY: build_parcel
build_parcel:
	cd parcel && npx parcel build index.html --no-source-maps --public-url /elm-app-templates/parcel/

	mkdir docs/parcel
	cp -r ./parcel/dist/* ./docs/parcel

.PHONY: build_esbuild
build_esbuild:
	cd esbuild && npm run build

	mkdir docs/esbuild
	cp -r ./esbuild/dist/* ./docs/esbuild

.PHONY: build_vite
build_vite:
	cd vite && npx vite build --base /elm-app-templates/vite/

	mkdir docs/vite
	cp -r ./vite/dist/* ./docs/vite
