.PHONY: all
all: 
	make install build

.PHONY: install
install: 
	cd elm_reactor && npm install
	cd elm-live && npm install
	cd webpack && npm install
	cd parcel && npm install
	cd esbuild && npm install
	cd vite && npm install
	cd snowpack && npm install

.PHONY: build
build:
	rm -r docs/elm_reactor
	rm -r docs/elm-live
	rm -r docs/webpack
	rm -r docs/parcel
	rm -r docs/esbuild
	rm -r docs/vite
	rm -r docs/snowpack

	make build_elm_reactor
	make build_elm-live
	make build_webpack
	make build_parcel
	make build_esbuild
	make build_vite
	make build_snowpack

.PHONY: build_elm_reactor
build_elm_reactor:
	cd elm_reactor && npm run build

	mkdir docs/elm_reactor
	cp -r ./elm_reactor/dist/* ./docs/elm_reactor

.PHONY: build_elm-live
build_elm-live:
	cd elm-live && npm run build

	mkdir docs/elm-live
	cp -r ./elm-live/dist/* ./docs/elm-live
	cp ./common/elm-live/index.html ./docs/elm-live

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

.PHONY: build_snowpack
build_snowpack:
	cd snowpack && npx snowpack build --baseUrl /elm-app-templates/snowpack/

	mkdir docs/snowpack
	cp -r ./snowpack/build/* ./docs/snowpack
