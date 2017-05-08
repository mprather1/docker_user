groups=($1 adm cdrom sudo plugdev dip)

if [ ! -z ${1+x} ]; then
  adduser $1

  for group in "${groups[@]}"; do
    adduser $1 $group
  done
  printf "${1} ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
else
  echo "Please include username as argument..."
fi
