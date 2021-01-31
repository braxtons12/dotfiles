find -name "*.rs" -not -path "./target/*" -exec touch "{}" +
cargo clippy "$@"
