.PHONY: clean
clean:
	rm -r docs

.PHONY: build
build:
	make clean
	mkdir docs
	cp ./common/index.html ./docs

	make build_elm_reactor
	make build_elm-live
	make build_webpack
	make build_parcel
	make build_esbuild
	make build_vite

.PHONY: build_elm_reactor
build_elm_reactor:
	npm run build -w elm_reactor

	mkdir docs/elm_reactor
	cp -r ./elm_reactor/dist/* ./docs/elm_reactor

.PHONY: build_elm-live
build_elm-live:
	npm run build -w elm-live

	mkdir docs/elm-live
	cp -r ./elm-live/dist/* ./docs/elm-live
	cp ./common/elm-live/index.html ./docs/elm-live

.PHONY: build_webpack
build_webpack:
	npm run build -w webpack

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
	npm run build -w esbuild

	mkdir docs/esbuild
	cp -r ./esbuild/dist/* ./docs/esbuild

.PHONY: build_vite
build_vite:
	cd vite && npx vite build --base /elm-app-templates/vite/

	mkdir docs/vite
	cp -r ./vite/dist/* ./docs/vite
