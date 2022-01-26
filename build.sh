
(cd ./validator-controller ; ./build)
func -SPA common/stdlib.fc common/nonstdlib.fc common/config_utils.fc proxy.fc -o build/proxy-code.fif
func -SPA common/stdlib.fc common/nonstdlib.fc mocks/config_utils.fc proxy.fc -o build/mocked-proxy-code.fif
