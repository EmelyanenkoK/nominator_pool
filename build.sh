
(cd ./validator-controller ; ./build)
func -o build/proxy-code.fif -SPA common/stdlib.fc common/nonstdlib.fc common/config_utils.fc proxy.fc
func -o build/mocked-proxy-code.fif -SPA common/stdlib.fc common/nonstdlib.fc mocks/config_utils.fc proxy.fc
func -o build/mocked-elector-code.fif -SPA common/stdlib.fc mocks/mocked-elector.fc
