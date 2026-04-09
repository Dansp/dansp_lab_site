env=local
lang=pt

install:
	bash scripts/fvm-run.sh flutter pub get

clean:
	bash scripts/fvm-run.sh flutter clean

format:
	bash scripts/fvm-run.sh dart format .

analyze:
	bash scripts/fvm-run.sh dart analyze .

test_code:
	bash scripts/fvm-run.sh flutter test

app_coverage:
	ulimit -S -n 2048
	fvm flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

full_test: format analyze test

full_coverage: format analyze coverage

run: .env.$(env)
	bash scripts/fvm-run.sh flutter run -d chrome -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-profile: .env.$(env)
	bash scripts/fvm-run.sh flutter run -d chrome -t lib/main.dart --profile --cache-sksl --purge-persistent-cache $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-release: .env.$(env)
	bash scripts/fvm-run.sh flutter run -d chrome -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-web: .env.$(env)
	bash scripts/fvm-run.sh flutter build web -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

setup-fvm:
	dart pub global activate fvm
	fvm install

setup-verify:
	bash scripts/setup-verify.sh
