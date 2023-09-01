if which swiftformat >/dev/null; then
swiftformat .
else
echo "Warning: SwiftFormat not installed, please brew install swiftformat"
fi
