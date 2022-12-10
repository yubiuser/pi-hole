@test "Test running on correct OS" {
  detected_os=$(grep "\bID\b" /etc/os-release | cut -d '=' -f2 | tr -d '"')
  detected_version=$(grep VERSION_ID /etc/os-release | cut -d '=' -f2 | tr -d '"')
  [[ ${detected_os} == "ubuntu" ]]
  [[ ${detected_version} == "22.04" ]]
}
